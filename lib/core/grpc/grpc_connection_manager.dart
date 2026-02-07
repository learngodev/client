import 'dart:async';
import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart' as grpc_api;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/config/app_environment.dart';
import 'package:learn_go/core/utils/logger.dart';
import 'package:learn_go/core/grpc/grpc_channel.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/generated/proto/notification.pbgrpc.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

enum GrpcConnectionStatus {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error,
}

class GrpcConnectionState {
  const GrpcConnectionState({
    required this.status,
    this.attempt = 0,
    this.lastErrorMessage,
    this.nextRetryIn,
  });

  const GrpcConnectionState.disconnected()
    : this(status: GrpcConnectionStatus.disconnected);

  final GrpcConnectionStatus status;
  final int attempt;
  final String? lastErrorMessage;
  final Duration? nextRetryIn;

  GrpcConnectionState copyWith({
    GrpcConnectionStatus? status,
    int? attempt,
    String? lastErrorMessage,
    Duration? nextRetryIn,
  }) {
    return GrpcConnectionState(
      status: status ?? this.status,
      attempt: attempt ?? this.attempt,
      lastErrorMessage: lastErrorMessage ?? this.lastErrorMessage,
      nextRetryIn: nextRetryIn ?? this.nextRetryIn,
    );
  }
}

class GrpcConnectionManager extends Notifier<GrpcConnectionState> {
  grpc_api.ClientChannel? _channel;
  NotificationServiceClient? _notificationClient;

  StreamController<NotificationEvent>? _notificationController;
  StreamSubscription<NotificationStreamResponse>? _notificationSub;

  Timer? _reconnectTimer;
  int _generation = 0;
  bool _disposed = false;

  final _rng = Random();

  Stream<NotificationEvent> get notificationEvents {
    return _notificationController!.stream;
  }

  @override
  GrpcConnectionState build() {
    _notificationController ??= StreamController<NotificationEvent>.broadcast();

    ref.onDispose(() {
      _disposed = true;
      _cancelReconnectTimer();
      unawaited(_shutdownChannel());
      unawaited(_notificationSub?.cancel());
      _notificationSub = null;
      unawaited(_notificationController?.close());
      _notificationController = null;
    });

    ref.listen<AuthState>(authStateProvider, (prev, next) {
      final wasAuthed = prev?.isAuthenticated ?? false;
      final isAuthed = next.isAuthenticated;

      // 登录：立即开始连接（并启动订阅循环）
      if (!wasAuthed && isAuthed) {
        _startOrRestart();
        return;
      }

      // 退出：立即断开
      if (wasAuthed && !isAuthed) {
        _stop();
        return;
      }

      // token 变化：重启连接，保证 metadata 更新
      final prevToken = prev?.tokens?.accessToken;
      final nextToken = next.tokens?.accessToken;
      if (isAuthed && prevToken != nextToken) {
        _startOrRestart();
      }
    });

    return const GrpcConnectionState.disconnected();
  }

  void _startOrRestart() {
    if (_disposed) return;
    _generation++;
    _cancelReconnectTimer();
    unawaited(_restartNow(_generation));
  }

  void _stop() {
    if (_disposed) return;
    _generation++;
    _cancelReconnectTimer();
    state = const GrpcConnectionState.disconnected();
    unawaited(_notificationSub?.cancel());
    _notificationSub = null;
    unawaited(_shutdownChannel());
  }

  Future<void> _restartNow(int gen) async {
    await _notificationSub?.cancel();
    _notificationSub = null;
    await _shutdownChannel();

    if (_disposed || gen != _generation) return;

    final auth = ref.read(authStateProvider);
    final token = auth.tokens?.accessToken;
    if (!auth.isAuthenticated || token == null || token.isEmpty) {
      state = const GrpcConnectionState.disconnected();
      return;
    }

    state = state.copyWith(
      status: state.status == GrpcConnectionStatus.connected
          ? GrpcConnectionStatus.reconnecting
          : GrpcConnectionStatus.connecting,
      attempt: 0,
      lastErrorMessage: null,
      nextRetryIn: null,
    );

    _ensureChannel();

    // 启动“长连接”订阅：后续 IM/实时功能可以复用同一个 channel
    _startNotificationSubscriptionLoop(gen);
  }

