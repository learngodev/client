// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resource _$ResourceFromJson(Map<String, dynamic> json) => _Resource(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  departmentId: json['department_id'] as String?,
  departmentName: json['department_name'] as String? ?? '',
  gradeLevel: json['grade_level'] as String? ?? '',
  teacherId: json['teacher_id'] as String? ?? '',
  teacherName: json['teacher_name'] as String? ?? '',
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  fileCount: (json['file_count'] as num?)?.toInt() ?? 0,
  favoriteCount: (json['favorite_count'] as num?)?.toInt() ?? 0,
  viewCount: (json['view_count'] as num?)?.toInt() ?? 0,
  downloadCount: (json['download_count'] as num?)?.toInt() ?? 0,
  isFavorited: json['is_favorited'] as bool? ?? false,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ResourceToJson(_Resource instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'department_id': instance.departmentId,
  'department_name': instance.departmentName,
  'grade_level': instance.gradeLevel,
  'teacher_id': instance.teacherId,
  'teacher_name': instance.teacherName,
  'tags': instance.tags,
  'file_count': instance.fileCount,
  'favorite_count': instance.favoriteCount,
  'view_count': instance.viewCount,
  'download_count': instance.downloadCount,
  'is_favorited': instance.isFavorited,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_ResourceFile _$ResourceFileFromJson(Map<String, dynamic> json) =>
    _ResourceFile(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      fileType: json['file_type'] as String? ?? '',
      size: (json['size'] as num?)?.toInt() ?? 0,
      url: json['url'] as String? ?? '',
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
    );

Map<String, dynamic> _$ResourceFileToJson(_ResourceFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'file_type': instance.fileType,
      'size': instance.size,
      'url': instance.url,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
    };

_ResourceDetail _$ResourceDetailFromJson(Map<String, dynamic> json) =>
    _ResourceDetail(
      resource: Resource.fromJson(json['resource'] as Map<String, dynamic>),
      files:
          (json['files'] as List<dynamic>?)
              ?.map((e) => ResourceFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResourceDetailToJson(_ResourceDetail instance) =>
    <String, dynamic>{'resource': instance.resource, 'files': instance.files};

_ResourceListResult _$ResourceListResultFromJson(Map<String, dynamic> json) =>
    _ResourceListResult(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      size: (json['size'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$ResourceListResultToJson(_ResourceListResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'page': instance.page,
      'size': instance.size,
    };

_CreateResourceParams _$CreateResourceParamsFromJson(
  Map<String, dynamic> json,
) => _CreateResourceParams(
  title: json['title'] as String,
  description: json['description'] as String,
  departmentId: json['department_id'] as String?,
  gradeLevel: json['grade_level'] as String,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  fileIds:
      (json['file_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$CreateResourceParamsToJson(
  _CreateResourceParams instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'department_id': instance.departmentId,
  'grade_level': instance.gradeLevel,
  'tags': instance.tags,
  'file_ids': instance.fileIds,
};

_UpdateResourceParams _$UpdateResourceParamsFromJson(
  Map<String, dynamic> json,
) => _UpdateResourceParams(
  title: json['title'] as String?,
  description: json['description'] as String?,
  departmentId: json['department_id'] as String?,
  gradeLevel: json['grade_level'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$UpdateResourceParamsToJson(
  _UpdateResourceParams instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'department_id': instance.departmentId,
  'grade_level': instance.gradeLevel,
  'tags': instance.tags,
};
