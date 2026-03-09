import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/base_request.dart';
import '../domain/accounts.dart';
import '../domain/ai_ops.dart';
import '../domain/ai_settings.dart';
import '../domain/classroom.dart';
import '../domain/course.dart';
import '../domain/models.dart';
import '../domain/oss.dart';
import '../domain/schedule.dart';
import '../domain/system_settings.dart';

part 'admin_api_requests.freezed.dart';
part 'admin_api_requests.g.dart';

Map<String, dynamic> _requireMap(dynamic value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}

List<Map<String, dynamic>> _asMapList(dynamic value) {
  if (value is List) {
    return value.whereType<Map<String, dynamic>>().toList();
  }
  return <Map<String, dynamic>>[];
}

Map<String, dynamic> _dropNullAndEmpty(Map<String, dynamic> source) {
  final result = <String, dynamic>{};
  for (final entry in source.entries) {
    final value = entry.value;
    if (value == null) {
      continue;
    }
    if (value is String && value.trim().isEmpty) {
      continue;
    }
    result[entry.key] = value;
  }
  return result;
}

@freezed
abstract class SchoolScopedQueryPayload with _$SchoolScopedQueryPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory SchoolScopedQueryPayload({required String schoolId}) =
      _SchoolScopedQueryPayload;

  factory SchoolScopedQueryPayload.fromJson(Map<String, dynamic> json) =>
      _$SchoolScopedQueryPayloadFromJson(json);
}

@freezed
abstract class SchoolScopedBodyPayload with _$SchoolScopedBodyPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory SchoolScopedBodyPayload({required String schoolId}) =
      _SchoolScopedBodyPayload;

  factory SchoolScopedBodyPayload.fromJson(Map<String, dynamic> json) =>
      _$SchoolScopedBodyPayloadFromJson(json);
}

@freezed
abstract class DepartmentsResult with _$DepartmentsResult {
  const factory DepartmentsResult({
    @Default(<Department>[]) List<Department> departments,
  }) = _DepartmentsResult;

  factory DepartmentsResult.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsResultFromJson(json);
}

class FetchDepartmentsRequest
    extends BaseRequest<SchoolScopedQueryPayload, DepartmentsResult> {
  FetchDepartmentsRequest()
    : super(
        '/api/v1/admin/departments',
        HttpMethod.get,
        fallbackMessage: '获取院系列表失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            DepartmentsResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class AISettingsResult with _$AISettingsResult {
  const factory AISettingsResult({AIAgentSetting? setting}) = _AISettingsResult;

  factory AISettingsResult.fromJson(Map<String, dynamic> json) =>
      _$AISettingsResultFromJson(json);
}

class FetchAISettingsRequest
    extends BaseRequest<SchoolScopedQueryPayload, AISettingsResult> {
  FetchAISettingsRequest()
    : super(
        '/api/v1/admin/ai/settings',
        HttpMethod.get,
        fallbackMessage: '获取 AI 配置失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            AISettingsResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateAISettingsPayload with _$UpdateAISettingsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateAISettingsPayload({required AIAgentSetting setting}) =
      _UpdateAISettingsPayload;

  factory UpdateAISettingsPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateAISettingsPayloadFromJson(json);
}

class UpdateAISettingsRequest
    extends BaseRequest<UpdateAISettingsPayload, AIAgentSetting> {
  UpdateAISettingsRequest()
    : super(
        '/api/v1/admin/ai/settings',
        HttpMethod.put,
        fallbackMessage: '更新 AI 配置失败',
        requestEncoder: (value) => value.setting.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final setting = map['setting'];
          if (setting is Map<String, dynamic>) {
            return AIAgentSetting.fromJson(setting);
          }
          return AIAgentSetting.fromJson(map);
        },
      );
}

@freezed
abstract class ClassesByDepartmentResult with _$ClassesByDepartmentResult {
  const factory ClassesByDepartmentResult({
    @Default(<ClassInfo>[]) List<ClassInfo> classes,
  }) = _ClassesByDepartmentResult;

  factory ClassesByDepartmentResult.fromJson(Map<String, dynamic> json) =>
      _$ClassesByDepartmentResultFromJson(json);
}

class FetchClassesByDepartmentRequest
    extends BaseRequest<SchoolScopedQueryPayload, ClassesByDepartmentResult> {
  FetchClassesByDepartmentRequest({required String departmentId})
    : super(
        '/api/v1/admin/departments/$departmentId/classes',
        HttpMethod.get,
        fallbackMessage: '获取班级列表失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            ClassesByDepartmentResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class FetchAccountsPayload with _$FetchAccountsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory FetchAccountsPayload({
    required String schoolId,
    AdminAccountRole? role,
    AdminAccountStatus? status,
    String? departmentId,
    String? departmentScope,
    String? classId,
    String? classScope,
    String? courseId,
    @Default(1) int page,
    @Default(50) int pageSize,
    @Default('') String query,
  }) = _FetchAccountsPayload;

  factory FetchAccountsPayload.fromJson(Map<String, dynamic> json) =>
      _$FetchAccountsPayloadFromJson(json);
}

