// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  conversationId: json['conversation_id'] as String,
  senderId: json['sender_id'] as String,
  senderRole: $enumDecode(_$AccountRoleEnumMap, json['sender_role']),
  kind: $enumDecode(_$MessageKindEnumMap, json['kind']),
  text: json['text'] as String? ?? '',
  mediaUri: json['media_uri'] as String?,
  metadata: json['metadata'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'conversation_id': instance.conversationId,
  'sender_id': instance.senderId,
  'sender_role': _$AccountRoleEnumMap[instance.senderRole]!,
  'kind': _$MessageKindEnumMap[instance.kind]!,
  'text': instance.text,
  'media_uri': instance.mediaUri,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
};

const _$AccountRoleEnumMap = {
  AccountRole.admin: 'admin',
  AccountRole.teacher: 'teacher',
  AccountRole.student: 'student',
};

const _$MessageKindEnumMap = {
  MessageKind.text: 'text',
  MessageKind.image: 'image',
  MessageKind.video: 'video',
  MessageKind.audio: 'audio',
  MessageKind.file: 'file',
};
