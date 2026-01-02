import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/teacher_courses_provider.dart';
import '../../data/teacher_repository.dart';
import '../../domain/teacher_models.dart';

class EditCourseDialog extends HookConsumerWidget {
  const EditCourseDialog({super.key, required this.course});

  final TeacherCourse course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: course.name);
    final descriptionController = useTextEditingController(
      text: course.description,
    );
    final imageUrlController = useTextEditingController(text: course.imageUrl);
    final isLoading = useState(false);

    return AlertDialog(
      title: const Text('编辑课程'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '课程名称'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: '课程描述'),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: '封面图片 URL'),
            ),
          ],
        ),
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
                  if (nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('请输入课程名称')));
                    return;
                  }
                  isLoading.value = true;
                  try {
                    await ref
                        .read(teacherRepositoryProvider)
                        .updateCourse(
                          courseId: course.id,
                          name: nameController.text.trim(),
                          description: descriptionController.text.trim(),
                          imageUrl: imageUrlController.text.trim(),
                        );
                    ref.invalidate(teacherCoursesProvider);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('更新成功')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('更新失败: $e')));
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
              : const Text('保存'),
        ),
      ],
    );
  }
}