class FetchAccountsRequest
    extends BaseRequest<FetchAccountsPayload, AdminAccountPage> {
  FetchAccountsRequest()
    : super(
        '/api/v1/admin/accounts',
        HttpMethod.get,
        fallbackMessage: '获取账号列表失败',
        queryParameters: (value) => _dropNullAndEmpty(value.toJson()),
        responseParser: (value) =>
            AdminAccountPage.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class CreateTeacherPayload with _$CreateTeacherPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateTeacherPayload({
    required String schoolId,
    required String number,
    required String name,
    required String email,
    String? phone,
    required String defaultPassword,
  }) = _CreateTeacherPayload;

  factory CreateTeacherPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateTeacherPayloadFromJson(json);
}

class CreateTeacherRequest extends BaseRequest<CreateTeacherPayload, void> {
  CreateTeacherRequest()
    : super(
        '/api/v1/admin/teachers',
        HttpMethod.post,
        fallbackMessage: '创建教师账号失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class CreateStudentPayload with _$CreateStudentPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateStudentPayload({
    required String schoolId,
    required String number,
    required String name,
    required String email,
    String? phone,
    required String classId,
    required String defaultPassword,
  }) = _CreateStudentPayload;

  factory CreateStudentPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateStudentPayloadFromJson(json);
}

class CreateStudentRequest extends BaseRequest<CreateStudentPayload, void> {
  CreateStudentRequest()
    : super(
        '/api/v1/admin/students',
        HttpMethod.post,
        fallbackMessage: '创建学生账号失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class UpdateAccountPayload with _$UpdateAccountPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateAccountPayload({
    required String schoolId,
    String? name,
    String? number,
    String? email,
    String? phone,
  }) = _UpdateAccountPayload;

  factory UpdateAccountPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountPayloadFromJson(json);
}

class UpdateAccountRequest extends BaseRequest<UpdateAccountPayload, void> {
  UpdateAccountRequest({required String accountId})
    : super(
        '/api/v1/admin/accounts/$accountId',
        HttpMethod.patch,
        fallbackMessage: '更新账号信息失败',
        queryParameters: (value) => {'school_id': value.schoolId},
        requestEncoder: (value) => _dropNullAndEmpty({
          'name': value.name,
          'number': value.number,
          'email': value.email,
          'phone': value.phone,
        }),
      );
}

@freezed
abstract class UpdateAccountStructurePayload
    with _$UpdateAccountStructurePayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateAccountStructurePayload({
    required String schoolId,
    String? departmentId,
    String? classId,
  }) = _UpdateAccountStructurePayload;

  factory UpdateAccountStructurePayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountStructurePayloadFromJson(json);
}

class UpdateAccountStructureRequest
    extends BaseRequest<UpdateAccountStructurePayload, void> {
  UpdateAccountStructureRequest({required String accountId})
    : super(
        '/api/v1/admin/accounts/$accountId/structure',
        HttpMethod.patch,
        fallbackMessage: '更新账号所属失败',
        queryParameters: (value) => {'school_id': value.schoolId},
        requestEncoder: (value) => {
          'department_id': value.departmentId,
          'class_id': value.classId,
        },
      );
}

@freezed
abstract class AddTeacherToClassPayload with _$AddTeacherToClassPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory AddTeacherToClassPayload({
    required String schoolId,
    required String accountId,
  }) = _AddTeacherToClassPayload;

  factory AddTeacherToClassPayload.fromJson(Map<String, dynamic> json) =>
      _$AddTeacherToClassPayloadFromJson(json);
}

class AddTeacherToClassRequest
    extends BaseRequest<AddTeacherToClassPayload, void> {
  AddTeacherToClassRequest({required String classId})
    : super(
        '/api/v1/admin/classes/$classId/teachers',
        HttpMethod.post,
        fallbackMessage: '添加教师失败',
        queryParameters: (value) => {'school_id': value.schoolId},
        requestEncoder: (value) => {'account_id': value.accountId},
      );
}

class RemoveTeacherFromClassRequest
    extends BaseRequest<SchoolScopedQueryPayload, void> {
  RemoveTeacherFromClassRequest({
    required String classId,
    required String accountId,
  }) : super(
         '/api/v1/admin/classes/$classId/teachers/$accountId',
         HttpMethod.delete,
         fallbackMessage: '移除教师失败',
         queryParameters: (value) => value.toJson(),
       );
}

class ResetAccountPasswordRequest
    extends BaseRequest<SchoolScopedBodyPayload, void> {
  ResetAccountPasswordRequest({required String accountId})
    : super(
        '/api/v1/admin/accounts/$accountId/password/reset',
        HttpMethod.post,
        fallbackMessage: '发送重置密码请求失败',
        requestEncoder: (value) => value.toJson(),
      );
}

class LockAccountRequest extends BaseRequest<SchoolScopedBodyPayload, void> {
  LockAccountRequest({required String accountId})
    : super(
        '/api/v1/admin/accounts/$accountId/lock',
        HttpMethod.post,
        fallbackMessage: '锁定账号失败',
        requestEncoder: (value) => value.toJson(),
      );
}

class UnlockAccountRequest extends BaseRequest<SchoolScopedBodyPayload, void> {
  UnlockAccountRequest({required String accountId})
    : super(
        '/api/v1/admin/accounts/$accountId/unlock',
        HttpMethod.post,
        fallbackMessage: '解除锁定失败',
        requestEncoder: (value) => value.toJson(),
      );
}

class DeleteAccountRequest extends BaseRequest<SchoolScopedQueryPayload, void> {
  DeleteAccountRequest({required String accountId})
    : super(
        '/api/v1/admin/accounts/$accountId',
        HttpMethod.delete,
        fallbackMessage: '删除账号失败',
        queryParameters: (value) => value.toJson(),
      );
}

@freezed
abstract class BatchOperateAccountsPayload with _$BatchOperateAccountsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory BatchOperateAccountsPayload({
    required String schoolId,
    required List<String> accountIds,
    required String action,
  }) = _BatchOperateAccountsPayload;

  factory BatchOperateAccountsPayload.fromJson(Map<String, dynamic> json) =>
      _$BatchOperateAccountsPayloadFromJson(json);
}

