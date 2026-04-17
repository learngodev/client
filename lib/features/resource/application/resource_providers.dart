import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_go/features/resource/data/resource_repository.dart';
import 'package:learn_go/features/resource/domain/resource_models.dart';

// Teacher resource list provider
final teacherResourcesProvider = FutureProvider.autoDispose
    .family<ResourceListResult, TeacherResourcesParams>((ref, params) async {
  final repository = ref.watch(resourceRepositoryProvider);
  return repository.listTeacherResources(
    page: params.page,
    size: params.size,
    departmentId: params.departmentId,
    gradeLevel: params.gradeLevel,
    favoritedOnly: params.favoritedOnly,
  );
});

class TeacherResourcesParams {
  final int page;
  final int size;
  final String? departmentId;
  final String? gradeLevel;
  final bool favoritedOnly;

  TeacherResourcesParams({
    this.page = 1,
    this.size = 20,
    this.departmentId,
    this.gradeLevel,
    this.favoritedOnly = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherResourcesParams &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          size == other.size &&
          departmentId == other.departmentId &&
          gradeLevel == other.gradeLevel &&
          favoritedOnly == other.favoritedOnly;

  @override
  int get hashCode =>
      page.hashCode ^
      size.hashCode ^
      departmentId.hashCode ^
      gradeLevel.hashCode ^
      favoritedOnly.hashCode;
}

// Browse resources provider (with search and filters)
final browseResourcesProvider = FutureProvider.autoDispose
    .family<ResourceListResult, BrowseResourcesParams>((ref, params) async {
  final repository = ref.watch(resourceRepositoryProvider);
  return repository.browseResources(
    page: params.page,
    size: params.size,
    query: params.query,
    departmentId: params.departmentId,
    gradeLevel: params.gradeLevel,
    fileType: params.fileType,
    sort: params.sort,
    favoritedOnly: params.favoritedOnly,
    myResourcesOnly: params.myResourcesOnly,
  );
});

class BrowseResourcesParams {
  final int page;
  final int size;
  final String? query;
  final String? departmentId;
  final String? gradeLevel;
  final String? fileType;
  final String sort;
  final bool favoritedOnly;
  final bool myResourcesOnly;

  BrowseResourcesParams({
    this.page = 1,
    this.size = 20,
    this.query,
    this.departmentId,
    this.gradeLevel,
    this.fileType,
    this.sort = 'latest',
    this.favoritedOnly = false,
    this.myResourcesOnly = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrowseResourcesParams &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          size == other.size &&
          query == other.query &&
          departmentId == other.departmentId &&
          gradeLevel == other.gradeLevel &&
          fileType == other.fileType &&
          sort == other.sort &&
          favoritedOnly == other.favoritedOnly &&
          myResourcesOnly == other.myResourcesOnly;

  @override
  int get hashCode =>
      page.hashCode ^
      size.hashCode ^
      query.hashCode ^
      departmentId.hashCode ^
      gradeLevel.hashCode ^
      fileType.hashCode ^
      sort.hashCode ^
      favoritedOnly.hashCode ^
      myResourcesOnly.hashCode;
}

// Resource detail provider
final resourceDetailProvider = FutureProvider.autoDispose
    .family<ResourceDetail, String>((ref, resourceId) async {
  final repository = ref.watch(resourceRepositoryProvider);
  return repository.getResourceDetail(resourceId);
});

// Favorites list provider
final favoritesProvider = FutureProvider.autoDispose
    .family<ResourceListResult, PaginationParams>((ref, params) async {
  final repository = ref.watch(resourceRepositoryProvider);
  return repository.listFavorites(
    page: params.page,
    size: params.size,
  );
});

class PaginationParams {
  final int page;
  final int size;

  PaginationParams({
    this.page = 1,
    this.size = 20,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationParams &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          size == other.size;

  @override
  int get hashCode => page.hashCode ^ size.hashCode;
}

// Favorite toggle controller
class FavoriteController extends StateNotifier<AsyncValue<bool>> {
  final ResourceRepository _repository;
  final String resourceId;

  FavoriteController(this._repository, this.resourceId, bool initialState)
      : super(AsyncValue.data(initialState));

  Future<void> toggle() async {
    final currentState = state.value ?? false;

    // Optimistic update
    state = AsyncValue.data(!currentState);

    state = await AsyncValue.guard(() async {
      final result = await _repository.toggleFavorite(resourceId, currentState);
      return result;
    });
  }
}

final favoriteControllerProvider = StateNotifierProvider.autoDispose
    .family<FavoriteController, AsyncValue<bool>, FavoriteControllerParams>(
  (ref, params) {
    final repository = ref.watch(resourceRepositoryProvider);
    return FavoriteController(repository, params.resourceId, params.initialState);
  },
);

class FavoriteControllerParams {
  final String resourceId;
  final bool initialState;

  FavoriteControllerParams({
    required this.resourceId,
    required this.initialState,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteControllerParams &&
          runtimeType == other.runtimeType &&
          resourceId == other.resourceId &&
          initialState == other.initialState;

  @override
  int get hashCode => resourceId.hashCode ^ initialState.hashCode;
}
