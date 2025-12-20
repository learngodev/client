import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/teacher_courses_provider.dart';

class TeacherCoursesPage extends HookConsumerWidget {
  const TeacherCoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(teacherCoursesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('我的课程')),
      body: coursesAsync.when(
        data: (courses) {
          if (courses.isEmpty) {
            return const Center(child: Text('暂无课程'));
          }
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course.name),
                subtitle: Text(course.description),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push('/teacher/courses/${course.id}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}