class BatchOperateAccountsRequest
    extends BaseRequest<BatchOperateAccountsPayload, Map<String, dynamic>> {
  BatchOperateAccountsRequest()
    : super(
        '/api/v1/admin/accounts/batch',
        HttpMethod.post,
        fallbackMessage: '批量操作失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => _requireMap(value),
      );
}

@freezed
abstract class OssCredentialsResult with _$OssCredentialsResult {
  const factory OssCredentialsResult({
    @Default(<AdminOssCredential>[]) List<AdminOssCredential> credentials,
  }) = _OssCredentialsResult;

  factory OssCredentialsResult.fromJson(Map<String, dynamic> json) =>
      _$OssCredentialsResultFromJson(json);
}

class FetchOssCredentialsRequest
    extends BaseRequest<SchoolScopedQueryPayload, OssCredentialsResult> {
  FetchOssCredentialsRequest()
    : super(
        '/api/v1/admin/oss/credentials',
        HttpMethod.get,
        fallbackMessage: '获取 OSS 凭证列表失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            OssCredentialsResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class OssPoliciesResult with _$OssPoliciesResult {
  const factory OssPoliciesResult({
    @Default(<AdminOssPolicy>[]) List<AdminOssPolicy> policies,
  }) = _OssPoliciesResult;

  factory OssPoliciesResult.fromJson(Map<String, dynamic> json) =>
      _$OssPoliciesResultFromJson(json);
}

class FetchOssPoliciesRequest
    extends BaseRequest<SchoolScopedQueryPayload, OssPoliciesResult> {
  FetchOssPoliciesRequest()
    : super(
        '/api/v1/admin/oss/policies',
        HttpMethod.get,
        fallbackMessage: '获取 OSS 策略失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            OssPoliciesResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class FetchOssAuditLogsPayload with _$FetchOssAuditLogsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory FetchOssAuditLogsPayload({
    required String schoolId,
    @Default(20) int limit,
  }) = _FetchOssAuditLogsPayload;

  factory FetchOssAuditLogsPayload.fromJson(Map<String, dynamic> json) =>
      _$FetchOssAuditLogsPayloadFromJson(json);
}

@freezed
abstract class OssAuditLogsResult with _$OssAuditLogsResult {
  const factory OssAuditLogsResult({
    @Default(<AdminOssAuditLog>[]) List<AdminOssAuditLog> logs,
  }) = _OssAuditLogsResult;

  factory OssAuditLogsResult.fromJson(Map<String, dynamic> json) =>
      _$OssAuditLogsResultFromJson(json);
}

class FetchOssAuditLogsRequest
    extends BaseRequest<FetchOssAuditLogsPayload, OssAuditLogsResult> {
  FetchOssAuditLogsRequest()
    : super(
        '/api/v1/admin/oss/audit_logs',
        HttpMethod.get,
        fallbackMessage: '获取 OSS 审计记录失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            OssAuditLogsResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class SystemSwitchesResult with _$SystemSwitchesResult {
  const factory SystemSwitchesResult({
    @Default(<AdminSystemSwitch>[]) List<AdminSystemSwitch> switches,
  }) = _SystemSwitchesResult;

  factory SystemSwitchesResult.fromJson(Map<String, dynamic> json) =>
      _$SystemSwitchesResultFromJson(json);
}

class FetchSystemSwitchesRequest
    extends BaseRequest<SchoolScopedQueryPayload, SystemSwitchesResult> {
  FetchSystemSwitchesRequest()
    : super(
        '/api/v1/admin/system/switches',
        HttpMethod.get,
        fallbackMessage: '获取系统开关失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            SystemSwitchesResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateSystemSwitchPayload with _$UpdateSystemSwitchPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateSystemSwitchPayload({
    required String schoolId,
    required bool enabled,
  }) = _UpdateSystemSwitchPayload;

  factory UpdateSystemSwitchPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateSystemSwitchPayloadFromJson(json);
}

class UpdateSystemSwitchRequest
    extends BaseRequest<UpdateSystemSwitchPayload, AdminSystemSwitch> {
  UpdateSystemSwitchRequest({required String switchId})
    : super(
        '/api/v1/admin/system/switches/$switchId',
        HttpMethod.patch,
        fallbackMessage: '更新系统开关失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final inner = map['switch'];
          if (inner is Map<String, dynamic>) {
            return AdminSystemSwitch.fromJson(inner);
          }
          return AdminSystemSwitch.fromJson(map);
        },
      );
}

@freezed
abstract class SystemParametersResult with _$SystemParametersResult {
  const factory SystemParametersResult({
    @Default(<AdminSystemParameter>[]) List<AdminSystemParameter> parameters,
  }) = _SystemParametersResult;

  factory SystemParametersResult.fromJson(Map<String, dynamic> json) =>
      _$SystemParametersResultFromJson(json);
}

class FetchSystemParametersRequest
    extends BaseRequest<SchoolScopedQueryPayload, SystemParametersResult> {
  FetchSystemParametersRequest()
    : super(
        '/api/v1/admin/system/parameters',
        HttpMethod.get,
        fallbackMessage: '获取系统参数失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            SystemParametersResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateSystemParameterPayload
    with _$UpdateSystemParameterPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateSystemParameterPayload({
    required String schoolId,
    required String value,
  }) = _UpdateSystemParameterPayload;

  factory UpdateSystemParameterPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateSystemParameterPayloadFromJson(json);
}

class UpdateSystemParameterRequest
    extends BaseRequest<UpdateSystemParameterPayload, AdminSystemParameter> {
  UpdateSystemParameterRequest({required String parameterId})
    : super(
        '/api/v1/admin/system/parameters/$parameterId',
        HttpMethod.patch,
        fallbackMessage: '更新系统参数失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final inner = map['parameter'];
          if (inner is Map<String, dynamic>) {
            return AdminSystemParameter.fromJson(inner);
          }
          return AdminSystemParameter.fromJson(map);
        },
      );
}

