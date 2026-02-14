import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'teacher_schedule_model.freezed.dart';
part 'teacher_schedule_model.g.dart';

@freezed
abstract class TeacherScheduleItem with _$TeacherScheduleItem {
  const TeacherScheduleItem._();

  const factory TeacherScheduleItem({
    @Default('') String sessionId,
    @Default('') String courseId,
    @Default('') String courseName,
    @Default('') String classId,
    @Default('') String className,
    @JsonKey(fromJson: _parseDateTimeOrNow) required DateTime startsAt,
    @JsonKey(fromJson: _parseDateTimeOrNow) required DateTime endsAt,
    @Default('') String day,
    @Default('') String slotId,
    @Default('') String slotName,
    @Default('') String location,
    @Default('') String source,
  }) = _TeacherScheduleItem;

  factory TeacherScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$TeacherScheduleItemFromJson(json);

  int get weekDay => startsAt.weekday;

  String get timeRange {
    final start = DateFormat('HH:mm').format(startsAt);
    final end = DateFormat('HH:mm').format(endsAt);
    return '$start - $end';
  }

  String get startTimeStr => DateFormat('HH:mm').format(startsAt);

  bool get isOnline =>
      location.contains('线上') ||
      location.toLowerCase().contains('online') ||
      location.contains('腾讯会议');
}

DateTime _parseDateTimeOrNow(dynamic value) {
  if (value is DateTime) return value.toLocal();
  if (value is String && value.isNotEmpty) {
    return DateTime.tryParse(value)?.toLocal() ?? DateTime.now();
  }
  return DateTime.now();
}
