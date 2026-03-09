import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/base_request.dart';
import '../domain/entities/conversation_candidate.dart';
import '../domain/entities/conversation.dart';
import '../domain/entities/message.dart';

part 'im_api_requests.freezed.dart';
part 'im_api_requests.g.dart';

@freezed
abstract class GetConversationsResult with _$GetConversationsResult {
  const factory GetConversationsResult({
    @Default(<Conversation>[]) List<Conversation> conversations,
  }) = _GetConversationsResult;

  factory GetConversationsResult.fromJson(Map<String, dynamic> json) =>
      _$GetConversationsResultFromJson(json);
}

class GetConversationsRequest extends BaseRequest<void, List<Conversation>> {
  GetConversationsRequest()
    : super(
        '/api/v1/conversations',
        HttpMethod.get,
        fallbackMessage: '获取会话列表失败',
        responseParser: (value) =>
            GetConversationsResult.fromJson(value).conversations,
      );
}

@freezed
abstract class GetConversationMessagesPayload
    with _$GetConversationMessagesPayload {
  const factory GetConversationMessagesPayload({
    @Default(1) int page,
    @Default(20) int pageSize,
  }) = _GetConversationMessagesPayload;

  factory GetConversationMessagesPayload.fromJson(Map<String, dynamic> json) =>
      _$GetConversationMessagesPayloadFromJson(json);
}

@freezed
abstract class GetConversationMessagesResult
    with _$GetConversationMessagesResult {
  const factory GetConversationMessagesResult({
    @Default(<Message>[]) List<Message> messages,
  }) = _GetConversationMessagesResult;

  factory GetConversationMessagesResult.fromJson(Map<String, dynamic> json) =>
      _$GetConversationMessagesResultFromJson(json);
}

class GetConversationMessagesRequest
    extends BaseRequest<GetConversationMessagesPayload, List<Message>> {
  GetConversationMessagesRequest({required String conversationId})
    : super(
        '/api/v1/conversations/$conversationId/messages',
        HttpMethod.get,
        fallbackMessage: '获取消息列表失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            GetConversationMessagesResult.fromJson(value).messages,
      );
}

@freezed
abstract class SendMessagePayload with _$SendMessagePayload {
  const factory SendMessagePayload({
    required String kind,
    required String text,
    String? mediaUri,
    @Default('') String metadata,
  }) = _SendMessagePayload;

  factory SendMessagePayload.fromJson(Map<String, dynamic> json) =>
      _$SendMessagePayloadFromJson(json);
}

@freezed
abstract class SendMessageResult with _$SendMessageResult {
  const factory SendMessageResult({required Message message}) =
      _SendMessageResult;

  factory SendMessageResult.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResultFromJson(json);
}

class SendMessageRequest extends BaseRequest<SendMessagePayload, Message> {
  SendMessageRequest({required String conversationId})
    : super(
        '/api/v1/conversations/$conversationId/messages',
        HttpMethod.post,
        fallbackMessage: '发送消息失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => SendMessageResult.fromJson(value).message,
      );
}

@freezed
abstract class MarkConversationAsReadPayload
    with _$MarkConversationAsReadPayload {
  const factory MarkConversationAsReadPayload({required String messageId}) =
      _MarkConversationAsReadPayload;

  factory MarkConversationAsReadPayload.fromJson(Map<String, dynamic> json) =>
      _$MarkConversationAsReadPayloadFromJson(json);
}

class MarkConversationAsReadRequest
    extends BaseRequest<MarkConversationAsReadPayload, void> {
  MarkConversationAsReadRequest({required String conversationId})
    : super(
        '/api/v1/conversations/$conversationId/read',
        HttpMethod.post,
        fallbackMessage: '标记会话已读失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class CreateConversationPayload with _$CreateConversationPayload {
  const factory CreateConversationPayload({
    required List<String> participantIds,
  }) = _CreateConversationPayload;

  factory CreateConversationPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationPayloadFromJson(json);
}

@freezed
abstract class CreateConversationResult with _$CreateConversationResult {
  const factory CreateConversationResult({required Conversation conversation}) =
      _CreateConversationResult;

  factory CreateConversationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationResultFromJson(json);
}

class CreateConversationRequest
    extends BaseRequest<CreateConversationPayload, Conversation> {
  CreateConversationRequest()
    : super(
        '/api/v1/conversations',
        HttpMethod.post,
        fallbackMessage: '创建会话失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) =>
            CreateConversationResult.fromJson(value).conversation,
      );
}

@freezed
abstract class SearchConversationCandidatesPayload
    with _$SearchConversationCandidatesPayload {
  const factory SearchConversationCandidatesPayload({
    required String query,
    @Default(100) int limit,
  }) = _SearchConversationCandidatesPayload;

  factory SearchConversationCandidatesPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchConversationCandidatesPayloadFromJson(json);
}

@freezed
abstract class SearchConversationCandidatesResult
    with _$SearchConversationCandidatesResult {
  const factory SearchConversationCandidatesResult({
    @Default(<ConversationCandidate>[]) List<ConversationCandidate> candidates,
  }) = _SearchConversationCandidatesResult;

  factory SearchConversationCandidatesResult.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchConversationCandidatesResultFromJson(json);
}

class SearchConversationCandidatesRequest
    extends
        BaseRequest<
          SearchConversationCandidatesPayload,
          List<ConversationCandidate>
        > {
  SearchConversationCandidatesRequest()
    : super(
        '/api/v1/conversations/candidates',
        HttpMethod.get,
        fallbackMessage: '搜索会话对象失败',
        queryParameters: (value) {
          final query = value.query.trim();
          return {'query': query, 'limit': value.limit};
        },
        responseParser: (value) =>
            SearchConversationCandidatesResult.fromJson(value).candidates,
      );
}
