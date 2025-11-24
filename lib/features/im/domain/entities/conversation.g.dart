// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      type: $enumDecode(_$ConversationTypeEnumMap, json['type']),
      schoolId: json['school_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      lastMessage: json['last_message'] == null
          ? null
          : Message.fromJson(json['last_message'] as Map<String, dynamic>),
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      members:
          (json['members'] as List<dynamic>?)
              ?.map(
                (e) => ConversationMember.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ConversationTypeEnumMap[instance.type]!,
      'school_id': instance.schoolId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'last_message': instance.lastMessage,
      'unread_count': instance.unreadCount,
      'members': instance.members,
    };

const _$ConversationTypeEnumMap = {
  ConversationType.direct: 'direct',
  ConversationType.group: 'group',
};

_ConversationMember _$ConversationMemberFromJson(Map<String, dynamic> json) =>
    _ConversationMember(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      accountId: json['account_id'] as String,
      accountName: json['account_name'] as String?,
      role: $enumDecode(_$AccountRoleEnumMap, json['role']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ConversationMemberToJson(_ConversationMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'account_id': instance.accountId,
      'account_name': instance.accountName,
      'role': _$AccountRoleEnumMap[instance.role]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$AccountRoleEnumMap = {
  AccountRole.admin: 'admin',
  AccountRole.teacher: 'teacher',
  AccountRole.student: 'student',
};
