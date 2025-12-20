import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/teacher_models.dart';
import '../data/teacher_repository.dart';

final teacherCoursesProvider = FutureProvider.autoDispose<List<TeacherCourse>>((
  ref,
) async {
  final repository = ref.watch(teacherRepositoryProvider);
  return repository.listCourses();
});

final teacherCourseClassesProvider = FutureProvider.autoDispose
    .family<List<TeacherClass>, String>((ref, courseId) async {
      final repository = ref.watch(teacherRepositoryProvider);
      return repository.listCourseClasses(courseId);
    });

final teacherClassStudentsProvider = FutureProvider.autoDispose
    .family<List<TeacherStudent>, String>((ref, classId) async {
      final repository = ref.watch(teacherRepositoryProvider);
      return repository.listClassStudents(classId);
    });
