import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/admin_repository.dart';
import '../domain/schedule.dart';

final timeSlotsProvider = FutureProvider.autoDispose
    .family<List<TimeSlot>, String>((ref, schoolId) {
      return ref
          .watch(adminRepositoryProvider)
          .listTimeSlots(schoolId: schoolId);
    });

final scheduleRulesProvider = FutureProvider.autoDispose
    .family<List<CourseSchedule>, String>((ref, schoolId) {
      return ref
          .watch(adminRepositoryProvider)
          .listScheduleRules(schoolId: schoolId);
    });

final scheduleStatsProvider = FutureProvider.autoDispose
    .family<ScheduleStats, String>((ref, schoolId) {
      return ref
          .watch(adminRepositoryProvider)
          .getScheduleStats(schoolId: schoolId);
    });

class ScheduleController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> createTimeSlot({
    required String schoolId,
    required String name,
    required String startTime,
    required String endTime,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(adminRepositoryProvider)
          .createTimeSlot(
            schoolId: schoolId,
            name: name,
            startTime: startTime,
            endTime: endTime,
          );
      ref.invalidate(timeSlotsProvider(schoolId));
    });
  }

  Future<void> updateTimeSlot({
    required String schoolId,
    required String id,
    required String name,
    required String startTime,
    required String endTime,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(adminRepositoryProvider)
          .updateTimeSlot(
            id: id,
            name: name,
            startTime: startTime,
            endTime: endTime,
          );
      ref.invalidate(timeSlotsProvider(schoolId));
    });
  }

  Future<void> deleteTimeSlot({
    required String schoolId,
    required String id,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(adminRepositoryProvider).deleteTimeSlot(id: id);
      ref.invalidate(timeSlotsProvider(schoolId));
    });
  }

  Future<void> createScheduleRule({
    required String schoolId,
    required String courseId,
    required String classId,
    String? teacherId,
    required String slotId,
    required int dayOfWeek,
    required String location,
    String? classroomId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(adminRepositoryProvider)
          .createScheduleRule(
            schoolId: schoolId,
            courseId: courseId,
            classId: classId,
            teacherId: teacherId,
            slotId: slotId,
            dayOfWeek: dayOfWeek,
            location: location,
            classroomId: classroomId,
            startDate: startDate,
            endDate: endDate,
          );
      ref.invalidate(scheduleRulesProvider(schoolId));
      ref.invalidate(scheduleStatsProvider(schoolId));
    });
  }

  Future<void> deleteScheduleRule({
    required String schoolId,
    required String ruleId,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(adminRepositoryProvider)
          .deleteScheduleRule(schoolId: schoolId, ruleId: ruleId);
      ref.invalidate(scheduleRulesProvider(schoolId));
      ref.invalidate(scheduleStatsProvider(schoolId));
    });
  }

  Future<void> generateSessions({
    required String schoolId,
    required DateTime start,
    required DateTime end,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(adminRepositoryProvider)
          .generateSessions(schoolId: schoolId, start: start, end: end);
    });
  }
}

final scheduleControllerProvider =
    AsyncNotifierProvider.autoDispose<ScheduleController, void>(
      ScheduleController.new,
    );
