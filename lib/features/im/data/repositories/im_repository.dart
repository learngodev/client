import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:dio/dio.dart';
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
