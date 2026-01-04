import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_go/features/file/application/file_service.dart';

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
    // imageUrl can be a public URL OR an uploaded file_id.
    final coverRef = useState<String?>(course.imageUrl);
    final coverLocalFile = useState<File?>(null);
    final isUploadingCover = useState(false);
    final isLoading = useState(false);

    bool looksLikeFileId(String? value) {
      if (value == null) return false;
      final v = value.trim();
      if (v.isEmpty) return false;
      if (v.startsWith('http://') || v.startsWith('https://')) return false;
      return RegExp(r'^[0-9a-fA-F-]{36}$').hasMatch(v);
    }

    Future<void> pickAndUploadCover() async {
      if (isUploadingCover.value || isLoading.value) return;

      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1600,
      );

      if (picked == null) return;

      final file = File(picked.path);
      coverLocalFile.value = file;
      isUploadingCover.value = true;
      try {
        final fileModel = await ref.read(fileServiceProvider).uploadFile(file);
        coverRef.value = fileModel.fileId;
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('封面上传成功')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('封面上传失败: $e')));
        }
      } finally {
        isUploadingCover.value = false;
      }
    }

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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('封面图片 (可选)'),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: coverLocalFile.value != null
                        ? Image.file(coverLocalFile.value!, fit: BoxFit.cover)
                        : (coverRef.value != null &&
                              coverRef.value!.trim().isNotEmpty)
                        ? (looksLikeFileId(coverRef.value)
                              ? Consumer(
                                  builder: (context, ref, _) {
                                    final urlAsync = ref.watch(
                                      downloadUrlProvider(
                                        coverRef.value!.trim(),
                                      ),
                                    );
                                    return urlAsync.when(
                                      data: (url) =>
                                          Image.network(url, fit: BoxFit.cover),
                                      loading: () => Container(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surfaceContainerHighest,
                                        alignment: Alignment.center,
                                        child: const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                      error: (e, _) => Container(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surfaceContainerHighest,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.broken_image_outlined,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Image.network(
                                  coverRef.value!.trim(),
                                  fit: BoxFit.cover,
                                ))
                        : Container(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            alignment: Alignment.center,
                            child: const Icon(Icons.image_outlined),
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: (isUploadingCover.value || isLoading.value)
                        ? null
                        : pickAndUploadCover,
                    icon: isUploadingCover.value
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.cloud_upload_outlined),
                    label: const Text('选择图片并上传'),
                  ),
                ),
              ],
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
          onPressed: (isLoading.value || isUploadingCover.value)
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
                          imageUrl: coverRef.value?.trim(),
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
