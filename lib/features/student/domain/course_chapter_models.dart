import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_chapter_models.freezed.dart';
part 'course_chapter_models.g.dart';

@freezed
abstract class CourseChapterSummary with _$CourseChapterSummary {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CourseChapterSummary({
    @Default('') String id,
    @Default('') String courseId,
    @Default('') String teacherId,
    @Default('') String title,
    @Default(0) int orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseChapterSummary;

  factory CourseChapterSummary.fromJson(Map<String, dynamic> json) =>
      _$CourseChapterSummaryFromJson(json);
}

@freezed
abstract class CourseChapterAttachment with _$CourseChapterAttachment {
  const CourseChapterAttachment._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CourseChapterAttachment({
    @Default('') String id,
    @Default('') String name,
    @Default('application/octet-stream') String type,
    @Default(0) int size,
    @Default('') String relayUrl,
  }) = _CourseChapterAttachment;

  bool get isImage => type.toLowerCase().startsWith('image/');
  bool get isVideo => type.toLowerCase().startsWith('video/');

  factory CourseChapterAttachment.fromJson(Map<String, dynamic> json) =>
      _$CourseChapterAttachmentFromJson(json);
}

@freezed
abstract class CourseChapterDetail with _$CourseChapterDetail {
  const factory CourseChapterDetail({
    @Default('') String id,
    @Default('') String courseId,
    @Default('') String teacherId,
    @Default('') String title,
    @Default('') String content,
    @Default(0) int orderIndex,
    @Default([]) List<CourseChapterAttachment> attachments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseChapterDetail;

  factory CourseChapterDetail.fromJson(Map<String, dynamic> json) =>
      _$CourseChapterDetailFromJson(json);
}
