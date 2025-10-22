import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import 'auth_controller.dart';

class SignInController extends StateNotifier<AsyncValue<void>> {
  SignInController(this._ref) : super(const AsyncValue.data(null));

  final Ref _ref;

  Future<void> signIn({
    required String schoolId,
    required String identifier,
    required String password,
  }) async {
    if (state.isLoading) return;
    state = const AsyncValue.loading();
    try {
      await _ref
          .read(authStateProvider.notifier)
          .signIn(
            schoolId: schoolId,
            identifier: identifier,
            password: password,
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
    StateNotifierProvider<SignInController, AsyncValue<void>>((ref) {
      return SignInController(ref);
    });
