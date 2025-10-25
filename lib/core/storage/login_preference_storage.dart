import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPreference {
  const LoginPreference({
    required this.schoolId,
    required this.identifier,
    required this.rememberPassword,
    this.password,
  });

  final String schoolId;
  final String identifier;
  final bool rememberPassword;
  final String? password;

  Map<String, dynamic> toJson() => {
    'schoolId': schoolId,
    'identifier': identifier,
    'rememberPassword': rememberPassword,
    'password': rememberPassword ? password : null,
  };

  factory LoginPreference.fromJson(Map<String, dynamic> json) {
    return LoginPreference(
      schoolId: json['schoolId'] as String? ?? '',
      identifier: json['identifier'] as String? ?? '',
      rememberPassword: json['rememberPassword'] as bool? ?? false,
      password: json['password'] as String?,
    );
  }

  bool get isEmpty => schoolId.isEmpty && identifier.isEmpty;
}

class LoginPreferenceStorage {
  LoginPreferenceStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const _loginKey = 'learn_go_last_login_preference';

  Future<void> save(LoginPreference preference) async {
    try {
      await _secureStorage.write(
        key: _loginKey,
        value: jsonEncode(preference.toJson()),
      );
    } catch (_) {
      // 桌面或测试环境可能无安全存储插件，忽略写入失败。
    }
  }

  Future<LoginPreference?> read() async {
    try {
      final raw = await _secureStorage.read(key: _loginKey);
      if (raw == null || raw.isEmpty) return null;
      final Map<String, dynamic> json = jsonDecode(raw) as Map<String, dynamic>;
      final preference = LoginPreference.fromJson(json);
      return preference.isEmpty ? null : preference;
    } catch (_) {
      // 解码失败或无插件环境，直接返回 null。
      return null;
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.delete(key: _loginKey);
    } catch (_) {
      // 忽略删除失败。
    }
  }
}

final loginPreferenceStorageProvider = Provider<LoginPreferenceStorage>((ref) {
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  return LoginPreferenceStorage(secureStorage);
});

final lastLoginPreferenceProvider = FutureProvider<LoginPreference?>((ref) {
  final storage = ref.watch(loginPreferenceStorageProvider);
  return storage.read();
});
