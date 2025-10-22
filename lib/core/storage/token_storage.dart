import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/domain/auth_tokens.dart';

class TokenStorage {
  TokenStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const _accessKey = 'learn_go_access_token';
  static const _refreshKey = 'learn_go_refresh_token';

  Future<void> saveTokens(AuthTokens tokens) async {
    try {
      await _secureStorage.write(key: _accessKey, value: tokens.accessToken);
      await _secureStorage.write(key: _refreshKey, value: tokens.refreshToken);
    } catch (_) {
      // 忽略测试环境无插件的情况。
    }
  }

  Future<AuthTokens?> readTokens() async {
    try {
      final access = await _secureStorage.read(key: _accessKey);
      final refresh = await _secureStorage.read(key: _refreshKey);
      if (access == null ||
          access.isEmpty ||
          refresh == null ||
          refresh.isEmpty) {
        return null;
      }
      return AuthTokens(accessToken: access, refreshToken: refresh);
    } catch (_) {
      // 测试或桌面环境可能未注册插件，直接忽略。
      return null;
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.delete(key: _accessKey);
      await _secureStorage.delete(key: _refreshKey);
    } catch (_) {
      // 忽略删除失败，通常发生在无插件环境。
    }
  }
}

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  return TokenStorage(secureStorage);
});
