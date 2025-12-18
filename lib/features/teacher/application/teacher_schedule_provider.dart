import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/teacher_repository.dart';
import '../domain/teacher_schedule_model.dart';
import '../domain/time_slot.dart';

final teacherTimeSlotsProvider = FutureProvider.autoDispose<List<TimeSlot>>((
  ref,
) async {
  final repository = ref.watch(teacherRepositoryProvider);
  return repository.listTimeSlots();
});

final teacherScheduleProvider = FutureProvider.autoDispose<List<TeacherScheduleItem>>((
  ref,
) async {
  final repository = ref.watch(teacherRepositoryProvider);

  final now = DateTime.now();
  // Find Monday of this week
  final monday = now.subtract(Duration(days: now.weekday - 1));
  // Set to beginning of day
  final start = DateTime(monday.year, monday.month, monday.day);

  // Find end of week (next Monday 00:00 is fine as exclusive end, or Sunday 23:59:59)
  // Backend likely uses inclusive or exclusive. Usually exclusive end is safer for date ranges.
  // Let's pass 7 days later.
  final end = start.add(const Duration(days: 7));

  return repository.listSchedule(start, end);
});

class TeacherScheduleController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> updateSession(
    String sessionId, {
    String? location,
    String? status,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(teacherRepositoryProvider)
          .updateSession(sessionId, location: location, status: status);
      ref.invalidate(teacherScheduleProvider);
    });
  }
}

final teacherScheduleControllerProvider =
    AsyncNotifierProvider.autoDispose<TeacherScheduleController, void>(
      TeacherScheduleController.new,
    );