@freezed
abstract class SystemBroadcastsResult with _$SystemBroadcastsResult {
  const factory SystemBroadcastsResult({
    @Default(<AdminSystemBroadcast>[]) List<AdminSystemBroadcast> broadcasts,
  }) = _SystemBroadcastsResult;

  factory SystemBroadcastsResult.fromJson(Map<String, dynamic> json) =>
      _$SystemBroadcastsResultFromJson(json);
}

class FetchSystemBroadcastsRequest
    extends BaseRequest<SchoolScopedQueryPayload, SystemBroadcastsResult> {
  FetchSystemBroadcastsRequest()
    : super(
        '/api/v1/admin/system/broadcasts',
        HttpMethod.get,
        fallbackMessage: '获取通知广播失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            SystemBroadcastsResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateSystemBroadcastPayload
    with _$UpdateSystemBroadcastPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateSystemBroadcastPayload({
    required String schoolId,
    AdminSystemBroadcastStatus? status,
    bool? pinned,
  }) = _UpdateSystemBroadcastPayload;

  factory UpdateSystemBroadcastPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateSystemBroadcastPayloadFromJson(json);
}

class UpdateSystemBroadcastRequest
    extends BaseRequest<UpdateSystemBroadcastPayload, AdminSystemBroadcast> {
  UpdateSystemBroadcastRequest({required String broadcastId})
    : super(
        '/api/v1/admin/system/broadcasts/$broadcastId',
        HttpMethod.patch,
        fallbackMessage: '更新通知广播失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final inner = map['broadcast'];
          if (inner is Map<String, dynamic>) {
            return AdminSystemBroadcast.fromJson(inner);
          }
          return AdminSystemBroadcast.fromJson(map);
        },
      );
}

@freezed
abstract class FetchSystemAuditLogsPayload with _$FetchSystemAuditLogsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory FetchSystemAuditLogsPayload({
    required String schoolId,
    @Default(50) int limit,
  }) = _FetchSystemAuditLogsPayload;

  factory FetchSystemAuditLogsPayload.fromJson(Map<String, dynamic> json) =>
      _$FetchSystemAuditLogsPayloadFromJson(json);
}

class FetchSystemAuditLogsRequest
    extends
        BaseRequest<FetchSystemAuditLogsPayload, List<AdminSystemAuditLog>> {
  FetchSystemAuditLogsRequest()
    : super(
        '/api/v1/admin/system/audit_logs',
        HttpMethod.get,
        fallbackMessage: '获取系统审计记录失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final logs = map['logs'];
          return _asMapList(logs).map(AdminSystemAuditLog.fromJson).toList();
        },
      );
}

@freezed
abstract class CreateOssCredentialPayload with _$CreateOssCredentialPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateOssCredentialPayload({
    required String schoolId,
    required String name,
    required String endpoint,
    @Default('') String internalEndpoint,
    required String region,
    required String bucket,
    required String accessKeyId,
    required String accessKeySecret,
    @Default('') String directoryPrefix,
    @Default('') String accessKeyDisplay,
    @Default(false) bool allowPublicRead,
    @Default(false) bool allowMultipartUpload,
    @Default(false) bool useRelayUpload,
    @Default(true) bool active,
    @Default(false) bool isPrimary,
  }) = _CreateOssCredentialPayload;

  factory CreateOssCredentialPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateOssCredentialPayloadFromJson(json);
}

class CreateOssCredentialRequest
    extends BaseRequest<CreateOssCredentialPayload, AdminOssCredential> {
  CreateOssCredentialRequest()
    : super(
        '/api/v1/admin/oss/credentials',
        HttpMethod.post,
        fallbackMessage: '创建 OSS 凭证失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final credential = map['credential'];
          if (credential is Map<String, dynamic>) {
            return AdminOssCredential.fromJson(credential);
          }
          return AdminOssCredential.fromJson(map);
        },
      );
}

class DeleteOssCredentialRequest
    extends BaseRequest<SchoolScopedBodyPayload, void> {
  DeleteOssCredentialRequest({required String credentialId})
    : super(
        '/api/v1/admin/oss/credentials/$credentialId',
        HttpMethod.delete,
        fallbackMessage: '删除 OSS 凭证失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class UpdateOssCredentialPayload with _$UpdateOssCredentialPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateOssCredentialPayload({
    required String schoolId,
    String? name,
    String? endpoint,
    String? internalEndpoint,
    String? region,
    String? bucket,
    String? directoryPrefix,
    String? accessKeyId,
    String? accessKeySecret,
    String? accessKeyDisplay,
    bool? allowPublicRead,
    bool? allowMultipartUpload,
    bool? useRelayUpload,
    bool? active,
    bool? isPrimary,
  }) = _UpdateOssCredentialPayload;

  factory UpdateOssCredentialPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateOssCredentialPayloadFromJson(json);
}

