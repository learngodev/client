import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment_models.freezed.dart';
part 'assignment_models.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum QuestionType { choice, judge, fill, essay }

extension QuestionTypeX on QuestionType {
  String get label {
    return switch (this) {
      QuestionType.choice => '选择题',
      QuestionType.judge => '判断题',
      QuestionType.fill => '填空题',
      QuestionType.essay => '简答题',
    };
  }
}

enum AssignmentType { homework, exam }

extension AssignmentTypeX on AssignmentType {
  String get label {
    return switch (this) {
      AssignmentType.homework => '作业',
      AssignmentType.exam => '考试',
    };
  }
}

@freezed
abstract class AssignmentQuestion with _$AssignmentQuestion {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AssignmentQuestion({
    @Default('') String id,
    @Default('') String prompt,
    required QuestionType type,
    @Default(0.0) double score,
    @JsonKey(fromJson: _parseOptions) @Default([]) List<String> options,
    @Default(0) int orderIndex,
    String? answer,
  }) = _AssignmentQuestion;

  factory AssignmentQuestion.fromJson(Map<String, dynamic> json) =>
      _$AssignmentQuestionFromJson(json);
}

List<String> _parseOptions(dynamic optionsJson) {
  if (optionsJson is List) {
    return optionsJson.map((e) => e.toString()).toList();
  } else if (optionsJson is String) {
    try {
      final decoded = jsonDecode(optionsJson);
      final options = decoded['options'];
      if (options is List) {
        return options.map((e) => e.toString()).toList();
      }
    } catch (_) {}
  }
  return [];
}

@freezed
abstract class AssignmentDetail with _$AssignmentDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AssignmentDetail({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @JsonKey(fromJson: _parseAndSortQuestions)
    @Default([])
    List<AssignmentQuestion> questions,
    @Default(0.0) double maxScore,
    @Default(AssignmentType.homework) AssignmentType type,
    @Default(false) bool allowResubmit,
    DateTime? dueAt,
    DateTime? startAt,
    @Default([]) List<AssignmentAttachment> attachments,
  }) = _AssignmentDetail;

  factory AssignmentDetail.fromJson(Map<String, dynamic> json) =>
      _$AssignmentDetailFromJson(json);
}

List<AssignmentQuestion> _parseAndSortQuestions(dynamic list) {
  if (list is! List) return [];
  final questions = list
      .map((e) => AssignmentQuestion.fromJson(e as Map<String, dynamic>))
      .toList();
  questions.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  return questions;
}

@freezed
abstract class AssignmentAttachment with _$AssignmentAttachment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AssignmentAttachment({
    @Default('') String id,
    @Default('') String name,
    @Default('') String url,
    @Default('') String type,
  }) = _AssignmentAttachment;

  factory AssignmentAttachment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentAttachmentFromJson(json);
}

@freezed
abstract class SubmissionResult with _$SubmissionResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SubmissionResult({
    @Default('') String id,
    double? score,
    @Default('') String status,
    required DateTime submittedAt,
    String? feedback,
  }) = _SubmissionResult;

  factory SubmissionResult.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResultFromJson(json);
}

@freezed
abstract class SubmissionItem with _$SubmissionItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SubmissionItem({
    @Default('') String id,
    @Default('') String questionId,
    @Default('') String answer,
    double? score,
  }) = _SubmissionItem;

  factory SubmissionItem.fromJson(Map<String, dynamic> json) =>
      _$SubmissionItemFromJson(json);
}

@freezed
abstract class StudentSubmissionDetail with _$StudentSubmissionDetail {
  const factory StudentSubmissionDetail({
    required AssignmentDetail assignment,
    required SubmissionResult submission,
    required List<SubmissionItem> items,
  }) = _StudentSubmissionDetail;
}

@freezed
abstract class ExplainQuestionResult with _$ExplainQuestionResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ExplainQuestionResult({
    @Default('') String analysis,
    @Default([]) List<String> steps,
    @Default([]) List<String> keyPoints,
    @Default([]) List<String> pitfalls,
    @Default([]) List<String> checklist,
  }) = _ExplainQuestionResult;

  factory ExplainQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$ExplainQuestionResultFromJson(json);
}

@freezed
abstract class GradeAssignmentResult with _$GradeAssignmentResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GradeAssignmentResult({
    @Default(0) int score,
    @Default('') String summary,
    @Default([]) List<String> suggestions,
    @Default([]) List<int> itemScores,
  }) = _GradeAssignmentResult;

  factory GradeAssignmentResult.fromJson(Map<String, dynamic> json) =>
      _$GradeAssignmentResultFromJson(json);
}
