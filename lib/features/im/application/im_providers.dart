import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/features/im/data/repositories/im_repository.dart';
import 'package:learn_go/features/im/domain/entities/conversation.dart';
import 'package:learn_go/features/im/domain/entities/message.dart';
import 'package:learn_go/features/im/data/generated/conversation.pb.dart' as pb;
import 'package:learn_go/features/im/data/generated/google/protobuf/timestamp.pb.dart'
    as $google_pb;
import 'package:learn_go/features/auth/domain/account.dart';

/// Keep IM gRPC subscriptions alive after login so conversation list/unread
/// badges can update even when user is not inside a specific chat screen.
final imRealtimeSyncProvider = Provider<IMRealtimeSync>((ref) {
  final sync = IMRealtimeSync(ref);
  ref.onDispose(sync.dispose);
  return sync;
});

class IMRealtimeSync {
  final Ref _ref;
  StreamSubscription<pb.ConversationStreamResponse>? _eventSub;
  Timer? _refreshDebounce;
  bool _active = false;

  IMRealtimeSync(this._ref) {
    _ref.listen<AuthState>(authStateProvider, (previous, next) {
      final wasAuthed = previous?.hasTokens ?? false;
      final isAuthed = next.hasTokens;

      if (!wasAuthed && isAuthed) {
        _start();
      } else if (wasAuthed && !isAuthed) {
        _stop();
      }
    });

    // Handle the case where provider is first created after user is already
    // authenticated.
    if (_ref.read(authStateProvider).hasTokens) {
      _start();
    }
  }

  void _start() {
    if (_active) return;
    _active = true;

    final repository = _ref.read(imRepositoryProvider);

    // Force an initial conversation list fetch so UI has up-to-date data.
    unawaited(_ref.read(conversationsProvider.future));

    _eventSub = repository.subscribeInbox().listen(
      (event) {
        // Any read/new-message event can affect unreadCount/preview.
        if (event.hasMessageEvent() || event.hasReadEvent()) {
          _scheduleConversationListRefresh();
        }
      },
      onError: (e) {
        debugPrint('IM realtime event stream error: $e');
      },
    );
  }

  void _stop() {
    if (!_active) return;
    _active = false;

    _refreshDebounce?.cancel();
    _refreshDebounce = null;

    _eventSub?.cancel();
    _eventSub = null;
  }

  void _scheduleConversationListRefresh() {
    _refreshDebounce?.cancel();
    _refreshDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!_active) return;
      _ref.invalidate(conversationsProvider);
    });
  }

  void dispose() {
    _stop();
  }
}

final conversationsProvider = FutureProvider<List<Conversation>>((ref) async {
  final repository = ref.watch(imRepositoryProvider);
  return repository.getConversations();
});

final imServiceProvider = Provider<IMService>((ref) {
  final repository = ref.watch(imRepositoryProvider);
  final service = IMService(repository);
  ref.onDispose(() => service.dispose());
  return service;
});

class IMService {
  final IMRepository _repository;
  final StreamController<pb.ConversationStreamResponse> _mergedController =
      StreamController.broadcast();
  final Set<String> _joinedConversations = {};
  bool _isDisposed = false;

  final Map<String, StreamSubscription<pb.ConversationStreamResponse>>
  _subscriptions = {};
  final Map<String, Timer> _reconnectTimers = {};

  IMService(this._repository);

  void _ensureSubscribed(String conversationId) {
    if (_isDisposed) return;
    if (_subscriptions.containsKey(conversationId)) return;
    _startSubscription(conversationId);
  }

  void _startSubscription(String conversationId) {
    if (_isDisposed) return;
    if (!_joinedConversations.contains(conversationId)) return;

    _subscriptions[conversationId]?.cancel();

    try {
      final stream = _repository.subscribeConversation(conversationId);
      _subscriptions[conversationId] = stream.listen(
        (event) => _mergedController.add(event),
        onError: (e) {
          debugPrint('gRPC Stream Error: $e');
          _scheduleReconnect(conversationId);
        },
        onDone: () {
          debugPrint('gRPC Stream Closed');
          _scheduleReconnect(conversationId);
        },
      );
    } catch (e) {
      debugPrint('gRPC Connection Error: $e');
      _scheduleReconnect(conversationId);
    }
  }

  void _scheduleReconnect(String conversationId) {
    if (_isDisposed) return;
    if (!_joinedConversations.contains(conversationId)) return;

    _reconnectTimers[conversationId]?.cancel();
    _reconnectTimers[conversationId] = Timer(const Duration(seconds: 3), () {
      if (_isDisposed) return;
      if (!_joinedConversations.contains(conversationId)) return;
      debugPrint('Reconnecting gRPC stream...');
      _startSubscription(conversationId);
    });
  }

  Stream<pb.ConversationStreamResponse> get stream => _mergedController.stream;

