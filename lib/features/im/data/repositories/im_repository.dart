import 'dart:async';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/im/domain/entities/conversation.dart';
import 'package:learn_go/features/im/domain/entities/message.dart';
import 'package:learn_go/features/auth/domain/account.dart';
import 'package:learn_go/core/config/app_environment.dart';
import 'package:learn_go/core/grpc/grpc_channel.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/features/im/data/generated/conversation.pbgrpc.dart'
    as grpc;
import 'package:learn_go/features/im/data/generated/conversation.pb.dart' as pb;
import 'package:grpc/service_api.dart' as grpc_api;
import 'package:web_socket_channel/web_socket_channel.dart';

final imRepositoryProvider = Provider<IMRepository>((ref) {
  final repo = IMRepository(ref.watch(dioProvider), ref);
  ref.onDispose(() => repo.dispose());
  return repo;
});

class IMRepository {
  final Dio _dio;
  final Ref _ref;
  grpc_api.ClientChannel? _channel;

  IMRepository(this._dio, this._ref);

  void dispose() {
    final ch = _channel;
    _channel = null;
    if (ch != null) {
      unawaited(shutdownGrpcChannel(ch));
    }
  }

  Future<List<Conversation>> getConversations() async {
    final response = await _dio.get('/api/v1/conversations');
    final data = response.data['data'];
    final List<dynamic> list = data['conversations'] ?? [];
    return list.map((e) => Conversation.fromJson(e)).toList();
  }

  Future<List<Message>> getMessages(
    String conversationId, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _dio.get(
      '/api/v1/conversations/$conversationId/messages',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    final data = response.data['data'];
    final List<dynamic> list = data['messages'] ?? [];
    return list.map((e) => Message.fromJson(e)).toList();
  }

  Future<Message> sendMessage(
    String conversationId,
    String text, {
    MessageKind kind = MessageKind.text,
    String? mediaUri,
  }) async {
    final response = await _dio.post(
      '/api/v1/conversations/$conversationId/messages',
      data: {
        'kind': kind.name,
        'text': text,
        'media_uri': mediaUri ?? '',
        'metadata': '',
      },
    );
    final data = response.data['data'];
    return Message.fromJson(data['message']);
  }

  Future<void> markConversationAsRead(
    String conversationId,
    String messageId,
  ) async {
    await _dio.post(
      '/api/v1/conversations/$conversationId/read',
      data: {'message_id': messageId},
    );
  }

  Future<Conversation> createConversation(String participantId) async {
    final response = await _dio.post(
      '/api/v1/conversations',
      data: {
        'participant_ids': [participantId],
      },
    );
    final data = response.data['data'];
    return Conversation.fromJson(data['conversation']);
  }

  Future<List<Account>> getSchoolMembers({String? query, String? role}) async {
    final currentRole = _ref.read(authStateProvider).account?.role;
    final prefix = currentRole == AccountRole.teacher ? 'teacher' : 'student';

    final response = await _dio.get(
      '/api/v1/$prefix/school/members',
      queryParameters: {
        if (query != null && query.isNotEmpty) 'query': query,
        if (role != null && role.isNotEmpty) 'role': role,
      },
    );
    final data = response.data['data'];
    final List<dynamic> list = data['members'] ?? [];
    return list.map((e) => Account.fromJson(e)).toList();
  }

  ResponseStream<pb.ConversationStreamResponse> subscribeConversation(
    String conversationId,
  ) {
    final token = _ref.read(authStateProvider).tokens?.accessToken;
    if (token == null) {
      throw Exception('Not authenticated');
    }

    if (conversationId.trim().isEmpty) {
      throw ArgumentError.value(conversationId, 'conversationId');
    }

    final env = _ref.read(appEnvironmentProvider);
    _channel ??= createGrpcChannel(env);

    final client = grpc.ConversationServiceClient(
      _channel!,
      options: CallOptions(metadata: {'authorization': 'Bearer $token'}),
    );

    return client.subscribe(
      pb.JoinConversation()..conversationId = conversationId,
    );
  }

  /// Connect to a bidirectional conversation stream.
  ///
  /// - Web: uses `/ws/im` WebSocket on API host/port, with protobuf binary frames.
  /// - Non-web: uses native gRPC bidi `Stream`.
  IMConversationBidiConnection connectConversationBidi(String conversationId) {
    final token = _ref.read(authStateProvider).tokens?.accessToken;
    if (token == null) {
      throw Exception('Not authenticated');
    }
    if (conversationId.trim().isEmpty) {
      throw ArgumentError.value(conversationId, 'conversationId');
    }

    final env = _ref.read(appEnvironmentProvider);

    if (kIsWeb) {
      final apiUri = Uri.parse(env.apiBaseUrl);
      final scheme = apiUri.scheme.isEmpty ? 'http' : apiUri.scheme;
      final wsScheme = scheme == 'https' ? 'wss' : 'ws';

      // Browsers can't set custom headers in WebSocket; send token via query.
      final wsUri = Uri(
        scheme: wsScheme,
        host: apiUri.host,
        port: apiUri.hasPort ? apiUri.port : null,
        path: '/ws/im',
        queryParameters: {'token': token},
      );

      final channel = WebSocketChannel.connect(wsUri);
      return IMConversationBidiConnection._ws(channel, conversationId);
    }

    _channel ??= createGrpcChannel(env);
    final client = grpc.ConversationServiceClient(
      _channel!,
      options: CallOptions(metadata: {'authorization': 'Bearer $token'}),
    );

    final requestController = StreamController<pb.ConversationStreamRequest>();
    final responseStream = client.stream(requestController.stream);
    final connection = IMConversationBidiConnection._grpc(
      requestController,
      responseStream,
      conversationId,
    );

    // Join must be first.
    connection.send(
      pb.ConversationStreamRequest()
        ..join = (pb.JoinConversation()..conversationId = conversationId),
    );

    return connection;
  }

  /// Subscribe to IM inbox events (all conversations) via a single server-streaming RPC.
  /// The server is responsible for aggregating and pushing events.
  ResponseStream<pb.ConversationStreamResponse> subscribeInbox() {
    final token = _ref.read(authStateProvider).tokens?.accessToken;
    if (token == null) {
      throw Exception('Not authenticated');
    }

    final env = _ref.read(appEnvironmentProvider);
    _channel ??= createGrpcChannel(env);

    final client = grpc.ConversationServiceClient(
      _channel!,
      options: CallOptions(metadata: {'authorization': 'Bearer $token'}),
    );

    // Request payload is unused by the server; we keep JoinConversation for
    // compatibility with checked-in generated stubs.
    return client.subscribeInbox(pb.JoinConversation());
  }
}

class IMConversationBidiConnection {
  final StreamController<pb.ConversationStreamRequest>? _grpcRequests;
  final ResponseStream<pb.ConversationStreamResponse>? _grpcResponses;
  final WebSocketChannel? _ws;
  final StreamController<pb.ConversationStreamResponse> _responsesController =
      StreamController.broadcast();

