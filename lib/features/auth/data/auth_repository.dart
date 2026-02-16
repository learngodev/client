import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/auth/domain/auth_tokens.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/base_request.dart';
import '../../../core/network/dio_provider.dart';
import '../domain/account.dart';
import '../domain/school.dart';

part 'auth_repository.freezed.dart';
part 'auth_repository.g.dart';

@freezed
abstract class LoginResult with _$LoginResult {
  const LoginResult._();
  const factory LoginResult({
    required Account account,
    required String accessToken,
    required String refreshToken,
    required bool requiresPasswordReset,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  AuthTokens get tokens =>
      AuthTokens(accessToken: accessToken, refreshToken: refreshToken);
}

class AuthRepository {
  const AuthRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<LoginResult> signIn({
    required String schoolId,
    required String identifier,
    required String password,
  }) {
    return _apiClient.execute(
      _SignInRequest(),
      payload: SignInPayload(
        schoolId: schoolId,
        identifier: identifier,
        password: password,
      ),
    );
  }

  Future<List<School>> fetchSchools() {
    return _apiClient
        .execute(_FetchSchoolsRequest())
        .then((result) => result.schools);
  }

  Future<String> requestPasswordReset({
    required String schoolId,
    required String identifier,
  }) {
    return _apiClient
        .execute(
          _RequestPasswordResetRequest(),
          payload: RequestPasswordResetPayload(
            schoolId: schoolId,
            identifier: identifier,
          ),
        )
        .then((value) => value.resetToken);
  }

  Future<void> confirmPasswordReset({
    required String schoolId,
    required String identifier,
    required String token,
    required String newPassword,
  }) {
    return _apiClient.execute(
      _ConfirmPasswordResetRequest(),
      payload: ConfirmPasswordResetPayload(
        schoolId: schoolId,
        identifier: identifier,
        token: token,
        newPassword: newPassword,
      ),
    );
  }
}

@freezed
abstract class SignInPayload with _$SignInPayload {
  const factory SignInPayload({
    required String schoolId,
    required String identifier,
    required String password,
  }) = _SignInPayloadImpl;

  factory SignInPayload.fromJson(Map<String, dynamic> json) =>
      _$SignInPayloadFromJson(json);
}

class _SignInRequest extends BaseRequest<SignInPayload, LoginResult> {
  _SignInRequest()
    : super(
        '/api/v1/auth/login',
        HttpMethod.post,
        fallbackMessage: '登录失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => LoginResult.fromJson(value),
      );
}

@freezed
abstract class SchoolsResult with _$SchoolsResult {
  const factory SchoolsResult({required List<School> schools}) = _SchoolsResult;
  factory SchoolsResult.fromJson(Map<String, dynamic> json) =>
      _$SchoolsResultFromJson(json);
}

class _FetchSchoolsRequest extends BaseRequest<void, SchoolsResult> {
  _FetchSchoolsRequest()
    : super(
        '/api/v1/schools',
        HttpMethod.get,
        fallbackMessage: '获取学校列表失败',
        responseParser: (value) => SchoolsResult.fromJson(value),
      );
}

@freezed
abstract class RequestPasswordResetPayload with _$RequestPasswordResetPayload {
  const factory RequestPasswordResetPayload({
    required String schoolId,
    required String identifier,
  }) = _RequestPasswordResetPayloadImpl;

  factory RequestPasswordResetPayload.fromJson(Map<String, dynamic> json) =>
      _$RequestPasswordResetPayloadFromJson(json);
}

@freezed
abstract class _RequestPasswordResetResult with _$RequestPasswordResetResult {
  const factory _RequestPasswordResetResult({required String resetToken}) =
      _RequestPasswordResetResultImpl;

  factory _RequestPasswordResetResult.fromJson(Map<String, dynamic> json) =>
      _$RequestPasswordResetResultFromJson(json);
}

class _RequestPasswordResetRequest
    extends
        BaseRequest<RequestPasswordResetPayload, _RequestPasswordResetResult> {
  _RequestPasswordResetRequest()
    : super(
        '/api/v1/auth/password/reset/request',
        HttpMethod.post,
        fallbackMessage: '请求重置密码失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => _RequestPasswordResetResult.fromJson(value),
      );
}

@freezed
abstract class ConfirmPasswordResetPayload with _$ConfirmPasswordResetPayload {
  const factory ConfirmPasswordResetPayload({
    required String schoolId,
    required String identifier,
    required String token,
    required String newPassword,
  }) = _ConfirmPasswordResetPayloadImpl;

  factory ConfirmPasswordResetPayload.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPasswordResetPayloadFromJson(json);
}

class _ConfirmPasswordResetRequest
    extends BaseRequest<ConfirmPasswordResetPayload, void> {
  _ConfirmPasswordResetRequest()
    : super(
        '/api/v1/auth/password/reset/confirm',
        HttpMethod.post,
        fallbackMessage: '重置密码失败',
        requestEncoder: (value) => value.toJson(),
      );
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(ApiClient(dio));
});
