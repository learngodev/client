import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/accounts.dart';
import '../domain/models.dart';
import '../domain/oss.dart';
import '../domain/system_settings.dart';
import '../domain/ai_settings.dart';
import '../domain/course.dart';
import '../domain/schedule.dart';
import '../domain/classroom.dart';

class AdminRepository {
  const AdminRepository(this._dio);

  final Dio _dio;

  Future<List<Department>> fetchDepartments({required String schoolId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/departments',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取院系列表');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取院系列表失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final list = _extractMapList(
        data,
        nestedKey: 'departments',
      ).map(Department.fromJson).where((dept) => dept.id.isNotEmpty).toList();
      return list;
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AIAgentSetting?> fetchAISettings({required String schoolId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/ai/settings',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取 AI 配置');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取 AI 配置失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data == null) {
        return null;
      }
      final settingData = data['setting'];
      if (settingData is Map<String, dynamic>) {
        return AIAgentSetting.fromJson(settingData);
      }
      return null;
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AIAgentSetting> updateAISettings({
    required AIAgentSetting setting,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/api/v1/admin/ai/settings',
        data: setting.toJson(),
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能更新 AI 配置');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新 AI 配置失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data == null) {
        throw const AppException('AI 配置数据为空');
      }
      final settingData = data['setting'];
      if (settingData is Map<String, dynamic>) {
        return AIAgentSetting.fromJson(settingData);
      }
      throw const AppException('返回的 AI 配置格式错误');
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<Map<String, dynamic>> fetchAIUsageSummaries({
    required String schoolId,
    int page = 1,
    int pageSize = 20,
    String? sortBy,
    String? sortDir,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/ai/usage',
        queryParameters: {
          'school_id': schoolId,
          'page': page,
          'page_size': pageSize,
          if (sortBy != null) 'sort_by': sortBy,
          if (sortDir != null) 'sort_dir': sortDir,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取 AI 使用统计');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取 AI 使用统计失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return data;
      }
      return <String, dynamic>{};
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<Map<String, dynamic>> fetchAIUsageTimeline({
    required String schoolId,
    String? role,
    DateTime? start,
    DateTime? end,
    String interval = 'day',
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/ai/usage/timeline',
        queryParameters: {
          'school_id': schoolId,
          if (role != null) 'role': role,
          if (start != null) 'start': start.toIso8601String(),
          if (end != null) 'end': end.toIso8601String(),
          'interval': interval,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取 AI 使用趋势');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取 AI 使用趋势失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return data;
      }
      return <String, dynamic>{};
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<ClassInfo>> fetchClassesByDepartment({
    required String schoolId,
    required String departmentId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/departments/$departmentId/classes',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw AppException('未能获取班级列表（院系ID: $departmentId）');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取班级列表失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final list = _extractMapList(
        data,
        nestedKey: 'classes',
      ).map(ClassInfo.fromJson).where((clazz) => clazz.id.isNotEmpty).toList();
      return list;
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<DepartmentNode>> fetchDepartmentTree({
    required String schoolId,
  }) async {
    final departments = await fetchDepartments(schoolId: schoolId);
    final futures = departments.map((dept) async {
      final classes = await fetchClassesByDepartment(
        schoolId: schoolId,
        departmentId: dept.id,
      );
      return DepartmentNode(department: dept, classes: classes);
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
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/accounts',
        queryParameters: <String, dynamic>{
          'school_id': schoolId,
          'page': page,
          'page_size': pageSize,
          if (role != null) 'role': role.apiValue,
          if (status != null) 'status': status.apiValue,
          if (departmentId != null && departmentId.isNotEmpty)
            'department_id': departmentId,
          if (departmentScope != null && departmentScope.isNotEmpty)
            'department_scope': departmentScope,
          if (classId != null && classId.isNotEmpty) 'class_id': classId,
          if (classScope != null && classScope.isNotEmpty)
            'class_scope': classScope,
          if (courseId != null && courseId.isNotEmpty) 'course_id': courseId,
          if (query.trim().isNotEmpty) 'query': query.trim(),
        },
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取账号列表');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取账号列表失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is! Map<String, dynamic>) {
        throw const AppException('账号数据格式异常');
      }
      return AdminAccountPage.fromJson(data);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> createTeacher({
    required String schoolId,
    required String number,
    required String name,
    required String email,
    String? phone,
    required String defaultPassword,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/teachers',
        data: {
          'school_id': schoolId,
          'number': number,
          'name': name,
          'email': email,
          'phone': phone,
          'default_password': defaultPassword,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能创建教师账号');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建教师账号失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> createStudent({
    required String schoolId,
    required String number,
    required String name,
    required String email,
    String? phone,
    String? classId,
    required String defaultPassword,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/students',
        data: {
          'school_id': schoolId,
          'number': number,
          'name': name,
          'email': email,
          'phone': phone,
          'class_id': classId ?? '',
          'default_password': defaultPassword,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能创建学生账号');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建学生账号失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> updateAccountStructure({
    required String schoolId,
    required String accountId,
    String? departmentId,
    String? classId,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/accounts/$accountId/structure',
        data: {'department_id': departmentId, 'class_id': classId},
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('更新账号所属失败');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新账号所属失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> resetAccountPassword({
    required String schoolId,
    required String accountId,
  }) async {
    await _performAccountAction(
      schoolId: schoolId,
      path: '/api/v1/admin/accounts/$accountId/password/reset',
      failureMessage: '发送重置密码请求失败',
      requestType: _AccountActionRequestType.post,
    );
  }

  Future<void> lockAccount({
    required String schoolId,
    required String accountId,
  }) async {
    await _performAccountAction(
      schoolId: schoolId,
      path: '/api/v1/admin/accounts/$accountId/lock',
      failureMessage: '锁定账号失败',
      requestType: _AccountActionRequestType.post,
    );
  }

  Future<void> unlockAccount({
    required String schoolId,
    required String accountId,
  }) async {
    await _performAccountAction(
      schoolId: schoolId,
      path: '/api/v1/admin/accounts/$accountId/unlock',
      failureMessage: '解除锁定失败',
      requestType: _AccountActionRequestType.post,
    );
  }

  Future<void> deleteAccount({
    required String schoolId,
    required String accountId,
  }) async {
    await _performAccountAction(
      schoolId: schoolId,
      path: '/api/v1/admin/accounts/$accountId',
      failureMessage: '删除账号失败',
      requestType: _AccountActionRequestType.delete,
    );
  }

  Future<Map<String, dynamic>> batchOperateAccounts({
    required String schoolId,
    required List<String> accountIds,
    required String action,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/accounts/batch',
        data: {
          'school_id': schoolId,
          'account_ids': accountIds,
          'action': action,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('批量操作失败');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '批量操作失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return data;
      }
      return <String, dynamic>{};
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminOssCredential>> fetchOssCredentials({
    required String schoolId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/oss/credentials',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取 OSS 凭证列表');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取 OSS 凭证列表失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final list = _extractMapList(data, nestedKey: 'credentials')
          .map(AdminOssCredential.fromJson)
          .where((item) => item.id.isNotEmpty)
          .toList();
      return list;
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminOssPolicy>> fetchOssPolicies({
    required String schoolId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/oss/policies',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取 OSS 策略列表');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取 OSS 策略失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      return _extractMapList(data, nestedKey: 'policies')
          .map(AdminOssPolicy.fromJson)
          .where((item) => item.id.isNotEmpty)
          .toList();
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminOssAuditLog>> fetchOssAuditLogs({
    required String schoolId,
    int limit = 20,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/oss/audit_logs',
        queryParameters: {'school_id': schoolId, 'limit': limit},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取 OSS 审计记录');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取 OSS 审计记录失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      return _extractMapList(data, nestedKey: 'logs')
          .map(AdminOssAuditLog.fromJson)
          .where((item) => item.id.isNotEmpty)
          .toList();
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminSystemSwitch>> fetchSystemSwitches({
    required String schoolId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/system/switches',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取系统开关列表');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取系统开关失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      return _extractMapList(data, nestedKey: 'switches')
          .map(AdminSystemSwitch.fromJson)
          .where((item) => item.id.isNotEmpty)
          .toList();
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminSystemSwitch> updateSystemSwitch({
    required String schoolId,
    required String switchId,
    required bool enabled,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/system/switches/$switchId',
        data: {'school_id': schoolId, 'enabled': enabled},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('更新系统开关失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新系统开关失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final switchMap = _extractNestedMap(data, key: 'switch');
      if (switchMap == null) {
        throw const AppException('更新系统开关返回数据异常');
      }
      return AdminSystemSwitch.fromJson(switchMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminSystemParameter>> fetchSystemParameters({
    required String schoolId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/system/parameters',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取系统参数列表');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取系统参数失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      return _extractMapList(data, nestedKey: 'parameters')
          .map(AdminSystemParameter.fromJson)
          .where((item) => item.id.isNotEmpty)
          .toList();
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminSystemParameter> updateSystemParameter({
    required String schoolId,
    required String parameterId,
    required String value,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/system/parameters/$parameterId',
        data: {'school_id': schoolId, 'value': value},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('更新系统参数失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新系统参数失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final parameterMap = _extractNestedMap(data, key: 'parameter');
      if (parameterMap == null) {
        throw const AppException('更新系统参数返回数据异常');
      }
      return AdminSystemParameter.fromJson(parameterMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminSystemBroadcast>> fetchSystemBroadcasts({
    required String schoolId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/system/broadcasts',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取通知广播列表');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取通知广播失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      return _extractMapList(data, nestedKey: 'broadcasts')
          .map(AdminSystemBroadcast.fromJson)
          .where((item) => item.id.isNotEmpty)
          .toList();
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminSystemBroadcast> updateSystemBroadcast({
    required String schoolId,
    required String broadcastId,
    AdminSystemBroadcastStatus? status,
    bool? pinned,
  }) async {
    final payload = <String, dynamic>{'school_id': schoolId};
    if (status != null) {
      payload['status'] = status.name;
    }
    if (pinned != null) {
      payload['pinned'] = pinned;
    }
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/system/broadcasts/$broadcastId',
        data: payload,
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('更新通知广播失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新通知广播失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final broadcastMap = _extractNestedMap(data, key: 'broadcast');
      if (broadcastMap == null) {
        throw const AppException('更新通知广播返回数据异常');
      }
      return AdminSystemBroadcast.fromJson(broadcastMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<AdminSystemAuditLog>> fetchSystemAuditLogs({
    required String schoolId,
    int limit = 50,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/system/audit_logs',
        queryParameters: {'school_id': schoolId, 'limit': limit},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取系统审计记录');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取系统审计记录失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      return _extractMapList(
        data,
        nestedKey: 'logs',
      ).map(AdminSystemAuditLog.fromJson).toList();
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminOssCredential> createOssCredential({
    required String schoolId,
    required String name,
    required String endpoint,
    required String region,
    required String bucket,
    String directoryPrefix = '',
    String accessKeyDisplay = '',
    bool allowPublicRead = false,
    bool allowMultipartUpload = false,
    bool active = true,
    bool isPrimary = false,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/oss/credentials',
        data: <String, dynamic>{
          'school_id': schoolId,
          'name': name,
          'endpoint': endpoint,
          'region': region,
          'bucket': bucket,
          'directory_prefix': directoryPrefix,
          'access_key_display': accessKeyDisplay,
          'allow_public_read': allowPublicRead,
          'allow_multipart_upload': allowMultipartUpload,
          'active': active,
          'is_primary': isPrimary,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('创建 OSS 凭证失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建 OSS 凭证失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is! Map<String, dynamic>) {
        throw const AppException('创建凭证返回数据格式异常');
      }
      final credentialMap = data['credential'];
      if (credentialMap is! Map<String, dynamic>) {
        throw const AppException('创建凭证返回数据缺失');
      }
      return AdminOssCredential.fromJson(credentialMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> deleteOssCredential({
    required String schoolId,
    required String credentialId,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/oss/credentials/$credentialId',
        data: <String, dynamic>{'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('删除 OSS 凭证失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '删除 OSS 凭证失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminOssCredential> updateOssCredential({
    required String schoolId,
    required String credentialId,
    String? name,
    String? endpoint,
    String? region,
    String? bucket,
    String? directoryPrefix,
    String? accessKeyDisplay,
    bool? allowPublicRead,
    bool? allowMultipartUpload,
    bool? active,
    bool? isPrimary,
  }) async {
    final payload = <String, dynamic>{'school_id': schoolId};
    void putIfNotNull(String key, dynamic value) {
      if (value != null) {
        payload[key] = value;
      }
    }

    putIfNotNull('name', name);
    putIfNotNull('endpoint', endpoint);
    putIfNotNull('region', region);
    putIfNotNull('bucket', bucket);
    putIfNotNull('directory_prefix', directoryPrefix);
    putIfNotNull('access_key_display', accessKeyDisplay);
    if (allowPublicRead != null) {
      payload['allow_public_read'] = allowPublicRead;
    }
    if (allowMultipartUpload != null) {
      payload['allow_multipart_upload'] = allowMultipartUpload;
    }
    if (active != null) {
      payload['active'] = active;
    }
    if (isPrimary != null) {
      payload['is_primary'] = isPrimary;
    }

    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/oss/credentials/$credentialId',
        data: payload,
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('更新 OSS 凭证失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新 OSS 凭证失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is! Map<String, dynamic>) {
        throw const AppException('更新凭证返回数据格式异常');
      }
      final credentialMap = data['credential'];
      if (credentialMap is! Map<String, dynamic>) {
        throw const AppException('更新凭证返回数据缺失');
      }
      return AdminOssCredential.fromJson(credentialMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminOssPolicy> createOssPolicy({
    required String schoolId,
    required String name,
    required String appliesTo,
    String description = '',
    AdminOssPolicyStatus status = AdminOssPolicyStatus.enabled,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/oss/policies',
        data: <String, dynamic>{
          'school_id': schoolId,
          'name': name,
          'description': description,
          'applies_to': appliesTo,
          'status': status.apiValue,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('创建 OSS 策略失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建 OSS 策略失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is! Map<String, dynamic>) {
        throw const AppException('创建策略返回数据格式异常');
      }
      final policyMap = data['policy'];
      if (policyMap is! Map<String, dynamic>) {
        throw const AppException('创建策略返回数据缺失');
      }
      return AdminOssPolicy.fromJson(policyMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> deleteOssPolicy({
    required String schoolId,
    required String policyId,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/oss/policies/$policyId',
        data: <String, dynamic>{'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('删除 OSS 策略失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '删除 OSS 策略失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<AdminOssPolicy> updateOssPolicyStatus({
    required String schoolId,
    required String policyId,
    required AdminOssPolicyStatus status,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/oss/policies/$policyId',
        data: <String, dynamic>{
          'school_id': schoolId,
          'status': status.apiValue,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('更新 OSS 策略失败：服务无响应');
      }
      if (!(body['success'] as bool? ?? false)) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新 OSS 策略失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is! Map<String, dynamic>) {
        throw const AppException('更新策略返回数据格式异常');
      }
      final policyMap = data['policy'];
      if (policyMap is! Map<String, dynamic>) {
        throw const AppException('更新策略返回数据缺失');
      }
      return AdminOssPolicy.fromJson(policyMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<String> createDepartment({
    required String schoolId,
    required String name,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/departments',
        data: {'school_id': schoolId, 'name': name},
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('创建院系失败：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建院系失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return data['department_id']?.toString() ?? '';
      }
      return data?.toString() ?? '';
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<String> createClass({
    required String schoolId,
    required String departmentId,
    required String name,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/classes',
        data: {
          'school_id': schoolId,
          'department_id': departmentId,
          'name': name,
        },
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('创建班级失败：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建班级失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return data['class_id']?.toString() ?? '';
      }
      return data?.toString() ?? '';
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<Department> updateDepartment({
    required String schoolId,
    required String departmentId,
    required String name,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/departments/$departmentId',
        data: {'school_id': schoolId, 'name': name},
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('更新院系失败：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新院系失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final departmentMap = data is Map<String, dynamic>
          ? data['department'] as Map<String, dynamic>?
          : null;
      if (departmentMap == null) {
        throw const AppException('未能解析院系信息');
      }
      return Department.fromJson(departmentMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> deleteDepartment({
    required String schoolId,
    required String departmentId,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/departments/$departmentId',
        queryParameters: {'school_id': schoolId},
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('删除院系失败：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '删除院系失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<ClassInfo> updateClass({
    required String schoolId,
    required String classId,
    required String name,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/classes/$classId',
        data: {'school_id': schoolId, 'name': name},
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('更新班级失败：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新班级失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final classMap = data is Map<String, dynamic>
          ? data['class'] as Map<String, dynamic>?
          : null;
      if (classMap == null) {
        throw const AppException('未能解析班级信息');
      }
      return ClassInfo.fromJson(classMap);
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> deleteClass({
    required String schoolId,
    required String classId,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/classes/$classId',
        queryParameters: {'school_id': schoolId},
      );

      final body = response.data;
      if (body == null) {
        throw const AppException('删除班级失败：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '删除班级失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> _performAccountAction({
    required String schoolId,
    required String path,
    required String failureMessage,
    required _AccountActionRequestType requestType,
  }) async {
    try {
      Response<Map<String, dynamic>> response;
      switch (requestType) {
        case _AccountActionRequestType.post:
          response = await _dio.post<Map<String, dynamic>>(
            path,
            data: {'school_id': schoolId},
          );
          break;
        case _AccountActionRequestType.delete:
          response = await _dio.delete<Map<String, dynamic>>(
            path,
            queryParameters: {'school_id': schoolId},
          );
          break;
      }

      final body = response.data;
      if (body == null) {
        throw AppException('$failureMessage：服务无响应');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? failureMessage,
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<Course>> fetchCourses({
    required String schoolId,
    String? departmentId,
    String? classId,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/courses',
        queryParameters: {
          'school_id': schoolId,
          'page': page,
          'size': size,
          if (departmentId != null) 'department_id': departmentId,
          if (classId != null) 'class_id': classId,
        },
      );
      final body = response.data;
      if (body == null) throw const AppException('未能获取课程列表');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '获取课程列表失败');
      }
      final data = body['data'];
      return _extractMapList(
        data,
        nestedKey: 'items',
      ).map(Course.fromJson).toList();
    } on DioException catch (e) {
      throw AppException(e.message ?? '网络错误');
    }
  }

  Future<Course> createCourse({
    required String schoolId,
    required String name,
    String? description,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/courses',
        data: {'name': name, 'description': description},
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) throw const AppException('未能创建课程');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '创建课程失败');
      }
      return Course.fromJson(body['data']);
    } on DioException catch (e) {
      throw AppException(e.message ?? '网络错误');
    }
  }

  Future<void> updateCourse({
    required String id,
    String? name,
    String? description,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/courses/$id',
        data: {'name': name, 'description': description},
      );
      final body = response.data;
      if (body == null) throw const AppException('未能更新课程');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '更新课程失败');
      }
    } on DioException catch (e) {
      throw AppException(e.message ?? '网络错误');
    }
  }

  Future<void> deleteCourse({required String id}) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/courses/$id',
      );
      final body = response.data;
      if (body == null) throw const AppException('未能删除课程');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '删除课程失败');
      }
    } on DioException catch (e) {
      throw AppException(e.message ?? '网络错误');
    }
  }

  Future<void> updateAssignment({
    required String id,
    required String teacherId,
    required String classId,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/courses/assignments/$id',
        data: {'teacher_id': teacherId, 'class_id': classId},
      );
      final body = response.data;
      if (body == null) throw const AppException('未能更新分配');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '更新分配失败');
      }
    } on DioException catch (e) {
      throw AppException(e.message ?? '网络错误');
    }
  }

  Future<void> removeAssignment({required String id}) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/courses/assignments/$id',
      );
      final body = response.data;
      if (body == null) throw const AppException('未能移除分配');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '移除分配失败');
      }
    } on DioException catch (e) {
      throw AppException(e.message ?? '网络错误');
    }
  }

  Future<List<CourseAssignment>> fetchCourseAssignments({
    required String schoolId,
    String? courseId,
    String? departmentId,
    String? classId,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/courses/assignments',
        queryParameters: {
          'school_id': schoolId,
          if (courseId != null) 'course_id': courseId,
          if (departmentId != null) 'department_id': departmentId,
          if (classId != null) 'class_id': classId,
          'page': page,
          'size': pageSize,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('获取课程分配失败');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取课程分配失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data == null) {
        return [];
      }
      final items = data['items'];
      if (items is List) {
        return items
            .whereType<Map<String, dynamic>>()
            .map(CourseAssignment.fromJson)
            .toList();
      }
      return [];
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> assignStudents({
    required String courseId,
    List<String>? studentIds,
    String? classId,
    String? departmentId,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/courses/$courseId/assign/students',
        data: {
          'student_ids': studentIds,
          'class_id': classId,
          'department_id': departmentId,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('分配学生失败');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '分配学生失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  // Schedule Management

  Future<List<TimeSlot>> listTimeSlots({required String schoolId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/schedules/slots',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) throw const AppException('Failed to fetch time slots');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to fetch time slots',
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic> && data['time_slots'] is List) {
        return (data['time_slots'] as List)
            .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      if (data is List) {
        return data
            .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<TimeSlot> createTimeSlot({
    required String schoolId,
    required String name,
    required String startTime,
    required String endTime,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/schedules/slots',
        data: {
          'school_id': schoolId,
          'name': name,
          'start_time': startTime,
          'end_time': endTime,
        },
      );
      final body = response.data;
      if (body == null) throw const AppException('Failed to create time slot');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to create time slot',
        );
      }
      return TimeSlot.fromJson(body['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> updateTimeSlot({
    required String id,
    required String name,
    required String startTime,
    required String endTime,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/time-slots/$id',
        data: {'name': name, 'start_time': startTime, 'end_time': endTime},
      );
      final body = response.data;
      if (body == null) throw const AppException('Failed to update time slot');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to update time slot',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteTimeSlot({required String id}) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/time-slots/$id',
      );
      final body = response.data;
      if (body == null) throw const AppException('Failed to delete time slot');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to delete time slot',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
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
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/schedules/rules',
        data: {
          'school_id': schoolId,
          'course_id': courseId,
          'class_id': classId,
          'teacher_id': teacherId,
          'slot_id': slotId,
          'day_of_week': dayOfWeek,
          'location': location,
          'classroom_id': classroomId,
          'start_date': _toRfc3339(startDate),
          'end_date': _toRfc3339(endDate),
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('Failed to create schedule rule');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to create schedule rule',
        );
      }
      return CourseSchedule.fromJson(body['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<CourseSchedule>> listScheduleRules({
    required String schoolId,
    String? courseId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/schedules/rules',
        queryParameters: {
          'school_id': schoolId,
          if (courseId != null) 'course_id': courseId,
        },
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('Failed to fetch schedule rules');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to fetch schedule rules',
        );
      }
      final data = body['data'];
      if (data is List) {
        return data
            .map((e) => CourseSchedule.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteScheduleRule({
    required String schoolId,
    required String ruleId,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/schedules/rules/$ruleId',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('Failed to delete schedule rule');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to delete schedule rule',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<ScheduleStats> getScheduleStats({required String schoolId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/schedules/stats',
        queryParameters: {'school_id': schoolId},
      );
      final body = response.data;
      if (body == null) throw const AppException('Failed to fetch stats');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to fetch stats',
        );
      }
      return ScheduleStats.fromJson(body['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> generateSessions({
    required String schoolId,
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/schedules/generate',
        data: {
          'school_id': schoolId,
          'start': _toRfc3339(start),
          'end': _toRfc3339(end),
        },
      );
      final body = response.data;
      if (body == null) throw const AppException('Failed to generate sessions');
      final success = body['success'] as bool? ?? false;
      if (!success) {
        throw AppException(
          (body['error'] as Map<String, dynamic>?)?['message']?.toString() ??
              'Failed to generate sessions',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  String _toRfc3339(DateTime dt) {
    final iso = dt.toIso8601String();
    if (dt.isUtc) {
      return iso;
    }
    final offset = dt.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    return '$iso$sign$hours:$minutes';
  }

  AppException _handleDioError(DioException error) {
    final body = error.response?.data;
    String? message;
    String? details;
    if (body is Map<String, dynamic>) {
      final map = body['error'] as Map<String, dynamic>?;
      message = map?['message']?.toString();
      details = map?['details']?.toString();
    }
    message ??= error.message ?? '网络错误';
    details ??= body?.toString();
    return AppException(message, details: details);
  }

  List<Map<String, dynamic>> _extractMapList(
    dynamic data, {
    required String nestedKey,
  }) {
    if (data is List<dynamic>) {
      return data.whereType<Map<String, dynamic>>().toList();
    }
    if (data is Map<String, dynamic>) {
      final nested = data[nestedKey];
      if (nested is List<dynamic>) {
        return nested.whereType<Map<String, dynamic>>().toList();
      }
    }
    return <Map<String, dynamic>>[];
  }

  Map<String, dynamic>? _extractNestedMap(dynamic data, {required String key}) {
    if (data is Map<String, dynamic>) {
      final nested = data[key];
      if (nested is Map<String, dynamic>) {
        return nested;
      }
      return data;
    }
    return null;
  }

  // Classrooms
  Future<List<Classroom>> fetchClassrooms({
    required String schoolId,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/classrooms',
        queryParameters: {'school_id': schoolId, 'page': page, 'size': size},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能获取教室列表');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '获取教室列表失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      final list = _extractMapList(
        data,
        nestedKey: 'classrooms',
      ).map(Classroom.fromJson).toList();
      return list;
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<Classroom> createClassroom({
    required String schoolId,
    required String location,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/admin/classrooms',
        data: {'school_id': schoolId, 'location': location},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能创建教室');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '创建教室失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return Classroom.fromJson(data);
      }
      throw const AppException('创建教室返回数据格式错误');
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<Classroom> updateClassroom({
    required String id,
    required String location,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/admin/classrooms/$id',
        data: {'location': location},
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能更新教室');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '更新教室失败',
          details: error?['details']?.toString(),
        );
      }
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        return Classroom.fromJson(data);
      }
      throw const AppException('更新教室返回数据格式错误');
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<void> deleteClassroom({required String id}) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/admin/classrooms/$id',
      );
      final body = response.data;
      if (body == null) {
        throw const AppException('未能删除教室');
      }
      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        throw AppException(
          error?['message']?.toString() ?? '删除教室失败',
          details: error?['details']?.toString(),
        );
      }
    } on DioException catch (error) {
      final body = error.response?.data;
      String? message;
      String? details;
      if (body is Map<String, dynamic>) {
        final map = body['error'] as Map<String, dynamic>?;
        message = map?['message']?.toString();
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= body?.toString();
      throw AppException(message, details: details);
    }
  }
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AdminRepository(dio);
});

enum _AccountActionRequestType { post, delete }
