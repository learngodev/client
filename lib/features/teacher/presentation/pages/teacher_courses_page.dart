import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/teacher_courses_provider.dart';
import '../../domain/teacher_models.dart';
import 'create_course_dialog.dart';

class TeacherCoursesPage extends HookConsumerWidget {
  const TeacherCoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(teacherCoursesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: coursesAsync.when(
        data: (courses) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('我的课程'),
                centerTitle: true,
                pinned: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateCourseDialog(),
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '搜索',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
              ),
              if (courses.isEmpty)
                const SliverFillRemaining(child: Center(child: Text('暂无课程')))
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final course = courses[index];
                    return _TeacherCourseCard(course: course, index: index);
                  }, childCount: courses.length),
                ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}

class _TeacherCourseCard extends StatelessWidget {
  final TeacherCourse course;
  final int index;

  const _TeacherCourseCard({required this.course, required this.index});

  @override
  Widget build(BuildContext context) {
    // Generate a consistent color based on index
    final colors = [
      (bg: Colors.red.shade100, icon: Colors.red),
      (bg: Colors.blue.shade100, icon: Colors.blue),
      (bg: Colors.orange.shade100, icon: Colors.orange),
      (bg: Colors.green.shade100, icon: Colors.green),
      (bg: Colors.purple.shade100, icon: Colors.purple),
      (bg: Colors.teal.shade100, icon: Colors.teal),
      (bg: Colors.brown.shade100, icon: Colors.brown),
      (bg: Colors.blueGrey.shade100, icon: Colors.blueGrey),
    ];
    final colorSet = colors[index % colors.length];
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.push('/teacher/courses/${course.id}');
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color:
                        course.imageUrl != null && course.imageUrl!.isNotEmpty
                        ? null
                        : (isDark
                              ? colorSet.icon.withValues(alpha: 0.2)
                              : colorSet.bg),
                    borderRadius: BorderRadius.circular(8),
                    image:
                        course.imageUrl != null && course.imageUrl!.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(course.imageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: course.imageUrl == null || course.imageUrl!.isEmpty
                      ? Icon(
                          Icons.book, // Default icon for teacher courses
                          color: colorSet.icon,
                          size: 24,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course.description.isNotEmpty
                            ? course.description
                            : '暂无描述',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (course.invitationCode != null &&
                          course.invitationCode!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '邀请码: ${course.invitationCode}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
