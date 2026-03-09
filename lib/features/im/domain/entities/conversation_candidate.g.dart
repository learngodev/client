// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationCandidate _$ConversationCandidateFromJson(
  Map<String, dynamic> json,
) => _ConversationCandidate(
  id: json['id'] as String,
  displayName: json['display_name'] as String,
  role: $enumDecode(_$AccountRoleEnumMap, json['role']),
);

Map<String, dynamic> _$ConversationCandidateToJson(
  _ConversationCandidate instance,
) => <String, dynamic>{
  'id': instance.id,
  'display_name': instance.displayName,
  'role': _$AccountRoleEnumMap[instance.role]!,
};

const _$AccountRoleEnumMap = {
  AccountRole.admin: 'admin',
  AccountRole.teacher: 'teacher',
  AccountRole.student: 'student',
  AccountRole.ai: 'ai',
};
