// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SchoolScopedQueryPayload _$SchoolScopedQueryPayloadFromJson(
  Map<String, dynamic> json,
) => _SchoolScopedQueryPayload(schoolId: json['school_id'] as String);

Map<String, dynamic> _$SchoolScopedQueryPayloadToJson(
  _SchoolScopedQueryPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId};

_SchoolScopedBodyPayload _$SchoolScopedBodyPayloadFromJson(
  Map<String, dynamic> json,
) => _SchoolScopedBodyPayload(schoolId: json['school_id'] as String);

Map<String, dynamic> _$SchoolScopedBodyPayloadToJson(
  _SchoolScopedBodyPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId};

_DepartmentsResult _$DepartmentsResultFromJson(Map<String, dynamic> json) =>
    _DepartmentsResult(
      departments:
          (json['departments'] as List<dynamic>?)
              ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Department>[],
    );

Map<String, dynamic> _$DepartmentsResultToJson(_DepartmentsResult instance) =>
    <String, dynamic>{'departments': instance.departments};

_AISettingsResult _$AISettingsResultFromJson(Map<String, dynamic> json) =>
    _AISettingsResult(
      setting: json['setting'] == null
          ? null
          : AIAgentSetting.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AISettingsResultToJson(_AISettingsResult instance) =>
    <String, dynamic>{'setting': instance.setting};

_UpdateAISettingsPayload _$UpdateAISettingsPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateAISettingsPayload(
  setting: AIAgentSetting.fromJson(json['setting'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateAISettingsPayloadToJson(
  _UpdateAISettingsPayload instance,
) => <String, dynamic>{'setting': instance.setting};

_ClassesByDepartmentResult _$ClassesByDepartmentResultFromJson(
  Map<String, dynamic> json,
) => _ClassesByDepartmentResult(
  classes:
      (json['classes'] as List<dynamic>?)
          ?.map((e) => ClassInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ClassInfo>[],
);

Map<String, dynamic> _$ClassesByDepartmentResultToJson(
  _ClassesByDepartmentResult instance,
) => <String, dynamic>{'classes': instance.classes};

_FetchAccountsPayload _$FetchAccountsPayloadFromJson(
  Map<String, dynamic> json,
) => _FetchAccountsPayload(
  schoolId: json['school_id'] as String,
  role: $enumDecodeNullable(_$AdminAccountRoleEnumMap, json['role']),
  status: $enumDecodeNullable(_$AdminAccountStatusEnumMap, json['status']),
  departmentId: json['department_id'] as String?,
  departmentScope: json['department_scope'] as String?,
  classId: json['class_id'] as String?,
  classScope: json['class_scope'] as String?,
  courseId: json['course_id'] as String?,
  page: (json['page'] as num?)?.toInt() ?? 1,
  pageSize: (json['page_size'] as num?)?.toInt() ?? 50,
  query: json['query'] as String? ?? '',
);

Map<String, dynamic> _$FetchAccountsPayloadToJson(
  _FetchAccountsPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'role': ?_$AdminAccountRoleEnumMap[instance.role],
  'status': ?_$AdminAccountStatusEnumMap[instance.status],
  'department_id': ?instance.departmentId,
  'department_scope': ?instance.departmentScope,
  'class_id': ?instance.classId,
  'class_scope': ?instance.classScope,
  'course_id': ?instance.courseId,
  'page': instance.page,
  'page_size': instance.pageSize,
  'query': instance.query,
};

const _$AdminAccountRoleEnumMap = {
  AdminAccountRole.teacher: 'teacher',
  AdminAccountRole.student: 'student',
};

const _$AdminAccountStatusEnumMap = {
  AdminAccountStatus.active: 'active',
  AdminAccountStatus.locked: 'locked',
  AdminAccountStatus.passwordResetRequired: 'password_reset_required',
};

_CreateTeacherPayload _$CreateTeacherPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateTeacherPayload(
  schoolId: json['school_id'] as String,
  number: json['number'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  defaultPassword: json['default_password'] as String,
);

Map<String, dynamic> _$CreateTeacherPayloadToJson(
  _CreateTeacherPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'number': instance.number,
  'name': instance.name,
  'email': instance.email,
  'phone': ?instance.phone,
  'default_password': instance.defaultPassword,
};

_CreateStudentPayload _$CreateStudentPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateStudentPayload(
  schoolId: json['school_id'] as String,
  number: json['number'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  classId: json['class_id'] as String,
  defaultPassword: json['default_password'] as String,
);

Map<String, dynamic> _$CreateStudentPayloadToJson(
  _CreateStudentPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'number': instance.number,
  'name': instance.name,
  'email': instance.email,
  'phone': ?instance.phone,
  'class_id': instance.classId,
  'default_password': instance.defaultPassword,
};

_UpdateAccountPayload _$UpdateAccountPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateAccountPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String?,
  number: json['number'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$UpdateAccountPayloadToJson(
  _UpdateAccountPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': ?instance.name,
  'number': ?instance.number,
  'email': ?instance.email,
  'phone': ?instance.phone,
};

_UpdateAccountStructurePayload _$UpdateAccountStructurePayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateAccountStructurePayload(
  schoolId: json['school_id'] as String,
  departmentId: json['department_id'] as String?,
  classId: json['class_id'] as String?,
);

Map<String, dynamic> _$UpdateAccountStructurePayloadToJson(
  _UpdateAccountStructurePayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'department_id': ?instance.departmentId,
  'class_id': ?instance.classId,
};

_AddTeacherToClassPayload _$AddTeacherToClassPayloadFromJson(
  Map<String, dynamic> json,
) => _AddTeacherToClassPayload(
  schoolId: json['school_id'] as String,
  accountId: json['account_id'] as String,
);

Map<String, dynamic> _$AddTeacherToClassPayloadToJson(
  _AddTeacherToClassPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'account_id': instance.accountId,
};

_BatchOperateAccountsPayload _$BatchOperateAccountsPayloadFromJson(
  Map<String, dynamic> json,
) => _BatchOperateAccountsPayload(
  schoolId: json['school_id'] as String,
  accountIds: (json['account_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  action: json['action'] as String,
);

Map<String, dynamic> _$BatchOperateAccountsPayloadToJson(
  _BatchOperateAccountsPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'account_ids': instance.accountIds,
  'action': instance.action,
};

_OssCredentialsResult _$OssCredentialsResultFromJson(
  Map<String, dynamic> json,
) => _OssCredentialsResult(
  credentials:
      (json['credentials'] as List<dynamic>?)
          ?.map((e) => AdminOssCredential.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AdminOssCredential>[],
);

Map<String, dynamic> _$OssCredentialsResultToJson(
  _OssCredentialsResult instance,
) => <String, dynamic>{'credentials': instance.credentials};

_OssPoliciesResult _$OssPoliciesResultFromJson(Map<String, dynamic> json) =>
    _OssPoliciesResult(
      policies:
          (json['policies'] as List<dynamic>?)
              ?.map((e) => AdminOssPolicy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AdminOssPolicy>[],
    );

Map<String, dynamic> _$OssPoliciesResultToJson(_OssPoliciesResult instance) =>
    <String, dynamic>{'policies': instance.policies};

_FetchOssAuditLogsPayload _$FetchOssAuditLogsPayloadFromJson(
  Map<String, dynamic> json,
) => _FetchOssAuditLogsPayload(
  schoolId: json['school_id'] as String,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$FetchOssAuditLogsPayloadToJson(
  _FetchOssAuditLogsPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId, 'limit': instance.limit};

_OssAuditLogsResult _$OssAuditLogsResultFromJson(Map<String, dynamic> json) =>
    _OssAuditLogsResult(
      logs:
          (json['logs'] as List<dynamic>?)
              ?.map((e) => AdminOssAuditLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AdminOssAuditLog>[],
    );

Map<String, dynamic> _$OssAuditLogsResultToJson(_OssAuditLogsResult instance) =>
    <String, dynamic>{'logs': instance.logs};

_SystemSwitchesResult _$SystemSwitchesResultFromJson(
  Map<String, dynamic> json,
) => _SystemSwitchesResult(
  switches:
      (json['switches'] as List<dynamic>?)
          ?.map((e) => AdminSystemSwitch.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AdminSystemSwitch>[],
);

Map<String, dynamic> _$SystemSwitchesResultToJson(
  _SystemSwitchesResult instance,
) => <String, dynamic>{'switches': instance.switches};

_UpdateSystemSwitchPayload _$UpdateSystemSwitchPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateSystemSwitchPayload(
  schoolId: json['school_id'] as String,
  enabled: json['enabled'] as bool,
);

Map<String, dynamic> _$UpdateSystemSwitchPayloadToJson(
  _UpdateSystemSwitchPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'enabled': instance.enabled,
};

_SystemParametersResult _$SystemParametersResultFromJson(
  Map<String, dynamic> json,
) => _SystemParametersResult(
  parameters:
      (json['parameters'] as List<dynamic>?)
          ?.map((e) => AdminSystemParameter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AdminSystemParameter>[],
);

Map<String, dynamic> _$SystemParametersResultToJson(
  _SystemParametersResult instance,
) => <String, dynamic>{'parameters': instance.parameters};

_UpdateSystemParameterPayload _$UpdateSystemParameterPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateSystemParameterPayload(
  schoolId: json['school_id'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$UpdateSystemParameterPayloadToJson(
  _UpdateSystemParameterPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId, 'value': instance.value};

_SystemBroadcastsResult _$SystemBroadcastsResultFromJson(
  Map<String, dynamic> json,
) => _SystemBroadcastsResult(
  broadcasts:
      (json['broadcasts'] as List<dynamic>?)
          ?.map((e) => AdminSystemBroadcast.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AdminSystemBroadcast>[],
);

Map<String, dynamic> _$SystemBroadcastsResultToJson(
  _SystemBroadcastsResult instance,
) => <String, dynamic>{'broadcasts': instance.broadcasts};

_UpdateSystemBroadcastPayload _$UpdateSystemBroadcastPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateSystemBroadcastPayload(
  schoolId: json['school_id'] as String,
  status: $enumDecodeNullable(
    _$AdminSystemBroadcastStatusEnumMap,
    json['status'],
  ),
  pinned: json['pinned'] as bool?,
);

Map<String, dynamic> _$UpdateSystemBroadcastPayloadToJson(
  _UpdateSystemBroadcastPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'status': ?_$AdminSystemBroadcastStatusEnumMap[instance.status],
  'pinned': ?instance.pinned,
};

const _$AdminSystemBroadcastStatusEnumMap = {
  AdminSystemBroadcastStatus.scheduled: 'scheduled',
  AdminSystemBroadcastStatus.sent: 'sent',
  AdminSystemBroadcastStatus.draft: 'draft',
};

_FetchSystemAuditLogsPayload _$FetchSystemAuditLogsPayloadFromJson(
  Map<String, dynamic> json,
) => _FetchSystemAuditLogsPayload(
  schoolId: json['school_id'] as String,
  limit: (json['limit'] as num?)?.toInt() ?? 50,
);

Map<String, dynamic> _$FetchSystemAuditLogsPayloadToJson(
  _FetchSystemAuditLogsPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId, 'limit': instance.limit};

_CreateOssCredentialPayload _$CreateOssCredentialPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateOssCredentialPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String,
  endpoint: json['endpoint'] as String,
  internalEndpoint: json['internal_endpoint'] as String? ?? '',
  region: json['region'] as String,
  bucket: json['bucket'] as String,
  accessKeyId: json['access_key_id'] as String,
  accessKeySecret: json['access_key_secret'] as String,
  directoryPrefix: json['directory_prefix'] as String? ?? '',
  accessKeyDisplay: json['access_key_display'] as String? ?? '',
  allowPublicRead: json['allow_public_read'] as bool? ?? false,
  allowMultipartUpload: json['allow_multipart_upload'] as bool? ?? false,
  useRelayUpload: json['use_relay_upload'] as bool? ?? false,
  active: json['active'] as bool? ?? true,
  isPrimary: json['is_primary'] as bool? ?? false,
);

Map<String, dynamic> _$CreateOssCredentialPayloadToJson(
  _CreateOssCredentialPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': instance.name,
  'endpoint': instance.endpoint,
  'internal_endpoint': instance.internalEndpoint,
  'region': instance.region,
  'bucket': instance.bucket,
  'access_key_id': instance.accessKeyId,
  'access_key_secret': instance.accessKeySecret,
  'directory_prefix': instance.directoryPrefix,
  'access_key_display': instance.accessKeyDisplay,
  'allow_public_read': instance.allowPublicRead,
  'allow_multipart_upload': instance.allowMultipartUpload,
  'use_relay_upload': instance.useRelayUpload,
  'active': instance.active,
  'is_primary': instance.isPrimary,
};

_UpdateOssCredentialPayload _$UpdateOssCredentialPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateOssCredentialPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String?,
  endpoint: json['endpoint'] as String?,
  internalEndpoint: json['internal_endpoint'] as String?,
  region: json['region'] as String?,
  bucket: json['bucket'] as String?,
  directoryPrefix: json['directory_prefix'] as String?,
  accessKeyId: json['access_key_id'] as String?,
  accessKeySecret: json['access_key_secret'] as String?,
  accessKeyDisplay: json['access_key_display'] as String?,
  allowPublicRead: json['allow_public_read'] as bool?,
  allowMultipartUpload: json['allow_multipart_upload'] as bool?,
  useRelayUpload: json['use_relay_upload'] as bool?,
  active: json['active'] as bool?,
  isPrimary: json['is_primary'] as bool?,
);

Map<String, dynamic> _$UpdateOssCredentialPayloadToJson(
  _UpdateOssCredentialPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': ?instance.name,
  'endpoint': ?instance.endpoint,
  'internal_endpoint': ?instance.internalEndpoint,
  'region': ?instance.region,
  'bucket': ?instance.bucket,
  'directory_prefix': ?instance.directoryPrefix,
  'access_key_id': ?instance.accessKeyId,
  'access_key_secret': ?instance.accessKeySecret,
  'access_key_display': ?instance.accessKeyDisplay,
  'allow_public_read': ?instance.allowPublicRead,
  'allow_multipart_upload': ?instance.allowMultipartUpload,
  'use_relay_upload': ?instance.useRelayUpload,
  'active': ?instance.active,
  'is_primary': ?instance.isPrimary,
};

_CreateOssPolicyPayload _$CreateOssPolicyPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateOssPolicyPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String,
  appliesTo: json['applies_to'] as String,
  description: json['description'] as String? ?? '',
  status:
      $enumDecodeNullable(_$AdminOssPolicyStatusEnumMap, json['status']) ??
      AdminOssPolicyStatus.enabled,
);

Map<String, dynamic> _$CreateOssPolicyPayloadToJson(
  _CreateOssPolicyPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': instance.name,
  'applies_to': instance.appliesTo,
  'description': instance.description,
  'status': _$AdminOssPolicyStatusEnumMap[instance.status]!,
};

const _$AdminOssPolicyStatusEnumMap = {
  AdminOssPolicyStatus.enabled: 'enabled',
  AdminOssPolicyStatus.readOnly: 'readOnly',
  AdminOssPolicyStatus.disabled: 'disabled',
};

_UpdateOssPolicyStatusPayload _$UpdateOssPolicyStatusPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateOssPolicyStatusPayload(
  schoolId: json['school_id'] as String,
  status: $enumDecode(_$AdminOssPolicyStatusEnumMap, json['status']),
);

Map<String, dynamic> _$UpdateOssPolicyStatusPayloadToJson(
  _UpdateOssPolicyStatusPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'status': _$AdminOssPolicyStatusEnumMap[instance.status]!,
};

_CreateDepartmentPayload _$CreateDepartmentPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateDepartmentPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$CreateDepartmentPayloadToJson(
  _CreateDepartmentPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId, 'name': instance.name};

_CreateDepartmentResult _$CreateDepartmentResultFromJson(
  Map<String, dynamic> json,
) => _CreateDepartmentResult(departmentId: json['department_id'] as String?);

Map<String, dynamic> _$CreateDepartmentResultToJson(
  _CreateDepartmentResult instance,
) => <String, dynamic>{'department_id': instance.departmentId};

_CreateClassPayload _$CreateClassPayloadFromJson(Map<String, dynamic> json) =>
    _CreateClassPayload(
      schoolId: json['school_id'] as String,
      departmentId: json['department_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreateClassPayloadToJson(_CreateClassPayload instance) =>
    <String, dynamic>{
      'school_id': instance.schoolId,
      'department_id': instance.departmentId,
      'name': instance.name,
    };

_CreateClassResult _$CreateClassResultFromJson(Map<String, dynamic> json) =>
    _CreateClassResult(classId: json['class_id'] as String?);

Map<String, dynamic> _$CreateClassResultToJson(_CreateClassResult instance) =>
    <String, dynamic>{'class_id': instance.classId};

_UpdateDepartmentPayload _$UpdateDepartmentPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateDepartmentPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$UpdateDepartmentPayloadToJson(
  _UpdateDepartmentPayload instance,
) => <String, dynamic>{'school_id': instance.schoolId, 'name': instance.name};

_UpdateDepartmentResult _$UpdateDepartmentResultFromJson(
  Map<String, dynamic> json,
) => _UpdateDepartmentResult(
  department: Department.fromJson(json['department'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateDepartmentResultToJson(
  _UpdateDepartmentResult instance,
) => <String, dynamic>{'department': instance.department};

_UpdateClassPayload _$UpdateClassPayloadFromJson(Map<String, dynamic> json) =>
    _UpdateClassPayload(
      schoolId: json['school_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UpdateClassPayloadToJson(_UpdateClassPayload instance) =>
    <String, dynamic>{'school_id': instance.schoolId, 'name': instance.name};

_UpdateClassResult _$UpdateClassResultFromJson(Map<String, dynamic> json) =>
    _UpdateClassResult(
      classInfo: ClassInfo.fromJson(json['class_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateClassResultToJson(_UpdateClassResult instance) =>
    <String, dynamic>{'class_info': instance.classInfo};

_FetchCoursesPayload _$FetchCoursesPayloadFromJson(Map<String, dynamic> json) =>
    _FetchCoursesPayload(
      schoolId: json['school_id'] as String,
      departmentId: json['department_id'] as String?,
      classId: json['class_id'] as String?,
      page: (json['page'] as num?)?.toInt() ?? 1,
      size: (json['size'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$FetchCoursesPayloadToJson(
  _FetchCoursesPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'department_id': ?instance.departmentId,
  'class_id': ?instance.classId,
  'page': instance.page,
  'size': instance.size,
};

_CreateCoursePayload _$CreateCoursePayloadFromJson(Map<String, dynamic> json) =>
    _CreateCoursePayload(
      schoolId: json['school_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateCoursePayloadToJson(
  _CreateCoursePayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': instance.name,
  'description': ?instance.description,
};

_UpdateCoursePayload _$UpdateCoursePayloadFromJson(Map<String, dynamic> json) =>
    _UpdateCoursePayload(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UpdateCoursePayloadToJson(
  _UpdateCoursePayload instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'description': ?instance.description,
};

_UpdateAssignmentPayload _$UpdateAssignmentPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateAssignmentPayload(
  teacherId: json['teacher_id'] as String,
  classId: json['class_id'] as String,
);

Map<String, dynamic> _$UpdateAssignmentPayloadToJson(
  _UpdateAssignmentPayload instance,
) => <String, dynamic>{
  'teacher_id': instance.teacherId,
  'class_id': instance.classId,
};

_FetchCourseAssignmentsPayload _$FetchCourseAssignmentsPayloadFromJson(
  Map<String, dynamic> json,
) => _FetchCourseAssignmentsPayload(
  schoolId: json['school_id'] as String,
  courseId: json['course_id'] as String?,
  departmentId: json['department_id'] as String?,
  classId: json['class_id'] as String?,
  page: (json['page'] as num?)?.toInt() ?? 1,
  pageSize: (json['page_size'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$FetchCourseAssignmentsPayloadToJson(
  _FetchCourseAssignmentsPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'course_id': ?instance.courseId,
  'department_id': ?instance.departmentId,
  'class_id': ?instance.classId,
  'page': instance.page,
  'page_size': instance.pageSize,
};

_AssignStudentsPayload _$AssignStudentsPayloadFromJson(
  Map<String, dynamic> json,
) => _AssignStudentsPayload(
  studentIds: (json['student_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  classId: json['class_id'] as String?,
  departmentId: json['department_id'] as String?,
);

Map<String, dynamic> _$AssignStudentsPayloadToJson(
  _AssignStudentsPayload instance,
) => <String, dynamic>{
  'student_ids': ?instance.studentIds,
  'class_id': ?instance.classId,
  'department_id': ?instance.departmentId,
};

_CreateTimeSlotPayload _$CreateTimeSlotPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateTimeSlotPayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
);

Map<String, dynamic> _$CreateTimeSlotPayloadToJson(
  _CreateTimeSlotPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': instance.name,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
};

_UpdateTimeSlotPayload _$UpdateTimeSlotPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateTimeSlotPayload(
  name: json['name'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
);

Map<String, dynamic> _$UpdateTimeSlotPayloadToJson(
  _UpdateTimeSlotPayload instance,
) => <String, dynamic>{
  'name': instance.name,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
};

_CreateScheduleRulePayload _$CreateScheduleRulePayloadFromJson(
  Map<String, dynamic> json,
) => _CreateScheduleRulePayload(
  schoolId: json['school_id'] as String,
  courseId: json['course_id'] as String,
  classId: json['class_id'] as String,
  teacherId: json['teacher_id'] as String?,
  slotId: json['slot_id'] as String,
  dayOfWeek: (json['day_of_week'] as num).toInt(),
  location: json['location'] as String,
  classroomId: json['classroom_id'] as String?,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
);

Map<String, dynamic> _$CreateScheduleRulePayloadToJson(
  _CreateScheduleRulePayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'course_id': instance.courseId,
  'class_id': instance.classId,
  'teacher_id': ?instance.teacherId,
  'slot_id': instance.slotId,
  'day_of_week': instance.dayOfWeek,
  'location': instance.location,
  'classroom_id': ?instance.classroomId,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
};

_ListScheduleRulesPayload _$ListScheduleRulesPayloadFromJson(
  Map<String, dynamic> json,
) => _ListScheduleRulesPayload(
  schoolId: json['school_id'] as String,
  courseId: json['course_id'] as String?,
);

Map<String, dynamic> _$ListScheduleRulesPayloadToJson(
  _ListScheduleRulesPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'course_id': ?instance.courseId,
};

_GenerateSessionsPayload _$GenerateSessionsPayloadFromJson(
  Map<String, dynamic> json,
) => _GenerateSessionsPayload(
  schoolId: json['school_id'] as String,
  start: json['start'] as String,
  end: json['end'] as String,
);

Map<String, dynamic> _$GenerateSessionsPayloadToJson(
  _GenerateSessionsPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'start': instance.start,
  'end': instance.end,
};

_FetchClassroomsPayload _$FetchClassroomsPayloadFromJson(
  Map<String, dynamic> json,
) => _FetchClassroomsPayload(
  schoolId: json['school_id'] as String,
  page: (json['page'] as num?)?.toInt() ?? 1,
  size: (json['size'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$FetchClassroomsPayloadToJson(
  _FetchClassroomsPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'page': instance.page,
  'size': instance.size,
};

_CreateClassroomPayload _$CreateClassroomPayloadFromJson(
  Map<String, dynamic> json,
) => _CreateClassroomPayload(
  schoolId: json['school_id'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$CreateClassroomPayloadToJson(
  _CreateClassroomPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'location': instance.location,
};

_UpdateClassroomPayload _$UpdateClassroomPayloadFromJson(
  Map<String, dynamic> json,
) => _UpdateClassroomPayload(location: json['location'] as String);

Map<String, dynamic> _$UpdateClassroomPayloadToJson(
  _UpdateClassroomPayload instance,
) => <String, dynamic>{'location': instance.location};

_AnalyzeBatchOperationPayload _$AnalyzeBatchOperationPayloadFromJson(
  Map<String, dynamic> json,
) => _AnalyzeBatchOperationPayload(
  schoolId: json['school_id'] as String,
  instruction: json['instruction'] as String,
);

Map<String, dynamic> _$AnalyzeBatchOperationPayloadToJson(
  _AnalyzeBatchOperationPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'instruction': instance.instruction,
};

_AnalyzeBatchOperationResult _$AnalyzeBatchOperationResultFromJson(
  Map<String, dynamic> json,
) => _AnalyzeBatchOperationResult(
  analysis: json['analysis'] as String? ?? '',
  operations:
      (json['operations'] as List<dynamic>?)
          ?.map((e) => AIOperation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AIOperation>[],
);

Map<String, dynamic> _$AnalyzeBatchOperationResultToJson(
  _AnalyzeBatchOperationResult instance,
) => <String, dynamic>{
  'analysis': instance.analysis,
  'operations': instance.operations,
};

_ExecuteBatchOperationsPayload _$ExecuteBatchOperationsPayloadFromJson(
  Map<String, dynamic> json,
) => _ExecuteBatchOperationsPayload(
  schoolId: json['school_id'] as String,
  operations: (json['operations'] as List<dynamic>)
      .map((e) => AIOperation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExecuteBatchOperationsPayloadToJson(
  _ExecuteBatchOperationsPayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'operations': instance.operations,
};

_ExecuteBatchOperationsResult _$ExecuteBatchOperationsResultFromJson(
  Map<String, dynamic> json,
) => _ExecuteBatchOperationsResult(
  results:
      (json['results'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$ExecuteBatchOperationsResultToJson(
  _ExecuteBatchOperationsResult instance,
) => <String, dynamic>{'results': instance.results};
