// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  id: json['id'] as String? ?? '',
  schoolId: json['school_id'] as String? ?? '',
  identifier: json['identifier'] as String? ?? '',
  displayName: json['display_name'] as String? ?? '',
  role:
      $enumDecodeNullable(_$AccountRoleEnumMap, json['role']) ??
      AccountRole.student,
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'id': instance.id,
  'school_id': instance.schoolId,
  'identifier': instance.identifier,
  'display_name': instance.displayName,
  'role': _$AccountRoleEnumMap[instance.role]!,
};

const _$AccountRoleEnumMap = {
  AccountRole.admin: 'admin',
  AccountRole.teacher: 'teacher',
  AccountRole.student: 'student',
  AccountRole.ai: 'ai',
};