class UpdateOssCredentialRequest
    extends BaseRequest<UpdateOssCredentialPayload, AdminOssCredential> {
  UpdateOssCredentialRequest({required String credentialId})
    : super(
        '/api/v1/admin/oss/credentials/$credentialId',
        HttpMethod.patch,
        fallbackMessage: '更新 OSS 凭证失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final credential = map['credential'];
          if (credential is Map<String, dynamic>) {
            return AdminOssCredential.fromJson(credential);
          }
          return AdminOssCredential.fromJson(map);
        },
      );
}

@freezed
abstract class CreateOssPolicyPayload with _$CreateOssPolicyPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateOssPolicyPayload({
    required String schoolId,
    required String name,
    required String appliesTo,
    @Default('') String description,
    @Default(AdminOssPolicyStatus.enabled) AdminOssPolicyStatus status,
  }) = _CreateOssPolicyPayload;

  factory CreateOssPolicyPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateOssPolicyPayloadFromJson(json);
}

class CreateOssPolicyRequest
    extends BaseRequest<CreateOssPolicyPayload, AdminOssPolicy> {
  CreateOssPolicyRequest()
    : super(
        '/api/v1/admin/oss/policies',
        HttpMethod.post,
        fallbackMessage: '创建 OSS 策略失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final policy = map['policy'];
          if (policy is Map<String, dynamic>) {
            return AdminOssPolicy.fromJson(policy);
          }
          return AdminOssPolicy.fromJson(map);
        },
      );
}

class DeleteOssPolicyRequest
    extends BaseRequest<SchoolScopedBodyPayload, void> {
  DeleteOssPolicyRequest({required String policyId})
    : super(
        '/api/v1/admin/oss/policies/$policyId',
        HttpMethod.delete,
        fallbackMessage: '删除 OSS 策略失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class UpdateOssPolicyStatusPayload
    with _$UpdateOssPolicyStatusPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateOssPolicyStatusPayload({
    required String schoolId,
    required AdminOssPolicyStatus status,
  }) = _UpdateOssPolicyStatusPayload;

  factory UpdateOssPolicyStatusPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateOssPolicyStatusPayloadFromJson(json);
}

class UpdateOssPolicyStatusRequest
    extends BaseRequest<UpdateOssPolicyStatusPayload, AdminOssPolicy> {
  UpdateOssPolicyStatusRequest({required String policyId})
    : super(
        '/api/v1/admin/oss/policies/$policyId',
        HttpMethod.patch,
        fallbackMessage: '更新 OSS 策略失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final policy = map['policy'];
          if (policy is Map<String, dynamic>) {
            return AdminOssPolicy.fromJson(policy);
          }
          return AdminOssPolicy.fromJson(map);
        },
      );
}

@freezed
abstract class CreateDepartmentPayload with _$CreateDepartmentPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateDepartmentPayload({
    required String schoolId,
    required String name,
  }) = _CreateDepartmentPayload;

  factory CreateDepartmentPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateDepartmentPayloadFromJson(json);
}

@freezed
abstract class CreateDepartmentResult with _$CreateDepartmentResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateDepartmentResult({String? departmentId}) =
      _CreateDepartmentResult;

  factory CreateDepartmentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDepartmentResultFromJson(json);
}

class CreateDepartmentRequest
    extends BaseRequest<CreateDepartmentPayload, String> {
  CreateDepartmentRequest()
    : super(
        '/api/v1/admin/departments',
        HttpMethod.post,
        fallbackMessage: '创建院系失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final result = CreateDepartmentResult.fromJson(map);
          return result.departmentId ?? '';
        },
      );
}

@freezed
abstract class CreateClassPayload with _$CreateClassPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateClassPayload({
    required String schoolId,
    required String departmentId,
    required String name,
  }) = _CreateClassPayload;

  factory CreateClassPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateClassPayloadFromJson(json);
}

@freezed
abstract class CreateClassResult with _$CreateClassResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateClassResult({String? classId}) = _CreateClassResult;

  factory CreateClassResult.fromJson(Map<String, dynamic> json) =>
      _$CreateClassResultFromJson(json);
}

class CreateClassRequest extends BaseRequest<CreateClassPayload, String> {
  CreateClassRequest()
    : super(
        '/api/v1/admin/classes',
        HttpMethod.post,
        fallbackMessage: '创建班级失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final result = CreateClassResult.fromJson(map);
          return result.classId ?? '';
        },
      );
}

@freezed
abstract class UpdateDepartmentPayload with _$UpdateDepartmentPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateDepartmentPayload({
    required String schoolId,
    required String name,
  }) = _UpdateDepartmentPayload;

  factory UpdateDepartmentPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateDepartmentPayloadFromJson(json);
}

@freezed
abstract class UpdateDepartmentResult with _$UpdateDepartmentResult {
  const factory UpdateDepartmentResult({required Department department}) =
      _UpdateDepartmentResult;

  factory UpdateDepartmentResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDepartmentResultFromJson(json);
}

class UpdateDepartmentRequest
    extends BaseRequest<UpdateDepartmentPayload, Department> {
  UpdateDepartmentRequest({required String departmentId})
    : super(
        '/api/v1/admin/departments/$departmentId',
        HttpMethod.patch,
        fallbackMessage: '更新院系失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) =>
            UpdateDepartmentResult.fromJson(_requireMap(value)).department,
      );
}

class DeleteDepartmentRequest
    extends BaseRequest<SchoolScopedQueryPayload, void> {
  DeleteDepartmentRequest({required String departmentId})
    : super(
        '/api/v1/admin/departments/$departmentId',
        HttpMethod.delete,
        fallbackMessage: '删除院系失败',
        queryParameters: (value) => value.toJson(),
      );
}

