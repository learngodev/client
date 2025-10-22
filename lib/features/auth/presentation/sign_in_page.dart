import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../application/auth_controller.dart';
import '../application/sign_in_controller.dart';
import '../domain/account.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolIdController = useTextEditingController(text: 'school-1');
    final identifierController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isObscure = useState(true);
    useListenable(schoolIdController);
    useListenable(identifierController);
    useListenable(passwordController);

    final signInState = ref.watch(signInControllerProvider);
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

    return Scaffold(
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
                  TextField(
                    controller: schoolIdController,
                    decoration: const InputDecoration(
                      labelText: '学校 ID',
                      hintText: '如 school-1',
                    ),
                    textInputAction: TextInputAction.next,
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
                                  identifier: identifierController.text.trim(),
                                  password: passwordController.text,
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
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    '快速体验',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: AccountRole.values
                        .map(
                          (role) => OutlinedButton.icon(
                            onPressed: () => ref
                                .read(authStateProvider.notifier)
                                .debugLogin(role),
                            icon: const Icon(Icons.play_arrow),
                            label: Text('${role.label}端'),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '真实接入后将移除以上调试入口。',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
