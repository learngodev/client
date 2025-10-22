import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/models.dart';

class AdminRepository {
  const AdminRepository(this._dio);

  final Dio _dio;

  Future<List<Department>> fetchDepartments() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/departments',
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
      final list = (data as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(Department.fromJson)
          .where((dept) => dept.id.isNotEmpty)
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

  Future<List<ClassInfo>> fetchClassesByDepartment(String departmentId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/admin/departments/$departmentId/classes',
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
      final list = (data as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(ClassInfo.fromJson)
          .where((clazz) => clazz.id.isNotEmpty)
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

  Future<List<DepartmentNode>> fetchDepartmentTree() async {
    final departments = await fetchDepartments();
    final futures = departments.map((dept) async {
      final classes = await fetchClassesByDepartment(dept.id);
      return DepartmentNode(department: dept, classes: classes);
    });
    return Future.wait(futures);
  }
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AdminRepository(dio);
});
