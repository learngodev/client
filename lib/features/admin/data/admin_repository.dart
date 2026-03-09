import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/accounts.dart';
import '../domain/ai_ops.dart';
import '../domain/ai_settings.dart';
import '../domain/classroom.dart';
import '../domain/course.dart';
import '../domain/models.dart';
import '../domain/oss.dart';
import '../domain/schedule.dart';
import '../domain/system_settings.dart';
import 'admin_api_requests.dart';

class AdminRepository {
  const AdminRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Department>> fetchDepartments({required String schoolId}) {
    return _apiClient
        .execute(
          FetchDepartmentsRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.departments.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<AIAgentSetting?> fetchAISettings({required String schoolId}) {
    return _apiClient
        .execute(
          FetchAISettingsRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then((result) => result.setting);
  }

  Future<AIAgentSetting> updateAISettings({required AIAgentSetting setting}) {
    return _apiClient.execute(
      UpdateAISettingsRequest(),
      payload: UpdateAISettingsPayload(setting: setting),
    );
  }

  Future<List<ClassInfo>> fetchClassesByDepartment({
    required String schoolId,
    required String departmentId,
  }) {
    return _apiClient
        .execute(
          FetchClassesByDepartmentRequest(departmentId: departmentId),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.classes.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<List<DepartmentNode>> fetchDepartmentTree({
    required String schoolId,
  }) async {
    final departments = await fetchDepartments(schoolId: schoolId);
    final futures = departments.map((department) async {
      final classes = await fetchClassesByDepartment(
        schoolId: schoolId,
        departmentId: department.id,
      );
      return DepartmentNode(department: department, classes: classes);
    });
    return Future.wait(futures);
  }

  Future<AdminAccountPage> fetchAccounts({
    required String schoolId,
    AdminAccountRole? role,
    AdminAccountStatus? status,
    String? departmentId,
    String? departmentScope,
    String? classId,
    String? classScope,
    String? courseId,
    int page = 1,
    int pageSize = 50,
    String query = '',
  }) {
    return _apiClient.execute(
      FetchAccountsRequest(),
      payload: FetchAccountsPayload(
        schoolId: schoolId,
        role: role,
        status: status,
        departmentId: departmentId,
        departmentScope: departmentScope,
        classId: classId,
        classScope: classScope,
        courseId: courseId,
        page: page,
        pageSize: pageSize,
        query: query,
      ),
    );
  }

  Future<void> createTeacher({
    required String schoolId,
    required String number,
    required String name,
    required String email,
    String? phone,
    required String defaultPassword,
  }) {
    return _apiClient.execute(
      CreateTeacherRequest(),
      payload: CreateTeacherPayload(
        schoolId: schoolId,
        number: number,
        name: name,
        email: email,
        phone: phone,
        defaultPassword: defaultPassword,
      ),
    );
  }

  Future<void> createStudent({
    required String schoolId,
    required String number,
    required String name,
    required String email,
    String? phone,
    String? classId,
    required String defaultPassword,
  }) {
    return _apiClient.execute(
      CreateStudentRequest(),
      payload: CreateStudentPayload(
        schoolId: schoolId,
        number: number,
        name: name,
        email: email,
        phone: phone,
        classId: classId ?? '',
        defaultPassword: defaultPassword,
      ),
    );
  }

  Future<void> updateAccount({
    required String schoolId,
    required String accountId,
    String? name,
    String? number,
    String? email,
    String? phone,
  }) {
    return _apiClient.execute(
      UpdateAccountRequest(accountId: accountId),
      payload: UpdateAccountPayload(
        schoolId: schoolId,
        name: name,
        number: number,
        email: email,
        phone: phone,
      ),
    );
  }

  Future<void> updateAccountStructure({
    required String schoolId,
    required String accountId,
    String? departmentId,
    String? classId,
  }) {
    return _apiClient.execute(
      UpdateAccountStructureRequest(accountId: accountId),
      payload: UpdateAccountStructurePayload(
        schoolId: schoolId,
        departmentId: departmentId,
        classId: classId,
      ),
    );
  }

  Future<void> resetAccountPassword({
    required String schoolId,
    required String accountId,
  }) {
    return _apiClient.execute(
      ResetAccountPasswordRequest(accountId: accountId),
      payload: SchoolScopedBodyPayload(schoolId: schoolId),
    );
  }

  Future<void> lockAccount({
    required String schoolId,
    required String accountId,
  }) {
    return _apiClient.execute(
      LockAccountRequest(accountId: accountId),
      payload: SchoolScopedBodyPayload(schoolId: schoolId),
    );
  }

  Future<void> unlockAccount({
    required String schoolId,
    required String accountId,
  }) {
    return _apiClient.execute(
      UnlockAccountRequest(accountId: accountId),
      payload: SchoolScopedBodyPayload(schoolId: schoolId),
    );
  }

  Future<void> deleteAccount({
    required String schoolId,
    required String accountId,
  }) {
    return _apiClient.execute(
      DeleteAccountRequest(accountId: accountId),
      payload: SchoolScopedQueryPayload(schoolId: schoolId),
    );
  }

  Future<Map<String, dynamic>> batchOperateAccounts({
    required String schoolId,
    required List<String> accountIds,
    required String action,
  }) {
    return _apiClient.execute(
      BatchOperateAccountsRequest(),
      payload: BatchOperateAccountsPayload(
        schoolId: schoolId,
        accountIds: accountIds,
        action: action,
      ),
    );
  }

  Future<List<AdminOssCredential>> fetchOssCredentials({
    required String schoolId,
  }) {
    return _apiClient
        .execute(
          FetchOssCredentialsRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.credentials.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<List<AdminOssPolicy>> fetchOssPolicies({required String schoolId}) {
    return _apiClient
        .execute(
          FetchOssPoliciesRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.policies.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<List<AdminOssAuditLog>> fetchOssAuditLogs({
    required String schoolId,
    int limit = 20,
  }) {
    return _apiClient
        .execute(
          FetchOssAuditLogsRequest(),
          payload: FetchOssAuditLogsPayload(schoolId: schoolId, limit: limit),
        )
        .then(
          (result) => result.logs.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<List<AdminSystemSwitch>> fetchSystemSwitches({
    required String schoolId,
  }) {
    return _apiClient
        .execute(
          FetchSystemSwitchesRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.switches.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<AdminSystemSwitch> updateSystemSwitch({
    required String schoolId,
    required String switchId,
    required bool enabled,
  }) {
    return _apiClient.execute(
      UpdateSystemSwitchRequest(switchId: switchId),
      payload: UpdateSystemSwitchPayload(schoolId: schoolId, enabled: enabled),
    );
  }

  Future<List<AdminSystemParameter>> fetchSystemParameters({
    required String schoolId,
  }) {
    return _apiClient
        .execute(
          FetchSystemParametersRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.parameters.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<AdminSystemParameter> updateSystemParameter({
    required String schoolId,
    required String parameterId,
    required String value,
  }) {
    return _apiClient.execute(
      UpdateSystemParameterRequest(parameterId: parameterId),
      payload: UpdateSystemParameterPayload(schoolId: schoolId, value: value),
    );
  }

  Future<List<AdminSystemBroadcast>> fetchSystemBroadcasts({
    required String schoolId,
  }) {
    return _apiClient
        .execute(
          FetchSystemBroadcastsRequest(),
          payload: SchoolScopedQueryPayload(schoolId: schoolId),
        )
        .then(
          (result) =>
              result.broadcasts.where((item) => item.id.isNotEmpty).toList(),
        );
  }

  Future<AdminSystemBroadcast> updateSystemBroadcast({
    required String schoolId,
    required String broadcastId,
    AdminSystemBroadcastStatus? status,
    bool? pinned,
  }) {
    return _apiClient.execute(
      UpdateSystemBroadcastRequest(broadcastId: broadcastId),
      payload: UpdateSystemBroadcastPayload(
        schoolId: schoolId,
        status: status,
        pinned: pinned,
      ),
    );
  }

  Future<List<AdminSystemAuditLog>> fetchSystemAuditLogs({
    required String schoolId,
    int limit = 50,
  }) {
    return _apiClient.execute(
      FetchSystemAuditLogsRequest(),
      payload: FetchSystemAuditLogsPayload(schoolId: schoolId, limit: limit),
    );
  }

  Future<AdminOssCredential> createOssCredential({
    required String schoolId,
    required String name,
    required String endpoint,
    String internalEndpoint = '',
    required String region,
    required String bucket,
    required String accessKeyId,
    required String accessKeySecret,
    String directoryPrefix = '',
    String accessKeyDisplay = '',
    bool allowPublicRead = false,
    bool allowMultipartUpload = false,
    bool useRelayUpload = false,
    bool active = true,
    bool isPrimary = false,
  }) {
    return _apiClient.execute(
      CreateOssCredentialRequest(),
      payload: CreateOssCredentialPayload(
        schoolId: schoolId,
        name: name,
        endpoint: endpoint,
        internalEndpoint: internalEndpoint,
        region: region,
        bucket: bucket,
        accessKeyId: accessKeyId,
        accessKeySecret: accessKeySecret,
        directoryPrefix: directoryPrefix,
        accessKeyDisplay: accessKeyDisplay,
        allowPublicRead: allowPublicRead,
        allowMultipartUpload: allowMultipartUpload,
        useRelayUpload: useRelayUpload,
        active: active,
        isPrimary: isPrimary,
      ),
    );
  }

  Future<void> deleteOssCredential({
    required String schoolId,
    required String credentialId,
  }) {
    return _apiClient.execute(
      DeleteOssCredentialRequest(credentialId: credentialId),
      payload: SchoolScopedBodyPayload(schoolId: schoolId),
    );
  }

  Future<AdminOssCredential> updateOssCredential({
    required String schoolId,
    required String credentialId,
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
  }) {
    return _apiClient.execute(
      UpdateOssCredentialRequest(credentialId: credentialId),
      payload: UpdateOssCredentialPayload(
        schoolId: schoolId,
        name: name,
        endpoint: endpoint,
        internalEndpoint: internalEndpoint,
        region: region,
        bucket: bucket,
        directoryPrefix: directoryPrefix,
        accessKeyId: accessKeyId,
        accessKeySecret: accessKeySecret,
        accessKeyDisplay: accessKeyDisplay,
        allowPublicRead: allowPublicRead,
        allowMultipartUpload: allowMultipartUpload,
        useRelayUpload: useRelayUpload,
        active: active,
        isPrimary: isPrimary,
      ),
    );
  }

  Future<AdminOssPolicy> createOssPolicy({
    required String schoolId,
    required String name,
    required String appliesTo,
    String description = '',
    AdminOssPolicyStatus status = AdminOssPolicyStatus.enabled,
  }) {
    return _apiClient.execute(
      CreateOssPolicyRequest(),
      payload: CreateOssPolicyPayload(
        schoolId: schoolId,
        name: name,
        appliesTo: appliesTo,
        description: description,
        status: status,
      ),
    );
  }

  Future<void> deleteOssPolicy({
    required String schoolId,
    required String policyId,
  }) {
    return _apiClient.execute(
      DeleteOssPolicyRequest(policyId: policyId),
      payload: SchoolScopedBodyPayload(schoolId: schoolId),
    );
  }

  Future<AdminOssPolicy> updateOssPolicyStatus({
    required String schoolId,
    required String policyId,
    required AdminOssPolicyStatus status,
  }) {
    return _apiClient.execute(
      UpdateOssPolicyStatusRequest(policyId: policyId),
      payload: UpdateOssPolicyStatusPayload(schoolId: schoolId, status: status),
    );
  }

  Future<String> createDepartment({
    required String schoolId,
    required String name,
  }) {
    return _apiClient.execute(
      CreateDepartmentRequest(),
      payload: CreateDepartmentPayload(schoolId: schoolId, name: name),
    );
  }

  Future<String> createClass({
    required String schoolId,
    required String departmentId,
    required String name,
  }) {
    return _apiClient.execute(
      CreateClassRequest(),
      payload: CreateClassPayload(
        schoolId: schoolId,
        departmentId: departmentId,
        name: name,
      ),
    );
  }

  Future<Department> updateDepartment({
    required String schoolId,
    required String departmentId,
    required String name,
  }) {
    return _apiClient.execute(
      UpdateDepartmentRequest(departmentId: departmentId),
      payload: UpdateDepartmentPayload(schoolId: schoolId, name: name),
    );
  }

  Future<void> deleteDepartment({
    required String schoolId,
    required String departmentId,
  }) {
    return _apiClient.execute(
      DeleteDepartmentRequest(departmentId: departmentId),
      payload: SchoolScopedQueryPayload(schoolId: schoolId),
    );
  }

  Future<ClassInfo> updateClass({
    required String schoolId,
    required String classId,
    required String name,
  }) {
    return _apiClient.execute(
      UpdateClassRequest(classId: classId),
      payload: UpdateClassPayload(schoolId: schoolId, name: name),
    );
  }

  Future<void> deleteClass({
    required String schoolId,
    required String classId,
  }) {
    return _apiClient.execute(
      DeleteClassRequest(classId: classId),
      payload: SchoolScopedQueryPayload(schoolId: schoolId),
    );
  }

  Future<List<CourseAssignmentInfo>> fetchCourses({
    required String schoolId,
    String? departmentId,
    String? classId,
    int page = 1,
    int size = 20,
  }) {
    return _apiClient.execute(
      FetchCoursesRequest(),
      payload: FetchCoursesPayload(
        schoolId: schoolId,
        departmentId: departmentId,
        classId: classId,
        page: page,
        size: size,
      ),
    );
  }

  Future<Course> createCourse({
    required String schoolId,
    required String name,
    String? description,
  }) {
    return _apiClient.execute(
      CreateCourseRequest(),
      payload: CreateCoursePayload(
        schoolId: schoolId,
        name: name,
        description: description,
      ),
    );
  }

  Future<void> updateCourse({
    required String id,
    String? name,
    String? description,
  }) {
    return _apiClient.execute(
      UpdateCourseRequest(courseId: id),
      payload: UpdateCoursePayload(name: name, description: description),
    );
  }

  Future<void> deleteCourse({required String id}) {
    return _apiClient.execute(DeleteCourseRequest(courseId: id));
  }

  Future<void> updateAssignment({
    required String id,
    required String teacherId,
    required String classId,
  }) {
    return _apiClient.execute(
      UpdateAssignmentRequest(assignmentId: id),
      payload: UpdateAssignmentPayload(teacherId: teacherId, classId: classId),
    );
  }

  Future<void> removeAssignment({required String id}) {
    return _apiClient.execute(RemoveAssignmentRequest(assignmentId: id));
  }

  Future<List<CourseAssignmentInfo>> fetchCourseAssignments({
    required String schoolId,
    String? courseId,
    String? departmentId,
    String? classId,
    int page = 1,
    int pageSize = 20,
  }) {
    return _apiClient.execute(
      FetchCourseAssignmentsRequest(),
      payload: FetchCourseAssignmentsPayload(
        schoolId: schoolId,
        courseId: courseId,
        departmentId: departmentId,
        classId: classId,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  Future<void> assignStudents({
    required String courseId,
    List<String>? studentIds,
    String? classId,
    String? departmentId,
  }) {
    return _apiClient.execute(
      AssignStudentsRequest(courseId: courseId),
      payload: AssignStudentsPayload(
        studentIds: studentIds,
        classId: classId,
        departmentId: departmentId,
      ),
    );
  }

  Future<List<TimeSlot>> listTimeSlots({required String schoolId}) {
    return _apiClient.execute(
      ListTimeSlotsRequest(),
      payload: SchoolScopedQueryPayload(schoolId: schoolId),
    );
  }

  Future<TimeSlot> createTimeSlot({
    required String schoolId,
    required String name,
    required String startTime,
    required String endTime,
  }) {
    return _apiClient.execute(
      CreateTimeSlotRequest(),
      payload: CreateTimeSlotPayload(
        schoolId: schoolId,
        name: name,
        startTime: startTime,
        endTime: endTime,
      ),
    );
  }

  Future<void> updateTimeSlot({
    required String id,
    required String name,
    required String startTime,
    required String endTime,
  }) {
    return _apiClient.execute(
      UpdateTimeSlotRequest(timeSlotId: id),
      payload: UpdateTimeSlotPayload(
        name: name,
        startTime: startTime,
        endTime: endTime,
      ),
    );
  }

  Future<void> deleteTimeSlot({required String id}) {
    return _apiClient.execute(DeleteTimeSlotRequest(timeSlotId: id));
  }

  Future<CourseSchedule> createScheduleRule({
    required String schoolId,
    required String courseId,
    required String classId,
    String? teacherId,
    required String slotId,
    required int dayOfWeek,
    required String location,
    String? classroomId,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _apiClient.execute(
      CreateScheduleRuleRequest(),
      payload: CreateScheduleRulePayload(
        schoolId: schoolId,
        courseId: courseId,
        classId: classId,
        teacherId: teacherId,
        slotId: slotId,
        dayOfWeek: dayOfWeek,
        location: location,
        classroomId: classroomId,
        startDate: _toRfc3339(startDate),
        endDate: _toRfc3339(endDate),
      ),
    );
  }

  Future<List<CourseSchedule>> listScheduleRules({
    required String schoolId,
    String? courseId,
  }) {
    return _apiClient.execute(
      ListScheduleRulesRequest(),
      payload: ListScheduleRulesPayload(schoolId: schoolId, courseId: courseId),
    );
  }

  Future<void> deleteScheduleRule({
    required String schoolId,
    required String ruleId,
  }) {
    return _apiClient.execute(
      DeleteScheduleRuleRequest(ruleId: ruleId),
      payload: SchoolScopedQueryPayload(schoolId: schoolId),
    );
  }

  Future<ScheduleStats> getScheduleStats({required String schoolId}) {
    return _apiClient.execute(
      GetScheduleStatsRequest(),
      payload: SchoolScopedQueryPayload(schoolId: schoolId),
    );
  }

  Future<void> generateSessions({
    required String schoolId,
    required DateTime start,
    required DateTime end,
  }) {
    return _apiClient.execute(
      GenerateSessionsRequest(),
      payload: GenerateSessionsPayload(
        schoolId: schoolId,
        start: _toRfc3339(start),
        end: _toRfc3339(end),
      ),
    );
  }

  Future<List<Classroom>> fetchClassrooms({
    required String schoolId,
    int page = 1,
    int size = 20,
  }) {
    return _apiClient.execute(
      FetchClassroomsRequest(),
      payload: FetchClassroomsPayload(
        schoolId: schoolId,
        page: page,
        size: size,
      ),
    );
  }

  Future<Classroom> createClassroom({
    required String schoolId,
    required String location,
  }) {
    return _apiClient.execute(
      CreateClassroomRequest(),
      payload: CreateClassroomPayload(schoolId: schoolId, location: location),
    );
  }

  Future<Classroom> updateClassroom({
    required String id,
    required String location,
  }) {
    return _apiClient.execute(
      UpdateClassroomRequest(classroomId: id),
      payload: UpdateClassroomPayload(location: location),
    );
  }

  Future<void> deleteClassroom({required String id}) {
    return _apiClient.execute(DeleteClassroomRequest(classroomId: id));
  }

  Future<({String analysis, List<AIOperation> operations})>
  analyzeBatchOperation({
    required String schoolId,
    required String instruction,
  }) {
    return _apiClient
        .execute(
          AnalyzeBatchOperationRequest(),
          payload: AnalyzeBatchOperationPayload(
            schoolId: schoolId,
            instruction: instruction,
          ),
        )
        .then(
          (result) =>
              (analysis: result.analysis, operations: result.operations),
        );
  }

  Future<List<String>> executeBatchOperations({
    required String schoolId,
    required List<AIOperation> operations,
  }) {
    return _apiClient.execute(
      ExecuteBatchOperationsRequest(),
      payload: ExecuteBatchOperationsPayload(
        schoolId: schoolId,
        operations: operations,
      ),
    );
  }

  String _toRfc3339(DateTime dateTime) {
    final iso = dateTime.toIso8601String();
    if (dateTime.isUtc) {
      return iso;
    }
    final offset = dateTime.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    return '$iso$sign$hours:$minutes';
  }
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AdminRepository(ApiClient(dio));
});