  final String conversationId;
  bool _closed = false;

  IMConversationBidiConnection._grpc(
    this._grpcRequests,
    this._grpcResponses,
    this.conversationId,
  ) : _ws = null {
    _grpcResponses!.listen(
      _responsesController.add,
      onError: _responsesController.addError,
      onDone: () {
        if (!_responsesController.isClosed) {
          _responsesController.close();
        }
      },
    );
  }

  IMConversationBidiConnection._ws(this._ws, this.conversationId)
    : _grpcRequests = null,
      _grpcResponses = null {
    // Send join first.
    send(
      pb.ConversationStreamRequest()
        ..join = (pb.JoinConversation()..conversationId = conversationId),
    );

    _ws!.stream.listen(
      (event) {
        final bytes = _coerceToBytes(event);
        if (bytes == null) return;
        try {
          _responsesController.add(
            pb.ConversationStreamResponse.fromBuffer(bytes),
          );
        } catch (e) {
          _responsesController.addError(e);
        }
      },
      onError: _responsesController.addError,
      onDone: () {
        if (!_responsesController.isClosed) {
          _responsesController.close();
        }
      },
    );
  }

  Stream<pb.ConversationStreamResponse> get responses =>
      _responsesController.stream;

  void send(pb.ConversationStreamRequest req) {
    if (_closed) return;
    if (_grpcRequests != null) {
      _grpcRequests.add(req);
      return;
    }
    if (_ws != null) {
      _ws.sink.add(Uint8List.fromList(req.writeToBuffer()));
    }
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;

    await _grpcRequests?.close();
    await _ws?.sink.close();
    if (!_responsesController.isClosed) {
      await _responsesController.close();
    }
  }

  static Uint8List? _coerceToBytes(Object? event) {
    if (event == null) return null;
    if (event is Uint8List) return event;
    if (event is List<int>) return Uint8List.fromList(event);
    if (event is ByteBuffer) return event.asUint8List();
    return null;
  }
}
