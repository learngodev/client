import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

List<Teacher> _parseTeachers(dynamic value) {
  if (value is List) {
    return value
        .whereType<Map<String, dynamic>>()
        .map((e) => Teacher.fromJson(e))
        .toList();
  }
  return [];
}

@freezed
abstract class Course with _$Course {
  const Course._();

  const factory Course({
    @Default('') String id,
    @Default('') String schoolId,
    @Default('') String name,
    @Default('') String description,
    @JsonKey(fromJson: _parseTeachers) @Default([]) List<Teacher> teachers,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
abstract class Teacher with _$Teacher {
  const factory Teacher({@Default('') String id, @Default('') String name}) =
      _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}

@freezed
abstract class CourseAssignmentInfo with _$CourseAssignmentInfo {
  const factory CourseAssignmentInfo({
    @Default('') String courseId,
    @Default('') String courseName,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default('') String teacherId,
    @Default('') String teacherName,
    @Default('') String classId,
    @Default('') String className,
    @Default(0) int studentCount,
  }) = _CourseAssignmentInfo;

  factory CourseAssignmentInfo.fromJson(Map<String, dynamic> json) =>
      _$CourseAssignmentInfoFromJson(json);
}
