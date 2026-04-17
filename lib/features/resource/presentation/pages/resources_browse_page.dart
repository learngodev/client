import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go/features/resource/application/resource_providers.dart';
import 'package:learn_go/features/resource/domain/resource_models.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';

class ResourcesBrowsePage extends ConsumerStatefulWidget {
  const ResourcesBrowsePage({super.key});

  @override
  ConsumerState<ResourcesBrowsePage> createState() =>
      _ResourcesBrowsePageState();
}

class _ResourcesBrowsePageState extends ConsumerState<ResourcesBrowsePage> {
  final _searchController = TextEditingController();
  String? _selectedDepartment;
  String? _selectedGrade;
  String _sortBy = 'latest';
  int _currentPage = 1;
  bool _showFavoritesOnly = false;
  bool _showMyResourcesOnly = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _refresh() {
    setState(() {
      _currentPage = 1;
    });
    // Also invalidate the provider to force refresh
    ref.invalidate(browseResourcesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isTeacher = authState.account?.role.name == 'teacher';
    final myId = authState.account?.id;

    final params = BrowseResourcesParams(
      page: _currentPage,
      size: 20,
      query: _searchController.text.isEmpty ? null : _searchController.text,
      departmentId: _selectedDepartment,
      gradeLevel: _selectedGrade,
      sort: _sortBy,
      favoritedOnly: _showFavoritesOnly,
      myResourcesOnly: _showMyResourcesOnly,
    );

    final resourcesAsync = ref.watch(browseResourcesProvider(params));

    return Scaffold(
      appBar: AppBar(title: const Text('教学资源')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索资源...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _refresh();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => _refresh(),
            ),
          ),

          // Filter section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quick filters
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    FilterChip(
                      label: const Text('仅收藏'),
                      selected: _showFavoritesOnly,
                      onSelected: (selected) {
                        setState(() => _showFavoritesOnly = selected);
                        _refresh();
                      },
                      avatar: Icon(
                        _showFavoritesOnly
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 18,
                      ),
                    ),
                    if (isTeacher)
                      FilterChip(
                        label: const Text('我的资源'),
                        selected: _showMyResourcesOnly,
                        onSelected: (selected) {
                          setState(() => _showMyResourcesOnly = selected);
                          _refresh();
                        },
                        avatar: Icon(
                          _showMyResourcesOnly
                              ? Icons.person
                              : Icons.person_outline,
                          size: 18,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                // Sort chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChoiceChip(
                        label: const Text('最新'),
                        selected: _sortBy == 'latest',
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _sortBy = 'latest');
                            _refresh();
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: const Text('最热门'),
                        selected: _sortBy == 'popular',
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _sortBy = 'popular');
                            _refresh();
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: const Text('下载最多'),
                        selected: _sortBy == 'downloads',
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _sortBy = 'downloads');
                            _refresh();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(height: 24),
              ],
            ),
          ),

          // Resource list
          Expanded(
            child: resourcesAsync.when(
              data: (result) {
                if (result.items.isEmpty) {
                  return const Center(child: Text('暂无资源'));
                }

                return RefreshIndicator(
                  onRefresh: () async => _refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: result.items.length,
                    itemBuilder: (context, index) {
                      final resource = result.items[index];
                      return _ResourceCard(resource: resource);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('加载失败: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refresh,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResourceCard extends ConsumerWidget {
  final Resource resource;

  const _ResourceCard({required this.resource});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push('/student/resources/${resource.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resource.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (resource.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  resource.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (resource.gradeLevel.isNotEmpty)
                    Chip(
                      label: Text(resource.gradeLevel),
                      visualDensity: VisualDensity.compact,
                    ),
                  ...resource.tags.map(
                    (tag) => Chip(
                      label: Text(tag),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    resource.teacherName,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    '${resource.viewCount}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.download, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    '${resource.downloadCount}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.attach_file, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    '${resource.fileCount}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