@freezed
abstract class UpdateClassPayload with _$UpdateClassPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateClassPayload({
    required String schoolId,
    required String name,
  }) = _UpdateClassPayload;

  factory UpdateClassPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateClassPayloadFromJson(json);
}

@freezed
abstract class UpdateClassResult with _$UpdateClassResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UpdateClassResult({required ClassInfo classInfo}) =
      _UpdateClassResult;

  factory UpdateClassResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateClassResultFromJson(json);
}

class UpdateClassRequest extends BaseRequest<UpdateClassPayload, ClassInfo> {
  UpdateClassRequest({required String classId})
    : super(
        '/api/v1/admin/classes/$classId',
        HttpMethod.patch,
        fallbackMessage: '更新班级失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          final inner = map['class'];
          if (inner is Map<String, dynamic>) {
            return ClassInfo.fromJson(inner);
          }
          return UpdateClassResult.fromJson(map).classInfo;
        },
      );
}

class DeleteClassRequest extends BaseRequest<SchoolScopedQueryPayload, void> {
  DeleteClassRequest({required String classId})
    : super(
        '/api/v1/admin/classes/$classId',
        HttpMethod.delete,
        fallbackMessage: '删除班级失败',
        queryParameters: (value) => value.toJson(),
      );
}

@freezed
abstract class FetchCoursesPayload with _$FetchCoursesPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory FetchCoursesPayload({
    required String schoolId,
    String? departmentId,
    String? classId,
    @Default(1) int page,
    @Default(20) int size,
  }) = _FetchCoursesPayload;

  factory FetchCoursesPayload.fromJson(Map<String, dynamic> json) =>
      _$FetchCoursesPayloadFromJson(json);
}

class FetchCoursesRequest
    extends BaseRequest<FetchCoursesPayload, List<CourseAssignmentInfo>> {
  FetchCoursesRequest()
    : super(
        '/api/v1/admin/courses',
        HttpMethod.get,
        fallbackMessage: '获取课程列表失败',
        queryParameters: (value) => _dropNullAndEmpty(value.toJson()),
        responseParser: (value) {
          final map = _requireMap(value);
          return _asMapList(
            map['items'],
          ).map(CourseAssignmentInfo.fromJson).toList();
        },
      );
}

@freezed
abstract class CreateCoursePayload with _$CreateCoursePayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateCoursePayload({
    required String schoolId,
    required String name,
    String? description,
  }) = _CreateCoursePayload;

  factory CreateCoursePayload.fromJson(Map<String, dynamic> json) =>
      _$CreateCoursePayloadFromJson(json);
}

class CreateCourseRequest extends BaseRequest<CreateCoursePayload, Course> {
  CreateCourseRequest()
    : super(
        '/api/v1/admin/courses',
        HttpMethod.post,
        fallbackMessage: '创建课程失败',
        queryParameters: (value) => {'school_id': value.schoolId},
        requestEncoder: (value) => {
          'name': value.name,
          'description': value.description,
        },
        responseParser: (value) => Course.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateCoursePayload with _$UpdateCoursePayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateCoursePayload({String? name, String? description}) =
      _UpdateCoursePayload;

  factory UpdateCoursePayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateCoursePayloadFromJson(json);
}

class UpdateCourseRequest extends BaseRequest<UpdateCoursePayload, void> {
  UpdateCourseRequest({required String courseId})
    : super(
        '/api/v1/admin/courses/$courseId',
        HttpMethod.patch,
        fallbackMessage: '更新课程失败',
        requestEncoder: (value) => _dropNullAndEmpty(value.toJson()),
      );
}

class DeleteCourseRequest extends BaseRequest<void, void> {
  DeleteCourseRequest({required String courseId})
    : super(
        '/api/v1/admin/courses/$courseId',
        HttpMethod.delete,
        fallbackMessage: '删除课程失败',
      );
}

@freezed
abstract class UpdateAssignmentPayload with _$UpdateAssignmentPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateAssignmentPayload({
    required String teacherId,
    required String classId,
  }) = _UpdateAssignmentPayload;

  factory UpdateAssignmentPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssignmentPayloadFromJson(json);
}

class UpdateAssignmentRequest
    extends BaseRequest<UpdateAssignmentPayload, void> {
  UpdateAssignmentRequest({required String assignmentId})
    : super(
        '/api/v1/admin/courses/assignments/$assignmentId',
        HttpMethod.patch,
        fallbackMessage: '更新分配失败',
        requestEncoder: (value) => value.toJson(),
      );
}

class RemoveAssignmentRequest extends BaseRequest<void, void> {
  RemoveAssignmentRequest({required String assignmentId})
    : super(
        '/api/v1/admin/courses/assignments/$assignmentId',
        HttpMethod.delete,
        fallbackMessage: '移除分配失败',
      );
}

@freezed
abstract class FetchCourseAssignmentsPayload
    with _$FetchCourseAssignmentsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory FetchCourseAssignmentsPayload({
    required String schoolId,
    String? courseId,
    String? departmentId,
    String? classId,
    @Default(1) int page,
    @Default(20) int pageSize,
  }) = _FetchCourseAssignmentsPayload;

  factory FetchCourseAssignmentsPayload.fromJson(Map<String, dynamic> json) =>
      _$FetchCourseAssignmentsPayloadFromJson(json);
}

