import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/accounts.dart';
import '../domain/models.dart';
import '../domain/oss.dart';
import '../domain/system_settings.dart';

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
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AdminRepository(dio);
});

enum _AccountActionRequestType { post, delete }
