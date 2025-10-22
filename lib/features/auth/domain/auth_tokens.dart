class AuthTokens {
  const AuthTokens({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;

  bool get isNotEmpty => accessToken.isNotEmpty;

  Map<String, String> toJson() => {
    'access_token': accessToken,
    'refresh_token': refreshToken,
  };

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    final access = json['access_token'] as String? ?? '';
    final refresh = json['refresh_token'] as String? ?? '';
    if (access.isEmpty || refresh.isEmpty) {
      throw const FormatException('缺少访问令牌或刷新令牌');
    }
    return AuthTokens(accessToken: access, refreshToken: refresh);
  }
}
