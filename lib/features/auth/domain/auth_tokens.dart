import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';
part 'auth_tokens.g.dart';

@freezed
abstract class AuthTokens with _$AuthTokens {
  const AuthTokens._();

  @Assert("accessToken != ''", '访问令牌不能为空')
  @Assert("refreshToken != ''", '刷新令牌不能为空')
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokens;

  bool get isNotEmpty => accessToken.isNotEmpty;

  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);
}
