import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/student_dashboard_controller.dart';
import '../../data/student_repository.dart';

class JoinCourseDialog extends HookConsumerWidget {
  const JoinCourseDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = useTextEditingController();
    final isLoading = useState(false);

    return AlertDialog(
      title: const Text('加入课程'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: codeController,
            decoration: const InputDecoration(
              labelText: '邀请码',
              hintText: '请输入6位课程邀请码',
            ),
            textCapitalization: TextCapitalization.characters,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: isLoading.value ? null : () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: isLoading.value
              ? null
              : () async {
                  if (codeController.text.isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('请输入邀请码')));
                    return;
                  }

                  isLoading.value = true;
                  try {
                    await ref
                        .read(studentRepositoryProvider)
                        .joinCourse(codeController.text);

                    if (context.mounted) {
                      ref.invalidate(studentCoursesProvider);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('加入成功')));
                      // TODO: Refresh course list if available
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('加入失败: $e')));
                    }
                  } finally {
                    isLoading.value = false;
                  }
                },
          child: isLoading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('加入'),
        ),
      ],
    );
  }
}
