import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_go/core/network/api_client.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/resource/data/resource_api_requests.dart';
import 'package:learn_go/features/resource/domain/resource_models.dart';

final resourceRepositoryProvider = Provider<ResourceRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ResourceRepository(ApiClient(dio));
});

class ResourceRepository {
  final ApiClient _client;

  ResourceRepository(this._client);

  // Teacher methods
  Future<Resource> createResource(CreateResourceParams params) async {
    return await _client.execute(
      CreateResourceRequest(params),
      payload: params,
    );
  }

  Future<ResourceListResult> listTeacherResources({
    int page = 1,
    int size = 20,
    String? departmentId,
    String? gradeLevel,
    bool favoritedOnly = false,
  }) async {
    return await _client.execute(
      ListTeacherResourcesRequest(),
      payload: ListTeacherResourcesPayload(
        page: page,
        size: size,
        departmentId: departmentId,
        gradeLevel: gradeLevel,
        favoritedOnly: favoritedOnly,
      ),
    );
  }

  Future<ResourceDetail> getTeacherResource(String resourceId) async {
    return await _client.execute(GetTeacherResourceRequest(resourceId));
  }

  Future<Resource> updateResource(
    String resourceId,
    UpdateResourceParams params,
  ) async {
    return await _client.execute(
      UpdateResourceRequest(resourceId, params),
      payload: params,
    );
  }

  Future<void> deleteResource(String resourceId) async {
    await _client.execute(DeleteResourceRequest(resourceId));
  }

  Future<void> addFileToResource(String resourceId, String fileId) async {
    await _client.execute(
      AddFileToResourceRequest(resourceId),
      payload: AddFileToResourcePayload(fileId: fileId),
    );
  }

  Future<void> removeFileFromResource(String resourceId, String fileId) async {
    await _client.execute(RemoveFileFromResourceRequest(resourceId, fileId));
  }

  // Student/Shared methods
  Future<ResourceListResult> browseResources({
    int page = 1,
    int size = 20,
    String? query,
    String? departmentId,
    String? gradeLevel,
    String? fileType,
    String sort = 'latest',
    bool favoritedOnly = false,
    bool myResourcesOnly = false,
  }) async {
    return await _client.execute(
      BrowseResourcesRequest(),
      payload: BrowseResourcesPayload(
        page: page,
        size: size,
        query: query,
        departmentId: departmentId,
        gradeLevel: gradeLevel,
        fileType: fileType,
        sort: sort,
        favoritedOnly: favoritedOnly,
        myResourcesOnly: myResourcesOnly,
      ),
    );
  }

  Future<ResourceDetail> getResourceDetail(String resourceId) async {
    return await _client.execute(GetResourceDetailRequest(resourceId));
  }

  Future<bool> toggleFavorite(
    String resourceId,
    bool currentlyFavorited,
  ) async {
    return await _client.execute(
      ToggleFavoriteRequest(resourceId, currentlyFavorited),
    );
  }

  Future<ResourceListResult> listFavorites({
    int page = 1,
    int size = 20,
  }) async {
    return await _client.execute(
      ListFavoritesRequest(),
      payload: ListFavoritesPayload(page: page, size: size),
    );
  }

  Future<Map<String, dynamic>> getDownloadInfo(
    String resourceId,
    String fileId,
  ) async {
    return await _client.execute(
      DownloadResourceFileRequest(resourceId, fileId),
    );
  }
}
