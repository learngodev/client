import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/accounts.dart';
import '../domain/models.dart';

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
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AdminRepository(dio);
});

enum _AccountActionRequestType { post, delete }
