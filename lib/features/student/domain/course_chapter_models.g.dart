// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_chapter_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseChapterSummary _$CourseChapterSummaryFromJson(
  Map<String, dynamic> json,
) => _CourseChapterSummary(
  id: json['id'] as String? ?? '',
  courseId: json['course_id'] as String? ?? '',
  teacherId: json['teacher_id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CourseChapterSummaryToJson(
  _CourseChapterSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'course_id': instance.courseId,
  'teacher_id': instance.teacherId,
  'title': instance.title,
  'order_index': instance.orderIndex,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_CourseChapterAttachment _$CourseChapterAttachmentFromJson(
  Map<String, dynamic> json,
) => _CourseChapterAttachment(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  type: json['type'] as String? ?? 'application/octet-stream',
  size: (json['size'] as num?)?.toInt() ?? 0,
  relayUrl: json['relay_url'] as String? ?? '',
);

Map<String, dynamic> _$CourseChapterAttachmentToJson(
  _CourseChapterAttachment instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'size': instance.size,
  'relay_url': instance.relayUrl,
};

_CourseChapterDetail _$CourseChapterDetailFromJson(Map<String, dynamic> json) =>
    _CourseChapterDetail(
      id: json['id'] as String? ?? '',
      courseId: json['course_id'] as String? ?? '',
      teacherId: json['teacher_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map(
                (e) =>
                    CourseChapterAttachment.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CourseChapterDetailToJson(
  _CourseChapterDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'course_id': instance.courseId,
  'teacher_id': instance.teacherId,
  'title': instance.title,
  'content': instance.content,
  'order_index': instance.orderIndex,
  'attachments': instance.attachments,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
