// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminAccount _$AdminAccountFromJson(Map<String, dynamic> json) =>
    _AdminAccount(
      id: json['id'] as String? ?? '',
      profileId: json['profile_id'] as String?,
      role: _parseRole(json['role']),
      name: json['name'] as String? ?? '',
      identifier: json['identifier'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String?,
      departmentId: json['department_id'] as String?,
      department: json['department'] as String?,
      classId: json['class_id'] as String?,
      className: json['class_name'] as String?,
      status: _parseStatus(json['status']),
      lastActiveAt: _parseNullableDate(json['last_active_at']),
      createdAt: _parseDate(json['created_at']),
    );

Map<String, dynamic> _$AdminAccountToJson(_AdminAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_id': instance.profileId,
      'role': _$AdminAccountRoleEnumMap[instance.role]!,
      'name': instance.name,
      'identifier': instance.identifier,
      'email': instance.email,
      'phone': instance.phone,
      'department_id': instance.departmentId,
      'department': instance.department,
      'class_id': instance.classId,
      'class_name': instance.className,
      'status': _$AdminAccountStatusEnumMap[instance.status]!,
      'last_active_at': instance.lastActiveAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$AdminAccountRoleEnumMap = {
  AdminAccountRole.teacher: 'teacher',
  AdminAccountRole.student: 'student',
};

const _$AdminAccountStatusEnumMap = {
  AdminAccountStatus.active: 'active',
  AdminAccountStatus.locked: 'locked',
  AdminAccountStatus.passwordResetRequired: 'passwordResetRequired',
};

_AdminAccountPage _$AdminAccountPageFromJson(Map<String, dynamic> json) =>
    _AdminAccountPage(
      accounts:
          (json['accounts'] as List<dynamic>?)
              ?.map((e) => AdminAccount.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['page_size'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AdminAccountPageToJson(_AdminAccountPage instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total': instance.total,
    };
