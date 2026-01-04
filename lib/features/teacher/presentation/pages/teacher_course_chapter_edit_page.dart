import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../file/domain/file_model.dart';
import '../../../file/presentation/file_upload_widget.dart';
import '../../../file/application/file_service.dart';
import '../../../student/domain/course_chapter_models.dart';
import '../../application/teacher_course_chapters_provider.dart';
import '../../data/teacher_repository.dart';

class TeacherCourseChapterEditPage extends HookConsumerWidget {
  const TeacherCourseChapterEditPage({
    super.key,
    required this.courseId,
    this.chapterId,
  });

  final String courseId;
  final String? chapterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterIdState = useState<String?>(chapterId);
    final currentChapterId = chapterIdState.value;
    final isEdit = currentChapterId?.isNotEmpty ?? false;

    final chapterIdForFetch = currentChapterId;

    final AsyncValue<CourseChapterDetail?> detailAsync =
        (chapterIdForFetch == null || chapterIdForFetch.isEmpty)
        ? const AsyncValue<CourseChapterDetail?>.data(null)
        : ref
              .watch(
                teacherCourseChapterDetailProvider((
                  courseId: courseId,
                  chapterId: chapterIdForFetch,
                )),
              )
              .whenData<CourseChapterDetail?>((value) => value);

    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    final orderController = useTextEditingController(text: '0');
    final isSaving = useState(false);

    useEffect(() {
      final detail = detailAsync.valueOrNull;
      if (!isEdit || detail == null) return null;

      if (titleController.text.isEmpty) {
        titleController.text = detail.title;
      }
      if (contentController.text.isEmpty) {
        contentController.text = detail.content;
      }
      if (orderController.text == '0' && detail.orderIndex != 0) {
        orderController.text = detail.orderIndex.toString();
      }
      return null;
    }, [isEdit, detailAsync.valueOrNull]);

    Future<String?> ensureChapterCreated() async {
      final existing = chapterIdState.value;
      if (existing != null && existing.isNotEmpty) return existing;

      final title = titleController.text.trim();
      final content = contentController.text;
      final orderIndex = int.tryParse(orderController.text.trim()) ?? 0;

      if (title.isEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('请先填写标题')));
        }
        return null;
      }

      final repo = ref.read(teacherRepositoryProvider);
      final created = await repo.createCourseChapter(
        courseId,
        title: title,
        content: content,
        orderIndex: orderIndex,
      );
      chapterIdState.value = created.id;
      ref.invalidate(teacherCourseChaptersProvider(courseId));
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('已创建，可继续上传附件')));
      }
      return created.id;
    }

    Future<void> save() async {
      if (isSaving.value) return;
      final title = titleController.text.trim();
      final content = contentController.text;
      final orderIndex = int.tryParse(orderController.text.trim()) ?? 0;

      if (title.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('标题不能为空')));
        return;
      }

      isSaving.value = true;
      try {
        final repo = ref.read(teacherRepositoryProvider);
        if (!isEdit) {
          final created = await repo.createCourseChapter(
            courseId,
            title: title,
            content: content,
            orderIndex: orderIndex,
          );
          ref.invalidate(teacherCourseChaptersProvider(courseId));
          chapterIdState.value = created.id;
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('已创建')));
          }
          return;
        }

        final id = chapterIdState.value;
        if (id == null || id.isEmpty) {
          throw Exception('章节 ID 为空');
        }

        await repo.updateCourseChapter(
          courseId,
          id,
          title: title,
          content: content,
          orderIndex: orderIndex,
        );

        ref.invalidate(
          teacherCourseChapterDetailProvider((
            courseId: courseId,
            chapterId: id,
          )),
        );
        ref.invalidate(teacherCourseChaptersProvider(courseId));

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('已保存')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('保存失败：$e')));
        }
      } finally {
        isSaving.value = false;
      }
    }

    Future<void> attachFile(FileModel file) async {
      try {
        final id = await ensureChapterCreated();
        if (id == null) return;
        final repo = ref.read(teacherRepositoryProvider);
        await repo.attachCourseChapterFile(courseId, id, file.fileId);
        ref.invalidate(
          teacherCourseChapterDetailProvider((
            courseId: courseId,
            chapterId: id,
          )),
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('绑定失败：$e')));
        }
      }
    }

    Future<void> detachAttachment(CourseChapterAttachment att) async {
      final id = chapterIdState.value;
      if (id == null || id.isEmpty) return;
      try {
        final repo = ref.read(teacherRepositoryProvider);
        await repo.detachCourseChapterFile(courseId, id, att.id);
        ref.invalidate(
          teacherCourseChapterDetailProvider((
            courseId: courseId,
            chapterId: id,
          )),
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('解绑失败：$e')));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? '编辑章节' : '新建章节'),
        actions: [
          TextButton(
            onPressed: isSaving.value ? null : save,
            child: const Text('保存'),
          ),
        ],
      ),
      body: detailAsync.when(
        data: (detail) {
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: '标题',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: orderController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '排序（数字）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: contentController,
                minLines: 6,
                maxLines: 12,
                decoration: const InputDecoration(
                  labelText: '内容',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '附件',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              FileUploadWidget(onFileUploaded: attachFile),
              const SizedBox(height: 8),
              if (detail != null && detail.attachments.isNotEmpty)
                ...detail.attachments.map((att) {
                  return _TeacherChapterAttachmentTile(
                    attachment: att,
                    onDetach: () => detachAttachment(att),
                  );
                })
              else
                const Text('暂无附件'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isSaving.value ? null : save,
                child: Text(isEdit ? '保存' : '创建'),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
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

class _TeacherChapterAttachmentTile extends ConsumerWidget {
  const _TeacherChapterAttachmentTile({
    required this.attachment,
    required this.onDetach,
  });

  final CourseChapterAttachment attachment;
  final VoidCallback onDetach;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlAsync = ref.watch(downloadUrlProvider(attachment.id));

    return urlAsync.when(
      data: (url) {
        if (attachment.isImage) {
          return Align(
            alignment: Alignment.topLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => _showImagePreview(context, url),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: _AspectRatioNetworkImage(url: url),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: onDetach,
                        tooltip: '移除附件',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (attachment.isVideo) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.play_circle_outline),
              title: Text(
                attachment.name.isEmpty ? '视频' : attachment.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(attachment.type),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onDetach,
              ),
              onTap: () async {
                if (!kIsWeb &&
                    defaultTargetPlatform == TargetPlatform.windows) {
                  final uri = Uri.tryParse(url);
                  if (uri == null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('视频地址无效')));
                    return;
                  }
                  try {
                    final ok = await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                    if (!ok && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('无法调用系统播放器打开')),
                      );
                    }
                  } catch (e) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('无法调用系统播放器打开：$e')));
                  }
                  return;
                }

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
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDetach,
            ),
            onTap: () async {
              final uri = Uri.tryParse(url);
              if (uri == null) return;
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
          ),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) {
        // Fallback: show a simple tile even if we can't resolve URL
        return Card(
          child: ListTile(
            leading: const Icon(Icons.attach_file_outlined),
            title: Text(
              attachment.name.isEmpty ? '附件' : attachment.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('无法获取链接：$err'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDetach,
            ),
          ),
        );
      },
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
