// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required String id,
    @JsonKey(name: 'school_id') required String schoolId,
    required String name,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}

@freezed
abstract class CourseSchedule with _$CourseSchedule {
  const factory CourseSchedule({
    required String id,
    @JsonKey(name: 'school_id') required String schoolId,
    @JsonKey(name: 'course_id') required String courseId,
    @JsonKey(name: 'class_id') required String classId,
    @JsonKey(name: 'teacher_id') required String teacherId,
    @JsonKey(name: 'slot_id') required String slotId,
    @JsonKey(name: 'day_of_week') required int dayOfWeek,
    String? location,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
  }) = _CourseSchedule;

  factory CourseSchedule.fromJson(Map<String, dynamic> json) =>
      _$CourseScheduleFromJson(json);
}
