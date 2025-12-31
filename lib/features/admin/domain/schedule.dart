// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required String id,
    required String schoolId,
    required String name,
    required String startTime,
    required String endTime,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}

@freezed
abstract class CourseSchedule with _$CourseSchedule {
  const factory CourseSchedule({
    required String id,
    required String schoolId,
    required String courseId,
    required String classId,
    String? teacherId,
    required String slotId,
    String? classroomId,
    required int dayOfWeek,
    String? location,
    required DateTime startDate,
    required DateTime endDate,
    String? courseName,
    String? className,
    String? teacherName,
    String? slotName,
    String? classroomLocation,
  }) = _CourseSchedule;

  factory CourseSchedule.fromJson(Map<String, dynamic> json) =>
      _$CourseScheduleFromJson(json);
}

@freezed
abstract class ScheduleStats with _$ScheduleStats {
  const factory ScheduleStats({
    required int totalRules,
    required int totalCourses,
    required int scheduledCoursesCount,
    required int unscheduledCoursesCount,
    required Map<int, int> rulesByDay,
  }) = _ScheduleStats;

  factory ScheduleStats.fromJson(Map<String, dynamic> json) =>
      _$ScheduleStatsFromJson(json);
}
