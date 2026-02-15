import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../student/domain/assignment_models.dart';

part 'teacher_models.freezed.dart';
part 'teacher_models.g.dart';

@freezed
abstract class TeacherCourse with _$TeacherCourse {
  const factory TeacherCourse({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    String? imageUrl,
    String? invitationCode,
  }) = _TeacherCourse;

  factory TeacherCourse.fromJson(Map<String, dynamic> json) =>
      _$TeacherCourseFromJson(json);
}

@freezed
abstract class TeacherStudent with _$TeacherStudent {
  const factory TeacherStudent({
    @Default('') String id,
    @Default('Unknown') String name,
    @Default('') String number,
    @Default('') String email,
  }) = _TeacherStudent;

  factory TeacherStudent.fromJson(Map<String, dynamic> json) =>
      _$TeacherStudentFromJson(json);
}

@freezed
abstract class TeacherClass with _$TeacherClass {
  const factory TeacherClass({
    @Default('') String id,
    @Default('') String name,
    String? courseId,
    String? courseName,
  }) = _TeacherClass;

  factory TeacherClass.fromJson(Map<String, dynamic> json) =>
      _$TeacherClassFromJson(json);
}

@freezed
abstract class TeacherAssignment with _$TeacherAssignment {
  const factory TeacherAssignment({
    @Default('') String id,
    @Default('') String title,
    @Default('') String courseName,
    @Default('') String className,
    @Default(0) int submissionCount,
    @Default(0) int submittedCount,
    @Default(0) int gradedCount,
    @Default(0) int pendingGradeCount,
    DateTime? dueAt,
    @Default(0) int classStudentCount,
  }) = _TeacherAssignment;

  factory TeacherAssignment.fromJson(Map<String, dynamic> json) =>
      _$TeacherAssignmentFromJson(json);
}

@freezed
abstract class SubmissionSummary with _$SubmissionSummary {
  const factory SubmissionSummary({
    @Default('') String id,
    @Default('') String studentId,
    @Default('学生') String studentName,
    DateTime? submittedAt,
    @Default('pending') String status,
    double? score,
  }) = _SubmissionSummary;

  factory SubmissionSummary.fromJson(Map<String, dynamic> json) =>
      _$SubmissionSummaryFromJson(json);
}

@freezed
abstract class TeacherSubmissionDetail with _$TeacherSubmissionDetail {
  const factory TeacherSubmissionDetail({
    @JsonKey(fromJson: _parseSubmissionResult)
    required SubmissionResult submission,
    @Default([]) List<SubmissionItem> items,
    @Default([]) List<SubmissionComment> comments,
  }) = _TeacherSubmissionDetail;

  factory TeacherSubmissionDetail.fromJson(Map<String, dynamic> json) =>
      _$TeacherSubmissionDetailFromJson(json);
}

@freezed
abstract class SubmissionComment with _$SubmissionComment {
  const factory SubmissionComment({
    @Default('') String id,
    @Default('') String content,
    @Default('') String authorId,
    required DateTime createdAt,
  }) = _SubmissionComment;

  factory SubmissionComment.fromJson(Map<String, dynamic> json) =>
      _$SubmissionCommentFromJson(json);
}

SubmissionResult _parseSubmissionResult(dynamic value) {
  if (value is Map<String, dynamic>) {
    return SubmissionResult.fromJson(value);
  }
  if (value is Map) {
    return SubmissionResult.fromJson(value.cast<String, dynamic>());
  }
  return SubmissionResult.fromJson(const <String, dynamic>{});
}

Object? _commentToJson(String? comment) {
  if (comment == null) return null;
  return {'content': comment};
}

@freezed
abstract class GradeSubmissionRequest with _$GradeSubmissionRequest {
  @JsonSerializable(includeIfNull: false)
  const factory GradeSubmissionRequest({
    double? score,
    String? feedback,
    Map<String, double>? itemScores,
    @JsonKey(toJson: _commentToJson) String? comment,
  }) = _GradeSubmissionRequest;

  factory GradeSubmissionRequest.fromJson(Map<String, dynamic> json) =>
      _$GradeSubmissionRequestFromJson(json);
}

@freezed
abstract class CreateAssignmentRequest with _$CreateAssignmentRequest {
  @JsonSerializable(includeIfNull: false)
  const factory CreateAssignmentRequest({
    required String courseId,
    required String teacherId,
    required String classId,
    required String type,
    required String title,
    String? description,
    DateTime? startAt,
    DateTime? dueAt,
    double? maxScore,
    @Default(false) bool allowResubmit,
    required List<CreateAssignmentQuestionInput> questions,
    List<String>? attachments,
  }) = _CreateAssignmentRequest;

  factory CreateAssignmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssignmentRequestFromJson(json);
}

@freezed
abstract class UpdateAssignmentRequest with _$UpdateAssignmentRequest {
  @JsonSerializable(includeIfNull: false)
  const factory UpdateAssignmentRequest({
    required String teacherId,
    String? title,
    String? description,
    DateTime? startAt,
    DateTime? dueAt,
    double? maxScore,
    bool? allowResubmit,
  }) = _UpdateAssignmentRequest;

  factory UpdateAssignmentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssignmentRequestFromJson(json);
}

String? _parseOptions(dynamic value) {
  if (value is List) return jsonEncode(value);
  if (value is String) return value;
  return null;
}

@freezed
abstract class CreateAssignmentQuestionInput
    with _$CreateAssignmentQuestionInput {
  @JsonSerializable(includeIfNull: false)
  const factory CreateAssignmentQuestionInput({
    required String type,
    required String prompt,
    @JsonKey(fromJson: _parseOptions) String? options,
    String? answer,
    double? score,
    int? orderIndex,
  }) = _CreateAssignmentQuestionInput;

  factory CreateAssignmentQuestionInput.fromJson(Map<String, dynamic> json) =>
      _$CreateAssignmentQuestionInputFromJson(json);
}
