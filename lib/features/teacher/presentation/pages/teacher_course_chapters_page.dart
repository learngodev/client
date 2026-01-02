import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/teacher_course_chapters_provider.dart';
import '../../data/teacher_repository.dart';

class TeacherCourseChaptersPage extends ConsumerWidget {
  const TeacherCourseChaptersPage({
    super.key,
    required this.courseId,
    this.embedded = false,
  });

  final String courseId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersAsync = ref.watch(teacherCourseChaptersProvider(courseId));

    final body = chaptersAsync.when(
      data: (chapters) {
        if (chapters.isEmpty) {
          return const Center(child: Text('暂无章节'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: chapters.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final chapter = chapters[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(
                  chapter.title.isEmpty ? '未命名章节' : chapter.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text('排序：${chapter.orderIndex}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      tooltip: '编辑',
                      onPressed: () {
                        context.push(
                          '/teacher/courses/$courseId/chapters/${chapter.id}/edit',
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: '删除',
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('删除章节'),
                            content: const Text('确定要删除这个章节吗？'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('取消'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('删除'),
                              ),
                            ],
                          ),
                        );
                        if (confirmed != true) return;

                        try {
                          final repo = ref.read(teacherRepositoryProvider);
                          await repo.deleteCourseChapter(courseId, chapter.id);
                          ref.invalidate(
                            teacherCourseChaptersProvider(courseId),
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('已删除')),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text('删除失败：$e')));
                          }
                        }
                      },
                    ),
                  ],
                ),
                onTap: () {
                  context.push(
                    '/teacher/courses/$courseId/chapters/${chapter.id}/edit',
                  );
                },
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('加载失败: $error')),
    );

    if (embedded) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('章节管理')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/teacher/courses/$courseId/chapters/create');
        },
        child: const Icon(Icons.add),
      ),
      body: body,
    );
  }
}
