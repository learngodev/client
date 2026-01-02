class CourseChapterSummary {
  const CourseChapterSummary({
    required this.id,
    required this.courseId,
    required this.teacherId,
    required this.title,
    required this.orderIndex,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String courseId;
  final String teacherId;
  final String title;
  final int orderIndex;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CourseChapterSummary.fromJson(Map<String, dynamic> json) {
    return CourseChapterSummary(
      id: json['id']?.toString() ?? '',
      courseId: json['course_id']?.toString() ?? '',
      teacherId: json['teacher_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      createdAt: _parseDateTime(json['created_at']),
      updatedAt: _parseDateTime(json['updated_at']),
    );
  }
}

class CourseChapterAttachment {
  const CourseChapterAttachment({
    required this.id,
    required this.name,
    required this.type,
    required this.size,
    required this.relayUrl,
  });

  final String id;
  final String name;
  final String type;
  final int size;
  final String relayUrl;

  bool get isImage => type.toLowerCase().startsWith('image/');
  bool get isVideo => type.toLowerCase().startsWith('video/');

  factory CourseChapterAttachment.fromJson(Map<String, dynamic> json) {
    return CourseChapterAttachment(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      type: json['type']?.toString() ?? 'application/octet-stream',
      size: (json['size'] as num?)?.toInt() ?? 0,
      relayUrl: json['relay_url']?.toString() ?? '',
    );
  }
}

class CourseChapterDetail {
  const CourseChapterDetail({
    required this.id,
    required this.courseId,
    required this.teacherId,
    required this.title,
    required this.content,
    required this.orderIndex,
    required this.attachments,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String courseId;
  final String teacherId;
  final String title;
  final String content;
  final int orderIndex;
  final List<CourseChapterAttachment> attachments;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CourseChapterDetail.fromJson(Map<String, dynamic> json) {
    final chapter =
        (json['chapter'] as Map?)?.cast<String, dynamic>() ?? const {};
    final attachmentsRaw = json['attachments'] as List?;
    return CourseChapterDetail(
      id: chapter['id']?.toString() ?? '',
      courseId: chapter['course_id']?.toString() ?? '',
      teacherId: chapter['teacher_id']?.toString() ?? '',
      title: chapter['title']?.toString() ?? '',
      content: chapter['content']?.toString() ?? '',
      orderIndex: (chapter['order_index'] as num?)?.toInt() ?? 0,
      createdAt: _parseDateTime(chapter['created_at']),
      updatedAt: _parseDateTime(chapter['updated_at']),
      attachments:
          attachmentsRaw
              ?.whereType<Map>()
              .map(
                (e) =>
                    CourseChapterAttachment.fromJson(e.cast<String, dynamic>()),
              )
              .toList(growable: false) ??
          const [],
    );
  }
}

DateTime? _parseDateTime(dynamic raw) {
  if (raw == null) return null;
  if (raw is DateTime) return raw;
  if (raw is String) {
    return DateTime.tryParse(raw);
  }
  return null;
}