class FetchCourseAssignmentsRequest
    extends
        BaseRequest<FetchCourseAssignmentsPayload, List<CourseAssignmentInfo>> {
  FetchCourseAssignmentsRequest()
    : super(
        '/api/v1/admin/courses/assignments',
        HttpMethod.get,
        fallbackMessage: '获取课程分配失败',
        queryParameters: (value) {
          final map = value.toJson();
          map['size'] = value.pageSize;
          map.remove('page_size');
          return _dropNullAndEmpty(map);
        },
        responseParser: (value) {
          final map = _requireMap(value);
          return _asMapList(
            map['items'],
          ).map(CourseAssignmentInfo.fromJson).toList();
        },
      );
}

@freezed
abstract class AssignStudentsPayload with _$AssignStudentsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory AssignStudentsPayload({
    List<String>? studentIds,
    String? classId,
    String? departmentId,
  }) = _AssignStudentsPayload;

  factory AssignStudentsPayload.fromJson(Map<String, dynamic> json) =>
      _$AssignStudentsPayloadFromJson(json);
}

class AssignStudentsRequest extends BaseRequest<AssignStudentsPayload, void> {
  AssignStudentsRequest({required String courseId})
    : super(
        '/api/v1/admin/courses/$courseId/assign/students',
        HttpMethod.post,
        fallbackMessage: '分配学生失败',
        requestEncoder: (value) => value.toJson(),
      );
}

class ListTimeSlotsRequest
    extends BaseRequest<SchoolScopedQueryPayload, List<TimeSlot>> {
  ListTimeSlotsRequest()
    : super(
        '/api/v1/admin/schedules/slots',
        HttpMethod.get,
        fallbackMessage: 'Failed to fetch time slots',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) {
          if (value is List) {
            return value
                .whereType<Map<String, dynamic>>()
                .map(TimeSlot.fromJson)
                .toList();
          }
          final map = _requireMap(value);
          return _asMapList(map['time_slots']).map(TimeSlot.fromJson).toList();
        },
      );
}

@freezed
abstract class CreateTimeSlotPayload with _$CreateTimeSlotPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateTimeSlotPayload({
    required String schoolId,
    required String name,
    required String startTime,
    required String endTime,
  }) = _CreateTimeSlotPayload;

  factory CreateTimeSlotPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateTimeSlotPayloadFromJson(json);
}

class CreateTimeSlotRequest
    extends BaseRequest<CreateTimeSlotPayload, TimeSlot> {
  CreateTimeSlotRequest()
    : super(
        '/api/v1/admin/schedules/slots',
        HttpMethod.post,
        fallbackMessage: 'Failed to create time slot',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => TimeSlot.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateTimeSlotPayload with _$UpdateTimeSlotPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateTimeSlotPayload({
    required String name,
    required String startTime,
    required String endTime,
  }) = _UpdateTimeSlotPayload;

  factory UpdateTimeSlotPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeSlotPayloadFromJson(json);
}

class UpdateTimeSlotRequest extends BaseRequest<UpdateTimeSlotPayload, void> {
  UpdateTimeSlotRequest({required String timeSlotId})
    : super(
        '/api/v1/admin/time-slots/$timeSlotId',
        HttpMethod.patch,
        fallbackMessage: 'Failed to update time slot',
        requestEncoder: (value) => value.toJson(),
      );
}

class DeleteTimeSlotRequest extends BaseRequest<void, void> {
  DeleteTimeSlotRequest({required String timeSlotId})
    : super(
        '/api/v1/admin/time-slots/$timeSlotId',
        HttpMethod.delete,
        fallbackMessage: 'Failed to delete time slot',
      );
}

@freezed
abstract class CreateScheduleRulePayload with _$CreateScheduleRulePayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateScheduleRulePayload({
    required String schoolId,
    required String courseId,
    required String classId,
    String? teacherId,
    required String slotId,
    required int dayOfWeek,
    required String location,
    String? classroomId,
    required String startDate,
    required String endDate,
  }) = _CreateScheduleRulePayload;

  factory CreateScheduleRulePayload.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleRulePayloadFromJson(json);
}

