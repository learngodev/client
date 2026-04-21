import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/resource_providers.dart';
import '../../../file/application/file_service.dart';
import '../../../auth/application/auth_controller.dart';

class ResourceDetailPage extends HookConsumerWidget {
  final String resourceId;

  const ResourceDetailPage({
    super.key,
    required this.resourceId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(resourceDetailProvider(resourceId));
    final theme = Theme.of(context);

    Future<void> downloadFile(String fileId, String fileName) async {
      try {
        final url = await ref.read(downloadUrlProvider(fileId).future);
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('无法打开下载链接')),
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('下载失败: $e')),
          );
        }
      }
    }

    Future<void> previewImage(String fileId, String fileName) async {
      try {
        final url = await ref.read(downloadUrlProvider(fileId).future);
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.black,
              child: Stack(
                children: [
                  Center(
                    child: InteractiveViewer(
                      child: Image.network(
                        url,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              '图片加载失败',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      title: Text(fileName),
                      backgroundColor: Colors.black54,
                      leading: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('预览失败: $e')),
          );
        }
      }
    }

    bool isImageFile(String fileName, String fileType) {
      // 优先使用 MIME 类型判断
      if (fileType.startsWith('image/')) {
        return true;
      }
      // 后备方案：通过文件后缀判断
      final extension = fileName.toLowerCase().split('.').last;
      final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'svg'];
      return imageExtensions.contains(extension);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('资源详情'),
        actions: [
          // Show edit/delete for resource owner, favorite for others
          Consumer(
            builder: (context, ref, _) {
              final authState = ref.watch(authStateProvider);
              final myId = authState.account?.id;

              return detailAsync.maybeWhen(
                data: (detail) {
                  final resource = detail.resource;
                  final isOwner = myId != null && resource.teacherId == myId;

                  if (isOwner) {
                    // Owner actions - only delete (edit is TODO)
                    return IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // TODO: Show delete confirmation
                      },
                    );
                  } else {
                    // Non-owner actions - favorite button
                    return IconButton(
                      icon: Icon(
                        resource.isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: resource.isFavorited ? Colors.red : null,
                      ),
                      onPressed: () {
                        ref.read(
                          favoriteControllerProvider(
                            FavoriteControllerParams(
                              resourceId: resourceId,
                              initialState: resource.isFavorited,
                            ),
                          ).notifier,
                        ).toggle();
                        // Refresh the detail to update favorite status
                        ref.invalidate(resourceDetailProvider(resourceId));
                      },
                    );
                  }
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: detailAsync.when(
        data: (detail) {
          final resource = detail.resource;
          final files = detail.files;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  resource.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Stats
                Row(
                  children: [
                    _StatChip(
                      icon: Icons.visibility_outlined,
                      label: '${resource.viewCount} 浏览',
                    ),
                    const SizedBox(width: 8),
                    _StatChip(
                      icon: Icons.download_outlined,
                      label: '${resource.downloadCount} 下载',
                    ),
                    const SizedBox(width: 8),
                    _StatChip(
                      icon: Icons.favorite_outline,
                      label: '${resource.favoriteCount} 收藏',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Description
                if (resource.description.isNotEmpty) ...[
                  Text('描述', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    resource.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                ],

                // Tags
                if (resource.tags.isNotEmpty) ...[
                  Text('标签', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: resource.tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],

                // Files
                Text('文件 (${files.length})', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                if (files.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Text('暂无文件'),
                    ),
                  )
                else
                  ...files.map((file) {
                    final isImage = isImageFile(file.name, file.fileType);
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(
                          isImage ? Icons.image : Icons.insert_drive_file,
                        ),
                        title: Text(file.name),
                        subtitle: Text(_formatFileSize(file.size)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isImage)
                              IconButton(
                                icon: const Icon(Icons.visibility),
                                onPressed: () => previewImage(file.id, file.name),
                                tooltip: '预览',
                              ),
                            IconButton(
                              icon: const Icon(Icons.download),
                              onPressed: () => downloadFile(file.id, file.name),
                              tooltip: '下载',
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('加载失败: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('返回'),
              ),
            ],
          ),
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

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
      labelStyle: theme.textTheme.bodySmall,
    );
  }
}