  void joinConversation(String conversationId) {
    _joinedConversations.add(conversationId);
    _ensureSubscribed(conversationId);
  }

  void leaveConversation(String conversationId) {
    _joinedConversations.remove(conversationId);

    _reconnectTimers.remove(conversationId)?.cancel();
    _subscriptions.remove(conversationId)?.cancel();
  }

  Future<void> markAsRead(String conversationId, String messageId) async {
    await _repository.markConversationAsRead(conversationId, messageId);
  }

  void emitLocalMessage(Message message) {
    final pbMessage = pb.Message()
      ..id = message.id
      ..conversationId = message.conversationId
      ..senderId = message.senderId
      ..senderRole = message.senderRole.apiValue
      ..kind = message.kind.name
      ..text = message.text
      ..createdAt = $google_pb.Timestamp.fromDateTime(message.createdAt);

    if (message.mediaUri != null) pbMessage.mediaUri = message.mediaUri!;
    if (message.metadata != null) pbMessage.metadata = message.metadata!;

    final event = pb.ConversationStreamResponse()
      ..messageEvent = (pb.MessageCreatedEvent()..message = pbMessage);

    _mergedController.add(event);
  }

  void dispose() {
    _isDisposed = true;

    _joinedConversations.clear();

    for (final t in _reconnectTimers.values) {
      t.cancel();
    }
    _reconnectTimers.clear();

    for (final sub in _subscriptions.values) {
      sub.cancel();
    }
    _subscriptions.clear();

    _mergedController.close();
  }
}

final messagesProvider = StreamProvider.autoDispose
    .family<List<Message>, String>((ref, conversationId) {
      final repository = ref.watch(imRepositoryProvider);
      final imService = ref.watch(imServiceProvider);
      final controller = StreamController<List<Message>>();
      List<Message> currentMessages = [];

      // Initial fetch via REST
      repository
          .getMessages(conversationId)
          .then((messages) {
            currentMessages = messages.reversed.toList();
            controller.add(currentMessages);
          })
          .catchError((e) {
            controller.addError(e);
          });

      // Join conversation via gRPC
      imService.joinConversation(conversationId);

      // Listen to gRPC stream
      final subscription = imService.stream.listen((event) {
        if (event.hasMessageEvent()) {
          final msgEvent = event.messageEvent;
          final msg = msgEvent.message;

          if (msg.conversationId == conversationId) {
            // Map proto Message to domain Message
            final domainMessage = Message(
              id: msg.id,
              conversationId: msg.conversationId,
              senderId: msg.senderId,
              senderRole: _mapRole(msg.senderRole),
              kind: _mapKind(msg.kind),
              text: msg.text,
              mediaUri: msg.mediaUri.isNotEmpty ? msg.mediaUri : null,
              metadata: msg.metadata.isNotEmpty ? msg.metadata : null,
              createdAt: msg.createdAt.toDateTime(),
            );

            // Avoid duplicates if necessary (prepend)
            if (!currentMessages.any((m) => m.id == domainMessage.id)) {
              currentMessages = [domainMessage, ...currentMessages];
              controller.add(currentMessages);
            }
          }
        }
      });

      ref.onDispose(() {
        subscription.cancel();
        controller.close();
        imService.leaveConversation(conversationId);
      });

      return controller.stream;
    });

AccountRole _mapRole(String role) {
  // TODO: Handle 'ai' role properly. Currently mapping to student to avoid crash.
  // Ideally Message entity should support AI role.
  switch (role.toLowerCase()) {
    case 'user':
    case 'student':
      return AccountRole.student;
    case 'teacher':
      return AccountRole.teacher;
    case 'admin':
    case 'system':
      return AccountRole.admin;
    case 'ai':
      return AccountRole.ai;
    default:
      return AccountRole.student;
  }
}

MessageKind _mapKind(String kind) {
  switch (kind.toLowerCase()) {
    case 'text':
      return MessageKind.text;
    case 'image':
      return MessageKind.image;
    case 'video':
      return MessageKind.video;
    case 'audio':
      return MessageKind.audio;
    case 'file':
      return MessageKind.file;
    default:
      return MessageKind.text;
  }
}

final imControllerProvider = Provider((ref) => IMController(ref));

class IMController {
  final Ref _ref;

  IMController(this._ref);

  Future<void> sendMessage(
    String conversationId,
    String text, {
    MessageKind kind = MessageKind.text,
    String? mediaUri,
  }) async {
    final repository = _ref.read(imRepositoryProvider);
    final imService = _ref.read(imServiceProvider);

    final sentMessage = await repository.sendMessage(
      conversationId,
      text,
      kind: kind,
      mediaUri: mediaUri,
    );
    // Optimistically update the stream to ensure UI updates immediately
    imService.emitLocalMessage(sentMessage);

    // Refresh conversation list to update the latest message preview
    await refreshConversations();
  }

  Future<void> refreshConversations() async {
    _ref.invalidate(conversationsProvider);
  }
}