class CreateScheduleRuleRequest
    extends BaseRequest<CreateScheduleRulePayload, CourseSchedule> {
  CreateScheduleRuleRequest()
    : super(
        '/api/v1/admin/schedules/rules',
        HttpMethod.post,
        fallbackMessage: 'Failed to create schedule rule',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => CourseSchedule.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class ListScheduleRulesPayload with _$ListScheduleRulesPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory ListScheduleRulesPayload({
    required String schoolId,
    String? courseId,
  }) = _ListScheduleRulesPayload;

  factory ListScheduleRulesPayload.fromJson(Map<String, dynamic> json) =>
      _$ListScheduleRulesPayloadFromJson(json);
}

class ListScheduleRulesRequest
    extends BaseRequest<ListScheduleRulesPayload, List<CourseSchedule>> {
  ListScheduleRulesRequest()
    : super(
        '/api/v1/admin/schedules/rules',
        HttpMethod.get,
        fallbackMessage: 'Failed to fetch schedule rules',
        queryParameters: (value) => _dropNullAndEmpty(value.toJson()),
        responseParser: (value) {
          if (value is List) {
            return value
                .whereType<Map<String, dynamic>>()
                .map(CourseSchedule.fromJson)
                .toList();
          }
          return <CourseSchedule>[];
        },
      );
}

class DeleteScheduleRuleRequest
    extends BaseRequest<SchoolScopedQueryPayload, void> {
  DeleteScheduleRuleRequest({required String ruleId})
    : super(
        '/api/v1/admin/schedules/rules/$ruleId',
        HttpMethod.delete,
        fallbackMessage: 'Failed to delete schedule rule',
        queryParameters: (value) => value.toJson(),
      );
}

class GetScheduleStatsRequest
    extends BaseRequest<SchoolScopedQueryPayload, ScheduleStats> {
  GetScheduleStatsRequest()
    : super(
        '/api/v1/admin/schedules/stats',
        HttpMethod.get,
        fallbackMessage: 'Failed to fetch stats',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) => ScheduleStats.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class GenerateSessionsPayload with _$GenerateSessionsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory GenerateSessionsPayload({
    required String schoolId,
    required String start,
    required String end,
  }) = _GenerateSessionsPayload;

  factory GenerateSessionsPayload.fromJson(Map<String, dynamic> json) =>
      _$GenerateSessionsPayloadFromJson(json);
}

class GenerateSessionsRequest
    extends BaseRequest<GenerateSessionsPayload, void> {
  GenerateSessionsRequest()
    : super(
        '/api/v1/admin/schedules/generate',
        HttpMethod.post,
        fallbackMessage: 'Failed to generate sessions',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class FetchClassroomsPayload with _$FetchClassroomsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory FetchClassroomsPayload({
    required String schoolId,
    @Default(1) int page,
    @Default(20) int size,
  }) = _FetchClassroomsPayload;

  factory FetchClassroomsPayload.fromJson(Map<String, dynamic> json) =>
      _$FetchClassroomsPayloadFromJson(json);
}

class FetchClassroomsRequest
    extends BaseRequest<FetchClassroomsPayload, List<Classroom>> {
  FetchClassroomsRequest()
    : super(
        '/api/v1/admin/classrooms',
        HttpMethod.get,
        fallbackMessage: '获取教室列表失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) {
          final map = _requireMap(value);
          return _asMapList(map['classrooms']).map(Classroom.fromJson).toList();
        },
      );
}

@freezed
abstract class CreateClassroomPayload with _$CreateClassroomPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateClassroomPayload({
    required String schoolId,
    required String location,
  }) = _CreateClassroomPayload;

  factory CreateClassroomPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateClassroomPayloadFromJson(json);
}

class CreateClassroomRequest
    extends BaseRequest<CreateClassroomPayload, Classroom> {
  CreateClassroomRequest()
    : super(
        '/api/v1/admin/classrooms',
        HttpMethod.post,
        fallbackMessage: '创建教室失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => Classroom.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class UpdateClassroomPayload with _$UpdateClassroomPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateClassroomPayload({required String location}) =
      _UpdateClassroomPayload;

  factory UpdateClassroomPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateClassroomPayloadFromJson(json);
}

class UpdateClassroomRequest
    extends BaseRequest<UpdateClassroomPayload, Classroom> {
  UpdateClassroomRequest({required String classroomId})
    : super(
        '/api/v1/admin/classrooms/$classroomId',
        HttpMethod.patch,
        fallbackMessage: '更新教室失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => Classroom.fromJson(_requireMap(value)),
      );
}

class DeleteClassroomRequest extends BaseRequest<void, void> {
  DeleteClassroomRequest({required String classroomId})
    : super(
        '/api/v1/admin/classrooms/$classroomId',
        HttpMethod.delete,
        fallbackMessage: '删除教室失败',
      );
}

@freezed
abstract class AnalyzeBatchOperationPayload
    with _$AnalyzeBatchOperationPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory AnalyzeBatchOperationPayload({
    required String schoolId,
    required String instruction,
  }) = _AnalyzeBatchOperationPayload;

  factory AnalyzeBatchOperationPayload.fromJson(Map<String, dynamic> json) =>
      _$AnalyzeBatchOperationPayloadFromJson(json);
}

@freezed
abstract class AnalyzeBatchOperationResult with _$AnalyzeBatchOperationResult {
  const factory AnalyzeBatchOperationResult({
    @Default('') String analysis,
    @Default(<AIOperation>[]) List<AIOperation> operations,
  }) = _AnalyzeBatchOperationResult;

  factory AnalyzeBatchOperationResult.fromJson(Map<String, dynamic> json) =>
      _$AnalyzeBatchOperationResultFromJson(json);
}

class AnalyzeBatchOperationRequest
    extends
        BaseRequest<AnalyzeBatchOperationPayload, AnalyzeBatchOperationResult> {
  AnalyzeBatchOperationRequest()
    : super(
        '/api/v1/admin/ai/analyze',
        HttpMethod.post,
        fallbackMessage: '分析失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) =>
            AnalyzeBatchOperationResult.fromJson(_requireMap(value)),
      );
}

@freezed
abstract class ExecuteBatchOperationsPayload
    with _$ExecuteBatchOperationsPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory ExecuteBatchOperationsPayload({
    required String schoolId,
    required List<AIOperation> operations,
  }) = _ExecuteBatchOperationsPayload;

  factory ExecuteBatchOperationsPayload.fromJson(Map<String, dynamic> json) =>
      _$ExecuteBatchOperationsPayloadFromJson(json);
}

@freezed
abstract class ExecuteBatchOperationsResult
    with _$ExecuteBatchOperationsResult {
  const factory ExecuteBatchOperationsResult({
    @Default(<String>[]) List<String> results,
  }) = _ExecuteBatchOperationsResult;

  factory ExecuteBatchOperationsResult.fromJson(Map<String, dynamic> json) =>
      _$ExecuteBatchOperationsResultFromJson(json);
}

class ExecuteBatchOperationsRequest
    extends BaseRequest<ExecuteBatchOperationsPayload, List<String>> {
  ExecuteBatchOperationsRequest()
    : super(
        '/api/v1/admin/ai/execute',
        HttpMethod.post,
        fallbackMessage: '执行失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) =>
            ExecuteBatchOperationsResult.fromJson(_requireMap(value)).results,
      );
}
