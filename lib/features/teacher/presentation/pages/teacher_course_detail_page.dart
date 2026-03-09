import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/teacher_courses_provider.dart';
import 'teacher_course_chapters_page.dart';
import 'teacher_course_classes_page.dart';

class TeacherCourseDetailPage extends HookConsumerWidget {
  const TeacherCourseDetailPage({super.key, required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(teacherCoursesProvider);
    final title = coursesAsync.maybeWhen(
      data: (courses) {
        for (final c in courses) {
          if (c.id == courseId) {
            return c.name.trim().isEmpty ? '课程' : c.name;
          }
        }
        return '课程';
      },
      orElse: () => '课程',
    );

    final tabController = useTabController(initialLength: 2);
    useListenable(tabController);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: '班级'),
            Tab(text: '章节'),
          ],
        ),
      ),
      floatingActionButton: tabController.index == 1
          ? FloatingActionButton(
              onPressed: () {
                context.push('/teacher/courses/$courseId/chapters/create');
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: TabBarView(
        controller: tabController,
        children: [
          TeacherCourseClassesPage(courseId: courseId, embedded: true),
          TeacherCourseChaptersPage(courseId: courseId, embedded: true),
        ],
      ),
    );
  }
}
