import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/file/application/file_service.dart';
import 'package:learn_go/features/file/domain/file_model.dart';

class FileUploadWidget extends HookConsumerWidget {
  const FileUploadWidget({
    super.key,
    required this.onFileUploaded,
    this.initialFiles = const [],
  });

  final Function(FileModel) onFileUploaded;
  final List<FileModel> initialFiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileService = ref.watch(fileServiceProvider);
    final isUploading = ref.watch(isUploadingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...initialFiles.map(
              (file) => Chip(
                label: Text(file.fileName),
                onDeleted: () {
                  // Handle deletion if needed, or just callback
                },
              ),
            ),
            ActionChip(
              avatar: isUploading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.add),
              label: const Text('添加附件'),
              onPressed: isUploading
                  ? null
                  : () async {
                      final result = await FilePicker.platform.pickFiles();

                      if (result != null && result.files.single.path != null) {
                        final file = File(result.files.single.path!);
                        ref.read(isUploadingProvider.notifier).state = true;
                        try {
                          final uploadedFile = await fileService.uploadFile(
                            file,
                          );
                          onFileUploaded(uploadedFile);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('上传成功')),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text('上传失败: $e')));
                          }
                        } finally {
                          ref.read(isUploadingProvider.notifier).state = false;
                        }
                      }
                    },
            ),
          ],
        ),
      ],
    );
  }
}

final isUploadingProvider = StateProvider<bool>((ref) => false);
