import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/admin_repository.dart';
import '../domain/accounts.dart';
import '../domain/course.dart';
import '../../auth/application/auth_controller.dart';

class CourseFilter {
  final String? departmentId;
  final String? classId;
  final String? keyword;
  final String? slotId;

  const CourseFilter({
    this.departmentId,
    this.classId,
    this.keyword,
    this.slotId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseFilter &&
          runtimeType == other.runtimeType &&
          departmentId == other.departmentId &&
          classId == other.classId &&
          keyword == other.keyword &&
          slotId == other.slotId;

  @override
  int get hashCode =>
      departmentId.hashCode ^
      classId.hashCode ^
      keyword.hashCode ^
      slotId.hashCode;
}

final courseFilterProvider = StateProvider<CourseFilter>(
  (ref) => const CourseFilter(),
);

final courseListProvider = FutureProvider.autoDispose
    .family<List<Course>, String>((ref, schoolId) async {
      final repo = ref.watch(adminRepositoryProvider);
      final filter = ref.watch(courseFilterProvider);

      return repo.fetchCourses(
        schoolId: schoolId,
        departmentId: filter.departmentId,
        classId: filter.classId,
        size: 1000,
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
    pageSize: 1000,
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
