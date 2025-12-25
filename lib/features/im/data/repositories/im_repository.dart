import 'package:grpc/grpc.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/im/domain/entities/conversation.dart';
import 'package:learn_go/features/im/domain/entities/message.dart';
import 'package:learn_go/features/auth/domain/account.dart';
import 'package:learn_go/core/config/app_environment.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/features/im/data/generated/conversation.pbgrpc.dart'
    as grpc;
import 'package:learn_go/features/im/data/generated/conversation.pb.dart' as pb;

final imRepositoryProvider = Provider<IMRepository>((ref) {
  final repo = IMRepository(
    ref.watch(dioProvider),
    ref.watch(appEnvironmentProvider).apiBaseUrl,
    ref,
  );
  ref.onDispose(() => repo.dispose());
  return repo;
});

class IMRepository {
  final Dio _dio;
  final String _baseUrl;
  final Ref _ref;
  ClientChannel? _channel;

  IMRepository(this._dio, this._baseUrl, this._ref);

  void dispose() {
    _channel?.shutdown();
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

  ResponseStream<pb.ConversationStreamResponse> connectToStream(
    Stream<pb.ConversationStreamRequest> requestStream,
  ) {
    final token = _ref.read(authStateProvider).tokens?.accessToken;
    if (token == null) {
      throw Exception('Not authenticated');
    }

    final uri = Uri.parse(_baseUrl);
    final host = uri.host;
    // gRPC 服务通常运行在独立的端口 (默认 9090)。
    // 如果您的服务器使用了端口映射 (如 Docker)，请确保此处使用的是映射后的 gRPC 端口。
    // 如果 _baseUrl 中的端口 (如 6549) 是 HTTP 端口，请不要直接使用它，除非 gRPC 也复用了该端口。
    const grpcPort = 9090;

    _channel ??= ClientChannel(
      host,
      port: grpcPort,
      options: ChannelOptions(
        credentials: uri.scheme == 'https'
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
        keepAlive: const ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 30),
          timeout: Duration(seconds: 10),
          permitWithoutCalls: true,
        ),
      ),
    );

    final client = grpc.ConversationServiceClient(
      _channel!,
      options: CallOptions(metadata: {'authorization': 'Bearer $token'}),
    );

    return client.stream(requestStream);
  }
}
