import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../file/application/file_service.dart';
import '../../application/course_detail_providers.dart';
import '../../domain/course_chapter_models.dart';

class StudentCourseChapterDetailPage extends ConsumerWidget {
  const StudentCourseChapterDetailPage({
    super.key,
    required this.courseId,
    required this.chapterId,
  });

  final String courseId;
  final String chapterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(
      courseChapterDetailProvider((courseId: courseId, chapterId: chapterId)),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('章节内容')),
      body: detail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('无法加载章节详情：$error'),
          ),
        ),
        data: (chapter) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                chapter.title.isEmpty ? '未命名章节' : chapter.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              if (chapter.content.trim().isNotEmpty)
                SelectableText(chapter.content)
              else
                const Text('暂无内容'),
              const SizedBox(height: 16),
              if (chapter.attachments.isNotEmpty) ...[
                Text('附件', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...chapter.attachments.map((a) {
                  if (a.isImage) {
                    return _InlineImageAttachment(attachment: a);
                  }
                  return _AttachmentTile(attachment: a);
                }),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _InlineImageAttachment extends ConsumerWidget {
  const _InlineImageAttachment({required this.attachment});

  final CourseChapterAttachment attachment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlAsync = ref.watch(downloadUrlProvider(attachment.id));
    return urlAsync.when(
      data: (url) {
        return Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560, maxHeight: 800),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: GestureDetector(
                onTap: () => _showImagePreview(context, url),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: _AspectRatioNetworkImage(url: url),
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => _AttachmentTile(attachment: attachment),
    );
  }
}

class _AspectRatioNetworkImage extends StatefulWidget {
  const _AspectRatioNetworkImage({required this.url});

  final String url;

  @override
  State<_AspectRatioNetworkImage> createState() =>
      _AspectRatioNetworkImageState();
}

class _AspectRatioNetworkImageState extends State<_AspectRatioNetworkImage> {
  ImageStream? _stream;
  ImageStreamListener? _listener;
  double? _aspectRatio;

  @override
  void initState() {
    super.initState();
    _resolve();
  }

  @override
  void didUpdateWidget(covariant _AspectRatioNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _aspectRatio = null;
      _resolve();
    }
  }

  void _resolve() {
    _removeListener();
    if (widget.url.trim().isEmpty) return;

    final provider = NetworkImage(widget.url);
    final stream = provider.resolve(const ImageConfiguration());
    _stream = stream;
    _listener = ImageStreamListener(
      (imageInfo, _) {
        final w = imageInfo.image.width.toDouble();
        final h = imageInfo.image.height.toDouble();
        if (w > 0 && h > 0) {
          setState(() {
            _aspectRatio = w / h;
          });
        }
        _removeListener();
      },
      onError: (error, stackTrace) {
        _removeListener();
      },
    );
    stream.addListener(_listener!);
  }

  void _removeListener() {
    if (_stream != null && _listener != null) {
      _stream!.removeListener(_listener!);
    }
    _stream = null;
    _listener = null;
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      widget.url,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Text('图片加载失败'),
        );
      },
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const AspectRatio(
          aspectRatio: 1,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );

    final ratio = _aspectRatio;
    if (ratio == null || ratio <= 0) {
      return image;
    }
    return AspectRatio(aspectRatio: ratio, child: image);
  }
}

class _AttachmentTile extends ConsumerWidget {
  const _AttachmentTile({required this.attachment});

  final CourseChapterAttachment attachment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (attachment.isImage || attachment.isVideo) {
      final urlAsync = ref.watch(downloadUrlProvider(attachment.id));
      return urlAsync.when(
        data: (url) {
          if (attachment.isImage) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.image_outlined),
                title: Text(
                  attachment.name.isEmpty ? '图片' : attachment.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(attachment.type),
                trailing: const Icon(Icons.open_in_full),
                onTap: () => _showImagePreview(context, url),
              ),
            );
          }

          return Card(
            child: ListTile(
              leading: const Icon(Icons.play_circle_outline),
              title: Text(
                attachment.name.isEmpty ? '视频' : attachment.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(attachment.type),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                context.push(
                  '/student/video',
                  extra: {
                    'title': attachment.name.isEmpty ? '视频播放' : attachment.name,
                    'url': url,
                  },
                );
              },
            ),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (err, stack) => Card(
          child: ListTile(
            leading: const Icon(Icons.broken_image_outlined),
            title: Text(
              attachment.name.isEmpty ? '附件' : attachment.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('无法加载：$err'),
          ),
        ),
      );
    }

    return Card(
      child: ListTile(
        leading: const Icon(Icons.attach_file_outlined),
        title: Text(
          attachment.name.isEmpty ? '文件' : attachment.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(attachment.type),
        trailing: const Icon(Icons.download_outlined),
        onTap: () async {
          try {
            final url = await ref
                .read(fileServiceProvider)
                .getDownloadUrl(attachment.id);
            final uri = Uri.tryParse(url);
            if (uri == null) return;
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('无法打开文件：$e')));
          }
        },
      ),
    );
  }
}

void _showImagePreview(BuildContext context, String url) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.all(12),
        child: InteractiveViewer(
          child: Image.network(
            url,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Text('图片加载失败'),
              );
            },
          ),
        ),
      );
    },
  );
}
