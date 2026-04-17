import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_models.freezed.dart';
part 'resource_models.g.dart';

@freezed
abstract class Resource with _$Resource {
  const factory Resource({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    String? departmentId,
    @Default('') String departmentName,
    @Default('') String gradeLevel,
    @Default('') String teacherId,
    @Default('') String teacherName,
    @Default([]) List<String> tags,
    @Default(0) int fileCount,
    @Default(0) int favoriteCount,
    @Default(0) int viewCount,
    @Default(0) int downloadCount,
    @Default(false) bool isFavorited,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

@freezed
abstract class ResourceFile with _$ResourceFile {
  const factory ResourceFile({
    @Default('') String id,
    @Default('') String name,
    @Default('') String fileType,
    @Default(0) int size,
    @Default('') String url,
    DateTime? uploadedAt,
  }) = _ResourceFile;

  factory ResourceFile.fromJson(Map<String, dynamic> json) =>
      _$ResourceFileFromJson(json);
}

@freezed
abstract class ResourceDetail with _$ResourceDetail {
  const factory ResourceDetail({
    required Resource resource,
    @Default([]) List<ResourceFile> files,
  }) = _ResourceDetail;

  factory ResourceDetail.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailFromJson(json);
}

@freezed
abstract class ResourceListResult with _$ResourceListResult {
  const factory ResourceListResult({
    @Default([]) List<Resource> items,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int size,
  }) = _ResourceListResult;

  factory ResourceListResult.fromJson(Map<String, dynamic> json) =>
      _$ResourceListResultFromJson(json);
}

@freezed
abstract class CreateResourceParams with _$CreateResourceParams {
  const factory CreateResourceParams({
    required String title,
    required String description,
    String? departmentId,
    required String gradeLevel,
    @Default([]) List<String> tags,
    @Default([]) List<String> fileIds,
  }) = _CreateResourceParams;

  factory CreateResourceParams.fromJson(Map<String, dynamic> json) =>
      _$CreateResourceParamsFromJson(json);
}

extension CreateResourceParamsX on CreateResourceParams {
  Map<String, dynamic> toRequestJson() => {
        'title': title,
        'description': description,
        if (departmentId != null && departmentId!.isNotEmpty)
          'department_id': departmentId,
        'grade_level': gradeLevel,
        if (tags.isNotEmpty) 'tags': tags,
        if (fileIds.isNotEmpty) 'file_ids': fileIds,
      };
}

@freezed
abstract class UpdateResourceParams with _$UpdateResourceParams {
  const factory UpdateResourceParams({
    String? title,
    String? description,
    String? departmentId,
    String? gradeLevel,
    List<String>? tags,
  }) = _UpdateResourceParams;

  factory UpdateResourceParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateResourceParamsFromJson(json);
}

extension UpdateResourceParamsX on UpdateResourceParams {
  Map<String, dynamic> toRequestJson() => {
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (departmentId != null) 'department_id': departmentId,
        if (gradeLevel != null) 'grade_level': gradeLevel,
        if (tags != null) 'tags': tags,
      };
}
