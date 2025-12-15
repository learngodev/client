import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/admin_repository.dart';
import '../domain/schedule.dart';

final timeSlotsProvider = FutureProvider.family<List<TimeSlot>, String>((
  ref,
  schoolId,
) {
  return ref.watch(adminRepositoryProvider).listTimeSlots(schoolId: schoolId);
});

class ScheduleController extends StateNotifier<AsyncValue<void>> {
  ScheduleController(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> createTimeSlot({
    required String schoolId,
    required String name,
    required String startTime,
    required String endTime,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref
          .read(adminRepositoryProvider)
          .createTimeSlot(
            schoolId: schoolId,
            name: name,
            startTime: startTime,
            endTime: endTime,
          );
      _ref.invalidate(timeSlotsProvider(schoolId));
    });
  }

  Future<void> createScheduleRule({
    required String schoolId,
    required String courseId,
    required String classId,
    required String teacherId,
    required String slotId,
    required int dayOfWeek,
    required String location,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref
          .read(adminRepositoryProvider)
          .createScheduleRule(
            schoolId: schoolId,
            courseId: courseId,
            classId: classId,
            teacherId: teacherId,
            slotId: slotId,
            dayOfWeek: dayOfWeek,
            location: location,
            startDate: startDate,
            endDate: endDate,
          );
    });
  }

  Future<void> generateSessions({
    required String schoolId,
    required DateTime start,
    required DateTime end,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref
          .read(adminRepositoryProvider)
          .generateSessions(schoolId: schoolId, start: start, end: end);
    });
  }
}

final scheduleControllerProvider =
    StateNotifierProvider<ScheduleController, AsyncValue<void>>((ref) {
      return ScheduleController(ref);
    });
