import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/teacher_classes_provider.dart';
import '../../application/teacher_courses_provider.dart';
import '../../data/teacher_repository.dart';

class CreateCourseDialog extends HookConsumerWidget {
  const CreateCourseDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final imageUrlController = useTextEditingController();
    final selectedClassIds = useState<List<String>>([]);
    final isLoading = useState(false);

    final classesAsync = ref.watch(teacherClassesProvider);

    return AlertDialog(
      title: const Text('创建课程'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '课程名称',
                hintText: '请输入课程名称',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: '课程描述',
                hintText: '请输入课程描述',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: '封面图片 URL (可选)',
                hintText: '请输入图片链接',
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('选择班级 (可选)'),
            ),
            const SizedBox(height: 8),
            classesAsync.when(
              data: (classes) {
                if (classes.isEmpty) {
                  return const Text('暂无班级可选');
                }
                return Wrap(
                  spacing: 8,
                  children: classes.map((cls) {
                    final isSelected = selectedClassIds.value.contains(cls.id);
                    return FilterChip(
                      label: Text(cls.name),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          selectedClassIds.value = [
                            ...selectedClassIds.value,
                            cls.id,
                          ];
                        } else {
                          selectedClassIds.value = selectedClassIds.value
                              .where((id) => id != cls.id)
                              .toList();
                        }
                      },
                    );
                  }).toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('加载班级失败: $err'),
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
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('请输入课程名称')));
                    return;
                  }

                  isLoading.value = true;
                  try {
                    await ref
                        .read(teacherRepositoryProvider)
                        .createCourse(
                          name: nameController.text,
                          description: descriptionController.text,
                          imageUrl: imageUrlController.text.isEmpty
                              ? null
                              : imageUrlController.text,
                          classIds: selectedClassIds.value.isEmpty
                              ? null
                              : selectedClassIds.value,
                        );
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      ref.invalidate(teacherCoursesProvider);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('创建成功')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('创建失败: $e')));
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
              : const Text('创建'),
        ),
      ],
    );
  }
}
