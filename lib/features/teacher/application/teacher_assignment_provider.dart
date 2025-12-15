import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/teacher_repository.dart';
import '../domain/teacher_models.dart';

final teacherAssignmentsProvider =
    FutureProvider.autoDispose<List<TeacherAssignment>>((ref) async {
      final repository = ref.watch(teacherRepositoryProvider);
      return repository.listTeacherAssignments();
    });
