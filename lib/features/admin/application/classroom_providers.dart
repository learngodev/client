import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/admin/data/admin_repository.dart';
import 'package:learn_go/features/admin/domain/classroom.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';

final classroomsProvider = FutureProvider.autoDispose<List<Classroom>>((
  ref,
) async {
  final schoolId = ref.watch(authStateProvider).account?.schoolId;
  if (schoolId == null) return [];
  final repo = ref.watch(adminRepositoryProvider);
  return repo.fetchClassrooms(schoolId: schoolId);
});
