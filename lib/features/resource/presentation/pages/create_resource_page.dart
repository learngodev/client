import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

import '../../domain/resource_models.dart';
import '../../data/resource_repository.dart';
import '../../../file/application/file_service.dart';
import '../../../file/domain/file_model.dart';

class CreateResourcePage extends HookConsumerWidget {
  const CreateResourcePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final repository = ref.watch(resourceRepositoryProvider);

    void showSnack(String message) {
      if (!context.mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(SnackBar(content: Text(message)));
    }

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final tags = useState<List<String>>([]);
    final tagController = useTextEditingController();

    final uploadedFiles = useState<List<FileModel>>([]);
    final isUploading = useState(false);
    final fileService = ref.read(fileServiceProvider);

    final isSubmitting = useState(false);

    Future<void> pickFiles() async {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null) {
        isUploading.value = true;
        try {
          for (final file in result.files) {
            if (file.path != null) {
              final uploaded = await fileService.uploadFile(File(file.path!));
              uploadedFiles.value = [...uploadedFiles.value, uploaded];
            }
          }
          showSnack('文件上传成功');
        } catch (e) {
          showSnack('上传失败: $e');
        } finally {
          isUploading.value = false;
        }
      }
    }

    void addTag() {
      final tag = tagController.text.trim();
      if (tag.isNotEmpty && !tags.value.contains(tag)) {
        tags.value = [...tags.value, tag];
        tagController.clear();
      }
    }

    void removeTag(String tag) {
      tags.value = tags.value.where((t) => t != tag).toList();
    }

    Future<void> submit() async {
      if (titleController.text.trim().isEmpty) {
        showSnack('请输入资源标题');
        return;
      }
      if (uploadedFiles.value.isEmpty) {
        showSnack('请至少上传一个文件');
        return;
      }

      isSubmitting.value = true;
      try {
        final params = CreateResourceParams(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          gradeLevel: '',
          tags: tags.value,
          fileIds: uploadedFiles.value.map((f) => f.fileId).toList(),
        );

        await repository.createResource(params);
        if (context.mounted) {
          showSnack('资源创建成功');
          context.pop();
        }
      } catch (e) {
        showSnack('创建失败: $e');
      } finally {
        isSubmitting.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('创建资源'),
        actions: [
          TextButton(
            onPressed: isSubmitting.value ? null : submit,
            child: isSubmitting.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('发布'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: '资源标题',
                hintText: '请输入资源标题',
                border: OutlineInputBorder(),
              ),
              maxLength: 100,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: '资源描述',
                hintText: '请输入资源描述',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              maxLength: 500,
            ),
            const SizedBox(height: 16),
            Text('标签', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tagController,
                    decoration: const InputDecoration(
                      hintText: '输入标签',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => addTag(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.add), onPressed: addTag),
              ],
            ),
            const SizedBox(height: 8),
            if (tags.value.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: tags.value.map((tag) {
                  return Chip(
                    label: Text(tag),
                    onDeleted: () => removeTag(tag),
                  );
                }).toList(),
              ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text('文件', style: theme.textTheme.titleMedium),
                const SizedBox(width: 8),
                Text(
                  '(${uploadedFiles.value.length})',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: isUploading.value ? null : pickFiles,
              icon: isUploading.value
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.upload_file),
              label: Text(isUploading.value ? '上传中...' : '选择文件'),
            ),
            const SizedBox(height: 8),
            if (uploadedFiles.value.isNotEmpty)
              ...uploadedFiles.value.map((file) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: Text(file.fileName),
                    subtitle: Text(_formatFileSize(file.size)),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        uploadedFiles.value = uploadedFiles.value
                            .where((f) => f.fileId != file.fileId)
                            .toList();
                      },
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
