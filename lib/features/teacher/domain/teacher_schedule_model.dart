import 'package:intl/intl.dart';

class TeacherScheduleItem {
  const TeacherScheduleItem({
    required this.sessionId,
    required this.courseId,
    required this.courseName,
    required this.classId,
    required this.className,
    required this.startsAt,
    required this.endsAt,
    required this.day,
    required this.slotId,
    required this.slotName,
    required this.location,
    required this.source,
  });

  final String sessionId;
  final String courseId;
  final String courseName;
  final String classId;
  final String className;
  final DateTime startsAt;
  final DateTime endsAt;
  final String day;
  final String slotId;
  final String slotName;
  final String location;
  final String source;

  factory TeacherScheduleItem.fromJson(Map<String, dynamic> json) {
    return TeacherScheduleItem(
      sessionId: json['session_id'] as String? ?? '',
      courseId: json['course_id'] as String? ?? '',
      courseName: json['course_name'] as String? ?? '',
      classId: json['class_id'] as String? ?? '',
      className: json['class_name'] as String? ?? '',
      startsAt:
          DateTime.tryParse(json['starts_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
      endsAt:
          DateTime.tryParse(json['ends_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
      day: json['day'] as String? ?? '',
      slotId: json['slot_id'] as String? ?? '',
      slotName: json['slot_name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      source: json['source'] as String? ?? '',
    );
  }

  // Helpers for UI
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
