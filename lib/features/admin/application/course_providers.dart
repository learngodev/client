import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/admin_repository.dart';
import '../domain/accounts.dart';
import '../domain/course.dart';
import '../../auth/application/auth_controller.dart';

class CourseFilter {
  final String? departmentId;
  final String? classId;

  const CourseFilter({this.departmentId, this.classId});
}

final courseFilterProvider = StateProvider<CourseFilter>(
  (ref) => const CourseFilter(),
);

final courseListProvider = FutureProvider.autoDispose<List<Course>>((
  ref,
) async {
  final repo = ref.watch(adminRepositoryProvider);
  final user = ref.watch(currentUserProvider);
  final filter = ref.watch(courseFilterProvider);

  if (user == null) return [];
  return repo.fetchCourses(
    schoolId: user.schoolId,
    departmentId: filter.departmentId,
    classId: filter.classId,
  );
});

final teacherListProvider = FutureProvider.autoDispose<List<AdminAccount>>((
  ref,
) async {
  final repo = ref.watch(adminRepositoryProvider);
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];

  final page = await repo.fetchAccounts(
    schoolId: user.schoolId,
    role: AdminAccountRole.teacher,
    pageSize: 100,
  );
  return page.accounts;
});

final assignmentListProvider = FutureProvider.autoDispose
    .family<List<TeachingAssignment>, String?>((ref, courseId) async {
      final repo = ref.watch(adminRepositoryProvider);
      final user = ref.watch(currentUserProvider);
      if (user == null) return [];
      return repo.fetchAssignments(schoolId: user.schoolId, courseId: courseId);
    });
