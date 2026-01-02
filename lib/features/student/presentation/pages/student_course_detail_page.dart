import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/course_detail_providers.dart';
import '../../application/student_dashboard_controller.dart';
import '../../domain/sample_data.dart' as sample;

class StudentCourseDetailPage extends ConsumerWidget {
  const StudentCourseDetailPage({super.key, required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(studentCoursesProvider);
    final title = courses.maybeWhen(
      data: (items) {
        final matched = items.where((c) => c.id == courseId).toList();
        return matched.isNotEmpty ? matched.first.name : '课程';
      },
      orElse: () => '课程',
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(
            tabs: [
              Tab(text: '任务'),
              Tab(text: '章节'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _CourseTasksTab(courseId: courseId),
            _CourseChaptersTab(courseId: courseId),
          ],
        ),
      ),
    );
  }
}

class _CourseTasksTab extends ConsumerWidget {
  const _CourseTasksTab({required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignments = ref.watch(courseAssignmentsProvider(courseId));

    return assignments.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('无法加载任务：$error'),
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('暂无任务'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = items[index];
            return _AssignmentTile(item: item);
          },
        );
      },
    );
  }
}

class _AssignmentTile extends StatelessWidget {
  const _AssignmentTile({required this.item});

  final sample.StudentAssignmentItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ListTile(
        title: Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text('${item.teacher} · ${item.dueLabel}'),
        leading: Icon(item.statusIcon(), color: item.statusColor(theme)),
        trailing: Text(item.status.label),
        onTap: () => context.push('/student/assignments/${item.id}'),
      ),
    );
  }
}

class _CourseChaptersTab extends ConsumerWidget {
  const _CourseChaptersTab({required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.watch(courseChaptersProvider(courseId));

    return chapters.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('无法加载章节：$error'),
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('暂无章节'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final chapter = items[index];
            return Card(
              child: ListTile(
                title: Text(
                  chapter.title.isEmpty ? '未命名章节' : chapter.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(
                  '/student/courses/$courseId/chapters/${chapter.id}',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
