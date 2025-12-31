import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/storage/login_preference_storage.dart';
import '../../../core/storage/token_storage.dart';
import '../data/auth_repository.dart';
import '../domain/account.dart';
import '../domain/auth_tokens.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthState {
  const AuthState._({
    required this.status,
    this.account,
    this.tokens,
    this.requiresPasswordReset = false,
  });

  const AuthState.unknown() : this._(status: AuthStatus.unknown);

  const AuthState.unauthenticated()
    : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticated({
    required Account account,
    required AuthTokens tokens,
    bool requiresPasswordReset = false,
  }) : this._(
         status: AuthStatus.authenticated,
         account: account,
         tokens: tokens,
         requiresPasswordReset: requiresPasswordReset,
       );

  final AuthStatus status;
  final Account? account;
  final AuthTokens? tokens;
  final bool requiresPasswordReset;

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get hasTokens => tokens != null && tokens!.isNotEmpty;

  AuthState copyWith({
    AuthStatus? status,
    Account? account,
    AuthTokens? tokens,
    bool? requiresPasswordReset,
  }) {
    return AuthState._(
      status: status ?? this.status,
      account: account ?? this.account,
      tokens: tokens ?? this.tokens,
      requiresPasswordReset:
          requiresPasswordReset ?? this.requiresPasswordReset,
    );
  }
}

/// Async/Future 风格的 build：允许在 build 里直接 await。
///
/// 兼容性说明：对外仍通过 [authStateProvider] 暴露同步的 [AuthState]，
/// 以避免大量调用点改成处理 AsyncValue。
class AuthController extends AsyncNotifier<AuthState> {
  @override
  FutureOr<AuthState> build() async {
    final storage = ref.read(tokenStorageProvider);
    final storedTokens = await storage.readTokens();
    if (storedTokens == null) {
      return const AuthState.unauthenticated();
    }

    // 目前尚未实现刷新和拉取档案，这里仅保留 token 以便后续安全调用。
    return const AuthState.unauthenticated().copyWith(tokens: storedTokens);
  }

  Future<void> signIn({
    required String schoolId,
    required String identifier,
    required String password,
    required bool rememberPassword,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    final storage = ref.read(tokenStorageProvider);
    final preferenceStorage = ref.read(loginPreferenceStorageProvider);

    final result = await repository.signIn(
      schoolId: schoolId,
      identifier: identifier,
      password: password,
    );

    await storage.saveTokens(result.tokens);
    await preferenceStorage.save(
      LoginPreference(
        schoolId: schoolId.trim(),
        identifier: identifier.trim(),
        rememberPassword: rememberPassword,
        password: rememberPassword ? password : null,
      ),
    );
    ref.invalidate(lastLoginPreferenceProvider);

    state = AsyncData(
      AuthState.authenticated(
        account: result.account,
        tokens: result.tokens,
        requiresPasswordReset: result.requiresPasswordReset,
      ),
    );
  }

  Future<void> debugLogin(AccountRole role) async {
    final account = Account(
      id: 'debug-${role.name}',
      schoolId: 'school-1',
      identifier: role.name,
      displayName: '调试${role.label}',
      role: role,
    );
    const tokens = AuthTokens(
      accessToken: 'debug-access-token',
      refreshToken: 'debug-refresh-token',
    );
    state = AsyncData(
      AuthState.authenticated(account: account, tokens: tokens),
    );
  }

  Future<void> signOut() async {
    final storage = ref.read(tokenStorageProvider);
    await storage.clear();
    state = const AsyncData(AuthState.unauthenticated());
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

final authStateProvider = Provider<AuthState>((ref) {
  final value = ref.watch(authControllerProvider);
  return value.valueOrNull ?? const AuthState.unknown();
});

final currentUserProvider = Provider<Account?>((ref) {
  return ref.watch(authStateProvider).account;
});
