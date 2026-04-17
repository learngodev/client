import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_go/core/network/base_request.dart';
import 'package:learn_go/features/resource/domain/resource_models.dart';

part 'resource_api_requests.freezed.dart';
part 'resource_api_requests.g.dart';

// Query Payloads

@freezed
abstract class ListTeacherResourcesPayload with _$ListTeacherResourcesPayload {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListTeacherResourcesPayload({
    @Default(1) int page,
    @Default(20) int size,
    String? departmentId,
    String? gradeLevel,
    @Default(false) bool favoritedOnly,
  }) = _ListTeacherResourcesPayload;

  factory ListTeacherResourcesPayload.fromJson(Map<String, dynamic> json) =>
      _$ListTeacherResourcesPayloadFromJson(json);
}

@freezed
abstract class BrowseResourcesPayload with _$BrowseResourcesPayload {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BrowseResourcesPayload({
    @Default(1) int page,
    @Default(20) int size,
    String? query,
    String? departmentId,
    String? gradeLevel,
    String? fileType,
    @Default('latest') String sort,
    @Default(false) bool favoritedOnly,
    @Default(false) bool myResourcesOnly,
  }) = _BrowseResourcesPayload;

  factory BrowseResourcesPayload.fromJson(Map<String, dynamic> json) =>
      _$BrowseResourcesPayloadFromJson(json);
}

@freezed
abstract class ListFavoritesPayload with _$ListFavoritesPayload {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListFavoritesPayload({
    @Default(1) int page,
    @Default(20) int size,
  }) = _ListFavoritesPayload;

  factory ListFavoritesPayload.fromJson(Map<String, dynamic> json) =>
      _$ListFavoritesPayloadFromJson(json);
}

@freezed
abstract class AddFileToResourcePayload with _$AddFileToResourcePayload {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AddFileToResourcePayload({
    required String fileId,
  }) = _AddFileToResourcePayload;

  factory AddFileToResourcePayload.fromJson(Map<String, dynamic> json) =>
      _$AddFileToResourcePayloadFromJson(json);
}

// Teacher API Requests

class CreateResourceRequest extends BaseRequest<CreateResourceParams, Resource> {
  CreateResourceRequest(CreateResourceParams params)
      : super(
          '/api/v1/teacher/resources',
          HttpMethod.post,
          fallbackMessage: '创建资源失败',
          requestEncoder: (value) => value.toRequestJson(),
          responseParser: (json) {
            final data = json['resource'] as Map<String, dynamic>;
            return Resource.fromJson(data);
          },
        );
}

class ListTeacherResourcesRequest
    extends BaseRequest<ListTeacherResourcesPayload, ResourceListResult> {
  ListTeacherResourcesRequest()
      : super(
          '/api/v1/teacher/resources',
          HttpMethod.get,
          queryParameters: (value) => value.toJson(),
          fallbackMessage: '获取资源列表失败',
          responseParser: (json) => ResourceListResult.fromJson(json),
        );
}

class GetTeacherResourceRequest
    extends BaseRequest<void, ResourceDetail> {
  GetTeacherResourceRequest(String resourceId)
      : super(
          '/api/v1/teacher/resources/$resourceId',
          HttpMethod.get,
          fallbackMessage: '获取资源详情失败',
          responseParser: (json) {
            final resource = Resource.fromJson(json['resource'] as Map<String, dynamic>);
            final files = (json['files'] as List<dynamic>?)
                    ?.map((e) => ResourceFile.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                [];
            return ResourceDetail(resource: resource, files: files);
          },
        );
}

class UpdateResourceRequest extends BaseRequest<UpdateResourceParams, Resource> {
  UpdateResourceRequest(String resourceId, UpdateResourceParams params)
      : super(
          '/api/v1/teacher/resources/$resourceId',
          HttpMethod.patch,
          fallbackMessage: '更新资源失败',
          requestEncoder: (value) => value.toRequestJson(),
          responseParser: (json) {
            final data = json['resource'] as Map<String, dynamic>;
            return Resource.fromJson(data);
          },
        );
}

class DeleteResourceRequest extends BaseRequest<void, void> {
  DeleteResourceRequest(String resourceId)
      : super(
          '/api/v1/teacher/resources/$resourceId',
          HttpMethod.delete,
          fallbackMessage: '删除资源失败',
        );
}

class AddFileToResourceRequest extends BaseRequest<AddFileToResourcePayload, void> {
  AddFileToResourceRequest(String resourceId)
      : super(
          '/api/v1/teacher/resources/$resourceId/files',
          HttpMethod.post,
          fallbackMessage: '添加文件失败',
          requestEncoder: (value) => value.toJson(),
        );
}

class RemoveFileFromResourceRequest extends BaseRequest<void, void> {
  RemoveFileFromResourceRequest(String resourceId, String fileId)
      : super(
          '/api/v1/teacher/resources/$resourceId/files/$fileId',
          HttpMethod.delete,
          fallbackMessage: '移除文件失败',
        );
}

// Student/Shared API Requests

class BrowseResourcesRequest
    extends BaseRequest<BrowseResourcesPayload, ResourceListResult> {
  BrowseResourcesRequest()
      : super(
          '/api/v1/resources',
          HttpMethod.get,
          queryParameters: (value) => value.toJson(),
          fallbackMessage: '浏览资源失败',
          responseParser: (json) => ResourceListResult.fromJson(json),
        );
}

class GetResourceDetailRequest extends BaseRequest<void, ResourceDetail> {
  GetResourceDetailRequest(String resourceId)
      : super(
          '/api/v1/resources/$resourceId',
          HttpMethod.get,
          fallbackMessage: '获取资源详情失败',
          responseParser: (json) {
            final resource = Resource.fromJson(json['resource'] as Map<String, dynamic>);
            final files = (json['files'] as List<dynamic>?)
                    ?.map((e) => ResourceFile.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                [];
            return ResourceDetail(resource: resource, files: files);
          },
        );
}

class ToggleFavoriteRequest extends BaseRequest<void, bool> {
  ToggleFavoriteRequest(String resourceId, bool currentlyFavorited)
      : super(
          '/api/v1/resources/$resourceId/favorite',
          currentlyFavorited ? HttpMethod.delete : HttpMethod.post,
          fallbackMessage: currentlyFavorited ? '取消收藏失败' : '收藏失败',
          responseParser: (json) => json['favorited'] as bool? ?? false,
        );
}

class ListFavoritesRequest
    extends BaseRequest<ListFavoritesPayload, ResourceListResult> {
  ListFavoritesRequest()
      : super(
          '/api/v1/resources/favorites',
          HttpMethod.get,
          queryParameters: (value) => value.toJson(),
          fallbackMessage: '获取收藏列表失败',
          responseParser: (json) => ResourceListResult.fromJson(json),
        );
}

class DownloadResourceFileRequest
    extends BaseRequest<void, Map<String, dynamic>> {
  DownloadResourceFileRequest(String resourceId, String fileId)
      : super(
          '/api/v1/resources/$resourceId/files/$fileId/download',
          HttpMethod.get,
          fallbackMessage: '获取下载链接失败',
          responseParser: (json) => json as Map<String, dynamic>,
        );
}
