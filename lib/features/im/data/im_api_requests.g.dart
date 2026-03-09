// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'im_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetConversationsResult _$GetConversationsResultFromJson(
  Map<String, dynamic> json,
) => _GetConversationsResult(
  conversations:
      (json['conversations'] as List<dynamic>?)
          ?.map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Conversation>[],
);

Map<String, dynamic> _$GetConversationsResultToJson(
  _GetConversationsResult instance,
) => <String, dynamic>{'conversations': instance.conversations};

_GetConversationMessagesPayload _$GetConversationMessagesPayloadFromJson(
  Map<String, dynamic> json,
) => _GetConversationMessagesPayload(
  page: (json['page'] as num?)?.toInt() ?? 1,
  pageSize: (json['page_size'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$GetConversationMessagesPayloadToJson(
  _GetConversationMessagesPayload instance,
) => <String, dynamic>{'page': instance.page, 'page_size': instance.pageSize};

_GetConversationMessagesResult _$GetConversationMessagesResultFromJson(
  Map<String, dynamic> json,
) => _GetConversationMessagesResult(
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Message>[],
);

Map<String, dynamic> _$GetConversationMessagesResultToJson(
  _GetConversationMessagesResult instance,
) => <String, dynamic>{'messages': instance.messages};

_SendMessagePayload _$SendMessagePayloadFromJson(Map<String, dynamic> json) =>
    _SendMessagePayload(
      kind: json['kind'] as String,
      text: json['text'] as String,
      mediaUri: json['media_uri'] as String?,
      metadata: json['metadata'] as String? ?? '',
    );

Map<String, dynamic> _$SendMessagePayloadToJson(_SendMessagePayload instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'text': instance.text,
      'media_uri': instance.mediaUri,
      'metadata': instance.metadata,
    };

_SendMessageResult _$SendMessageResultFromJson(Map<String, dynamic> json) =>
    _SendMessageResult(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendMessageResultToJson(_SendMessageResult instance) =>
    <String, dynamic>{'message': instance.message};

_MarkConversationAsReadPayload _$MarkConversationAsReadPayloadFromJson(
  Map<String, dynamic> json,
) => _MarkConversationAsReadPayload(messageId: json['message_id'] as String);

Map<String, dynamic> _$MarkConversationAsReadPayloadToJson(
  _MarkConversationAsReadPayload instance,
) => <String, dynamic>{'message_id': instance.messageId};

_CreateConversationPayload _$CreateConversationPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateConversationPayload(
  participantIds: (json['participant_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CreateConversationPayloadToJson(
  _CreateConversationPayload instance,
) => <String, dynamic>{'participant_ids': instance.participantIds};

_CreateConversationResult _$CreateConversationResultFromJson(
  Map<String, dynamic> json,
) => _CreateConversationResult(
  conversation: Conversation.fromJson(
    json['conversation'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CreateConversationResultToJson(
  _CreateConversationResult instance,
) => <String, dynamic>{'conversation': instance.conversation};

_SearchConversationCandidatesPayload
_$SearchConversationCandidatesPayloadFromJson(Map<String, dynamic> json) =>
    _SearchConversationCandidatesPayload(
      query: json['query'] as String,
      limit: (json['limit'] as num?)?.toInt() ?? 100,
    );

Map<String, dynamic> _$SearchConversationCandidatesPayloadToJson(
  _SearchConversationCandidatesPayload instance,
) => <String, dynamic>{'query': instance.query, 'limit': instance.limit};

_SearchConversationCandidatesResult
_$SearchConversationCandidatesResultFromJson(Map<String, dynamic> json) =>
    _SearchConversationCandidatesResult(
      candidates:
          (json['candidates'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ConversationCandidate.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ConversationCandidate>[],
    );

Map<String, dynamic> _$SearchConversationCandidatesResultToJson(
  _SearchConversationCandidatesResult instance,
) => <String, dynamic>{'candidates': instance.candidates};
