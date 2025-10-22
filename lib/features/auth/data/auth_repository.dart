import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/account.dart';
import '../domain/auth_tokens.dart';

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
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});