  void _startNotificationSubscriptionLoop(int gen) {
    if (_disposed || gen != _generation) return;

    final auth = ref.read(authStateProvider);
    final token = auth.tokens?.accessToken;
    if (!auth.isAuthenticated || token == null || token.isEmpty) {
      state = const GrpcConnectionState.disconnected();
      return;
    }

    final callOptions = CallOptions(
      metadata: {'authorization': 'Bearer $token'},
    );

    late final Stream<NotificationStreamResponse> call;
    try {
      call = _notificationClient!.subscribe(Empty(), options: callOptions);
    } catch (e) {
      _scheduleReconnect(gen, e);
      return;
    }

    _notificationSub = call.listen(
      (resp) {
        if (_disposed || gen != _generation) return;
        if (resp.hasNotification()) {
          _notificationController?.add(resp.notification);
        }
        if (state.status != GrpcConnectionStatus.connected) {
          state = state.copyWith(status: GrpcConnectionStatus.connected);
        }
      },
      onError: (Object err, StackTrace st) {
        if (_disposed || gen != _generation) return;
        _scheduleReconnect(gen, err);
      },
      onDone: () {
        if (_disposed || gen != _generation) return;
        _scheduleReconnect(gen, StateError('gRPC stream closed'));
      },
      cancelOnError: true,
    );
  }

  void _ensureChannel() {
    if (_channel != null) return;

    final env = ref.read(appEnvironmentProvider);
    _channel = createGrpcChannel(env);

    _notificationClient = NotificationServiceClient(_channel!);
  }

  Future<void> _shutdownChannel() async {
    final ch = _channel;
    _channel = null;
    _notificationClient = null;

    if (ch == null) return;
    try {
      await shutdownGrpcChannel(ch);
    } catch (_) {
      // ignore: best-effort
    }
  }

  void _scheduleReconnect(int gen, Object error) {
    if (_disposed || gen != _generation) return;

    final auth = ref.read(authStateProvider);
    if (!auth.isAuthenticated) {
      state = const GrpcConnectionState.disconnected();
      return;
    }

    // 认证失败：避免疯狂重试，等待 token 变化（或用户重新登录）
    if (error is GrpcError &&
        (error.code == StatusCode.unauthenticated ||
            error.code == StatusCode.permissionDenied)) {
      state = state.copyWith(
        status: GrpcConnectionStatus.error,
        lastErrorMessage: error.message ?? error.toString(),
        nextRetryIn: const Duration(seconds: 10),
      );
      _setReconnectTimer(gen, const Duration(seconds: 10));
      return;
    }

    final nextAttempt = (state.attempt) + 1;

    // 指数退避 + 抖动：1s -> 2s -> 4s ... capped 30s
    final baseSeconds = min(30, 1 << min(10, nextAttempt));
    final jitterMs = _rng.nextInt(1000);
    final delay =
        Duration(seconds: baseSeconds) + Duration(milliseconds: jitterMs);

    state = state.copyWith(
      status: GrpcConnectionStatus.reconnecting,
      attempt: nextAttempt,
      lastErrorMessage: error.toString(),
      nextRetryIn: delay,
    );

    logger.w('[gRPC] reconnect in $delay (attempt=$nextAttempt): $error');

    _setReconnectTimer(gen, delay);
  }

  void _setReconnectTimer(int gen, Duration delay) {
    _cancelReconnectTimer();
    _reconnectTimer = Timer(delay, () {
      if (_disposed || gen != _generation) return;
      _startOrRestart();
    });
  }

  void _cancelReconnectTimer() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }
}

final grpcConnectionManagerProvider =
    NotifierProvider<GrpcConnectionManager, GrpcConnectionState>(
      GrpcConnectionManager.new,
    );

final grpcNotificationEventsProvider = Provider<Stream<NotificationEvent>>((
  ref,
) {
  return ref.watch(grpcConnectionManagerProvider.notifier).notificationEvents;
});
