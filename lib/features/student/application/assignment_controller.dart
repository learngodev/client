import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/student_repository.dart';
import '../domain/assignment_models.dart';

class AssignmentDetailController
    extends AutoDisposeFamilyAsyncNotifier<AssignmentDetail, String> {
  @override
  FutureOr<AssignmentDetail> build(String arg) async {
    final repository = ref.watch(studentRepositoryProvider);
    return repository.getAssignmentDetail(arg);
  }

  Future<void> submit(Map<String, dynamic> answers) async {
    final repository = ref.read(studentRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await repository.submitAssignment(arg, answers);
      return repository.getAssignmentDetail(arg);
    });
  }
}

final assignmentDetailControllerProvider = AsyncNotifierProvider.autoDispose
    .family<AssignmentDetailController, AssignmentDetail, String>(
      AssignmentDetailController.new,
    );
