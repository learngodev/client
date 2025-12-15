import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/exceptions/app_exception.dart';
import '../data/auth_repository.dart';
import '../application/school_list_provider.dart';
import '../domain/school.dart';

class PasswordResetPage extends HookConsumerWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = useState(0); // 0: Request, 1: Confirm
    final schoolIdController = useTextEditingController();
    final identifierController = useTextEditingController();
    final tokenController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isLoading = useState(false);
    final error = useState<String?>(null);

    final schoolsAsync = ref.watch(schoolListProvider);

    Future<void> onRequest() async {
      if (isLoading.value) return;
      if (schoolIdController.text.isEmpty ||
          identifierController.text.isEmpty) {
        error.value = '请填写完整信息';
        return;
      }
      isLoading.value = true;
      error.value = null;
      try {
        final token = await ref
            .read(authRepositoryProvider)
            .requestPasswordReset(
              schoolId: schoolIdController.text.trim(),
              identifier: identifierController.text.trim(),
            );
        tokenController.text = token;
        step.value = 1;
      } on AppException catch (e) {
        error.value = e.message;
      } catch (e) {
        error.value = '请求失败，请稍后重试';
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> onConfirm() async {
      if (isLoading.value) return;
      if (passwordController.text.isEmpty) {
        error.value = '请输入新密码';
        return;
      }
      if (passwordController.text != confirmPasswordController.text) {
        error.value = '两次输入的密码不一致';
        return;
      }
      isLoading.value = true;
      error.value = null;
      try {
        await ref
            .read(authRepositoryProvider)
            .confirmPasswordReset(
              schoolId: schoolIdController.text.trim(),
              identifier: identifierController.text.trim(),
              token: tokenController.text.trim(),
              newPassword: passwordController.text,
            );
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('密码重置成功，请使用新密码登录')));
          context.pop();
        }
      } on AppException catch (e) {
        error.value = e.message;
      } catch (e) {
        error.value = '重置失败，请稍后重试';
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('重置密码')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: step.value == 0
                  ? _buildRequestStep(
                      context,
                      schoolsAsync,
                      schoolIdController,
                      identifierController,
                      isLoading,
                      error,
                      onRequest,
                    )
                  : _buildConfirmStep(
                      context,
                      tokenController,
                      passwordController,
                      confirmPasswordController,
                      isLoading,
                      error,
                      onConfirm,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestStep(
    BuildContext context,
    AsyncValue<List<School>> schoolsAsync,
    TextEditingController schoolId,
    TextEditingController identifier,
    ValueNotifier<bool> isLoading,
    ValueNotifier<String?> error,
    VoidCallback onSubmit,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('第一步：验证账号信息', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        if (error.value != null) ...[
          Text(
            error.value!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 16),
        ],
        schoolsAsync.when(
          data: (schools) => DropdownButtonFormField<String>(
            value: schools.any((s) => s.id == schoolId.text)
                ? schoolId.text
                : null,
            decoration: const InputDecoration(labelText: '选择学校'),
            items: schools
                .map((s) => DropdownMenuItem(value: s.id, child: Text(s.name)))
                .toList(),
            onChanged: (value) {
              if (value != null) schoolId.text = value;
            },
          ),
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => const Text('加载学校列表失败'),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: identifier,
          decoration: const InputDecoration(
            labelText: '账号',
            hintText: '请输入教师号 / 学号 / 管理员账号',
          ),
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: isLoading.value ? null : onSubmit,
          child: isLoading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('下一步'),
        ),
      ],
    );
  }

  Widget _buildConfirmStep(
    BuildContext context,
    TextEditingController token,
    TextEditingController password,
    TextEditingController confirmPassword,
    ValueNotifier<bool> isLoading,
    ValueNotifier<String?> error,
    VoidCallback onSubmit,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('第二步：设置新密码', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          '系统已自动获取重置令牌，请直接设置新密码。',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 24),
        if (error.value != null) ...[
          Text(
            error.value!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 16),
        ],
        TextField(
          controller: token,
          readOnly: true,
          decoration: const InputDecoration(labelText: '重置令牌', filled: true),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: password,
          decoration: const InputDecoration(labelText: '新密码'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: confirmPassword,
          decoration: const InputDecoration(labelText: '确认新密码'),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: isLoading.value ? null : onSubmit,
          child: isLoading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('确认重置'),
        ),
      ],
    );
  }
}
