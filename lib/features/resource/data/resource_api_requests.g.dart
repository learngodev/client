// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListTeacherResourcesPayload _$ListTeacherResourcesPayloadFromJson(
  Map<String, dynamic> json,
) => _ListTeacherResourcesPayload(
  page: (json['page'] as num?)?.toInt() ?? 1,
  size: (json['size'] as num?)?.toInt() ?? 20,
  departmentId: json['department_id'] as String?,
  gradeLevel: json['grade_level'] as String?,
  favoritedOnly: json['favorited_only'] as bool? ?? false,
);

Map<String, dynamic> _$ListTeacherResourcesPayloadToJson(
  _ListTeacherResourcesPayload instance,
) => <String, dynamic>{
  'page': instance.page,
  'size': instance.size,
  'department_id': instance.departmentId,
  'grade_level': instance.gradeLevel,
  'favorited_only': instance.favoritedOnly,
};

_BrowseResourcesPayload _$BrowseResourcesPayloadFromJson(
  Map<String, dynamic> json,
) => _BrowseResourcesPayload(
  page: (json['page'] as num?)?.toInt() ?? 1,
  size: (json['size'] as num?)?.toInt() ?? 20,
  query: json['query'] as String?,
  departmentId: json['department_id'] as String?,
  gradeLevel: json['grade_level'] as String?,
  fileType: json['file_type'] as String?,
  sort: json['sort'] as String? ?? 'latest',
  favoritedOnly: json['favorited_only'] as bool? ?? false,
  myResourcesOnly: json['my_resources_only'] as bool? ?? false,
);

Map<String, dynamic> _$BrowseResourcesPayloadToJson(
  _BrowseResourcesPayload instance,
) => <String, dynamic>{
  'page': instance.page,
  'size': instance.size,
  'query': instance.query,
  'department_id': instance.departmentId,
  'grade_level': instance.gradeLevel,
  'file_type': instance.fileType,
  'sort': instance.sort,
  'favorited_only': instance.favoritedOnly,
  'my_resources_only': instance.myResourcesOnly,
};

_ListFavoritesPayload _$ListFavoritesPayloadFromJson(
  Map<String, dynamic> json,
) => _ListFavoritesPayload(
  page: (json['page'] as num?)?.toInt() ?? 1,
  size: (json['size'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$ListFavoritesPayloadToJson(
  _ListFavoritesPayload instance,
) => <String, dynamic>{'page': instance.page, 'size': instance.size};

_AddFileToResourcePayload _$AddFileToResourcePayloadFromJson(
  Map<String, dynamic> json,
) => _AddFileToResourcePayload(fileId: json['file_id'] as String);

Map<String, dynamic> _$AddFileToResourcePayloadToJson(
  _AddFileToResourcePayload instance,
) => <String, dynamic>{'file_id': instance.fileId};
