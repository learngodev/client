import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import 'auth_controller.dart';

class SignInController extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> signIn({
    required String schoolId,
    required String identifier,
    required String password,
    required bool rememberPassword,
  }) async {
    if (state.isLoading) return;
    state = const AsyncValue.loading();
    try {
      await ref
          .read(authStateProvider.notifier)
          .signIn(
            schoolId: schoolId,
            identifier: identifier,
            password: password,
            rememberPassword: rememberPassword,
          );
      state = const AsyncValue.data(null);
    } on AppException catch (error, stack) {
      state = AsyncValue.error(error, stack);
    } catch (error, stack) {
      state = AsyncValue.error(AppException('登录失败，请稍后重试'), stack);
    }
  }

  void reset() {
    if (!state.isLoading) {
      state = const AsyncValue.data(null);
    }
  }
}

final signInControllerProvider =
    NotifierProvider<SignInController, AsyncValue<void>>(SignInController.new);
