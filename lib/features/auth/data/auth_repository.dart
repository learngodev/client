import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/account.dart';
import '../domain/auth_tokens.dart';
import '../domain/school.dart';

class LoginResult {
  const LoginResult({
    required this.account,
    required this.tokens,
    this.requiresPasswordReset = false,
  });

  final Account account;
  final AuthTokens tokens;
  final bool requiresPasswordReset;
}

class AuthRepository {
  const AuthRepository(this._dio);

  final Dio _dio;

  Future<LoginResult> signIn({
    required String schoolId,
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/login',
        data: {
          'school_id': schoolId,
          'identifier': identifier,
          'password': password,
        },
      );

      final data = response.data;
      if (data == null) {
        throw const AppException('登录失败：服务端无响应数据');
      }

      final success = data['success'] as bool? ?? false;
      if (!success) {
        final error = data['error'] as Map<String, dynamic>?;
        final message = error?['message'] as String? ?? '账号或密码错误';
        final details = error?['details'] as String?;
        throw AppException(message, details: details);
      }

      final payload = data['data'] as Map<String, dynamic>?;
      if (payload == null) {
        throw const AppException('登录失败：缺少返回数据');
      }

      final accountJson = payload['account'] as Map<String, dynamic>?;
      if (accountJson == null) {
        throw const AppException('登录失败：缺少账号信息');
      }

      final account = Account.fromJson(accountJson);
      final tokens = AuthTokens.fromJson(payload);
      final requiresReset =
          payload['requires_password_reset'] as bool? ?? false;

      return LoginResult(
        account: account,
        tokens: tokens,
        requiresPasswordReset: requiresReset,
      );
    } on DioException catch (error) {
      final errorBody = error.response?.data;
      String? message;
      String? details;
      if (errorBody is Map<String, dynamic>) {
        final map = errorBody['error'] as Map<String, dynamic>?;
        message = map?['message'] as String?;
        details = map?['details']?.toString();
      }
      message ??= error.message ?? '网络错误';
      details ??= error.response?.data?.toString();
      throw AppException(message, details: details);
    }
  }

  Future<List<School>> fetchSchools() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/v1/schools');
      final data = response.data;
      if (data == null) {
        throw const AppException('获取学校列表失败：服务端无响应数据');
      }

      final success = data['success'] as bool? ?? false;
      if (!success) {
        final error = data['error'] as Map<String, dynamic>?;
        final message = error?['message'] as String? ?? '获取学校列表失败';
        throw AppException(message);
      }

      final schoolsData = data['data']['schools'] as List<dynamic>?;
      if (schoolsData == null) {
        return [];
      }

      return schoolsData
          .map((e) => School.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  Future<String> requestPasswordReset({
    required String schoolId,
    required String identifier,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/password/reset/request',
        data: {'school_id': schoolId, 'identifier': identifier},
      );
      final data = response.data;
      if (data == null) {
        throw const AppException('请求失败：服务端无响应数据');
      }
      final success = data['success'] as bool? ?? false;
      if (!success) {
        final error = data['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '请求重置密码失败');
      }
      final payload = data['data'] as Map<String, dynamic>?;
      final token = payload?['reset_token'] as String?;
      if (token == null || token.isEmpty) {
        throw const AppException('未获取到重置令牌');
      }
      return token;
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  Future<void> confirmPasswordReset({
    required String schoolId,
    required String identifier,
    required String token,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/password/reset/confirm',
        data: {
          'school_id': schoolId,
          'identifier': identifier,
          'token': token,
          'new_password': newPassword,
        },
      );
      final data = response.data;
      if (data == null) {
        throw const AppException('请求失败：服务端无响应数据');
      }
      final success = data['success'] as bool? ?? false;
      if (!success) {
        final error = data['error'] as Map<String, dynamic>?;
        throw AppException(error?['message']?.toString() ?? '重置密码失败');
      }
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
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
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});
