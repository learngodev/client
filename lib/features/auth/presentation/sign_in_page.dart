import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/storage/login_preference_storage.dart';
import '../application/school_list_provider.dart';
import '../application/sign_in_controller.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolIdController = useTextEditingController();
    final identifierController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isObscure = useState(true);
    final rememberPassword = useState(false);
    useListenable(schoolIdController);
    useListenable(identifierController);
    useListenable(passwordController);

    final lastLoginPreference = ref.watch(lastLoginPreferenceProvider);

    useEffect(() {
      final preference = lastLoginPreference.valueOrNull;
      if (preference != null) {
        if (preference.schoolId.isNotEmpty &&
            schoolIdController.text != preference.schoolId) {
          schoolIdController.text = preference.schoolId;
        }
        if (preference.identifier.isNotEmpty &&
            identifierController.text != preference.identifier) {
          identifierController.text = preference.identifier;
        }
        rememberPassword.value = preference.rememberPassword;
        if (preference.rememberPassword &&
            (preference.password?.isNotEmpty ?? false) &&
            passwordController.text != preference.password) {
          passwordController.text = preference.password!;
        }
      }
      return null;
    }, [lastLoginPreference]);

    final signInState = ref.watch(signInControllerProvider);
    final schoolsAsync = ref.watch(schoolListProvider);

    ref.listen<AsyncValue<void>>(signInControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          final message = error is AppException ? error.message : '登录失败，请检查网络';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        },
      );
    });

    final canSubmit =
        schoolIdController.text.isNotEmpty &&
        identifierController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '登录 LearnGo 乐学',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    schoolsAsync.when(
                      data: (schools) => DropdownButtonFormField<String>(
                        initialValue:
                            schools.any((s) => s.id == schoolIdController.text)
                            ? schoolIdController.text
                            : null,
                        decoration: const InputDecoration(labelText: '选择学校'),
                        items: schools
                            .map(
                              (s) => DropdownMenuItem(
                                value: s.id,
                                child: Text(s.name),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            schoolIdController.text = value;
                          }
                        },
                      ),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      error: (err, stack) => Text(
                        '加载学校列表失败: $err',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: identifierController,
                      decoration: const InputDecoration(
                        labelText: '账号',
                        hintText: '请输入教师号 / 学号 / 管理员账号',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        suffixIcon: IconButton(
                          onPressed: () => isObscure.value = !isObscure.value,
                          icon: Icon(
                            isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      obscureText: isObscure.value,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword.value,
                          onChanged: (checked) {
                            rememberPassword.value = checked ?? false;
                            if (!rememberPassword.value) {
                              passwordController.clear();
                            }
                          },
                        ),
                        const Text('记住密码'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: !canSubmit || signInState.isLoading
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              ref
                                  .read(signInControllerProvider.notifier)
                                  .signIn(
                                    schoolId: schoolIdController.text.trim(),
                                    identifier: identifierController.text
                                        .trim(),
                                    password: passwordController.text,
                                    rememberPassword: rememberPassword.value,
                                  );
                            },
                      child: signInState.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('登 录'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
