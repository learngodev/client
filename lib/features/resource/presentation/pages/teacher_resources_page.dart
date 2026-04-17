import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/resource_providers.dart';
import '../../domain/resource_models.dart';
import '../../../auth/application/auth_controller.dart';

class TeacherResourcesPage extends HookConsumerWidget {
  const TeacherResourcesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFavoritesOnly = useState(false);
    final showMyResourcesOnly = useState(false);
    final sortBy = useState('latest');

    final authState = ref.watch(authStateProvider);
    final myId = authState.account?.id;

    // Use browse provider to get all resources, with backend filtering
    final browseParams = BrowseResourcesParams(
      page: 1,
      size: 100,
      sort: sortBy.value,
      favoritedOnly: showFavoritesOnly.value,
      myResourcesOnly: showMyResourcesOnly.value,
    );
    final resourcesAsync = ref.watch(browseResourcesProvider(browseParams));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: resourcesAsync.when(
        data: (result) {
          final resources = result.items;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('教学资源'),
                centerTitle: true,
                pinned: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      await context.push('/teacher/resources/create');
                      // Refresh data when returning
                      ref.invalidate(browseResourcesProvider);
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: '搜索资源',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Filters
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilterChip(
                            label: const Text('仅收藏'),
                            selected: showFavoritesOnly.value,
                            onSelected: (selected) {
                              showFavoritesOnly.value = selected;
                            },
                            avatar: Icon(
                              showFavoritesOnly.value ? Icons.favorite : Icons.favorite_border,
                              size: 18,
                            ),
                          ),
                          FilterChip(
                            label: const Text('我的资源'),
                            selected: showMyResourcesOnly.value,
                            onSelected: (selected) {
                              showMyResourcesOnly.value = selected;
                            },
                            avatar: Icon(
                              showMyResourcesOnly.value ? Icons.person : Icons.person_outline,
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
                              selected: sortBy.value == 'latest',
                              onSelected: (selected) {
                                if (selected) sortBy.value = 'latest';
                              },
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('最热门'),
                              selected: sortBy.value == 'popular',
                              onSelected: (selected) {
                                if (selected) sortBy.value = 'popular';
                              },
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('下载最多'),
                              selected: sortBy.value == 'downloads',
                              onSelected: (selected) {
                                if (selected) sortBy.value = 'downloads';
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 24),
                    ],
                  ),
                ),
              ),
              if (resources.isEmpty)
                const SliverFillRemaining(child: Center(child: Text('暂无资源')))
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final resource = resources[index];
                    return _ResourceCard(resource: resource);
                  }, childCount: resources.length),
                ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}

class _ResourceCard extends StatelessWidget {
  final Resource resource;

  const _ResourceCard({required this.resource});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          context.push('/teacher/resources/${resource.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      resource.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (resource.fileCount > 0)
                    Chip(
                      label: Text('${resource.fileCount} 个文件'),
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
              if (resource.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  resource.description,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (resource.departmentName.isNotEmpty)
                    Chip(
                      label: Text(resource.departmentName),
                      visualDensity: VisualDensity.compact,
                    ),
                  if (resource.gradeLevel.isNotEmpty)
                    Chip(
                      label: Text(resource.gradeLevel),
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.person_outline,
                      size: 16, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(resource.teacherName,
                      style: theme.textTheme.bodySmall),
                  const SizedBox(width: 16),
                  Icon(Icons.visibility_outlined,
                      size: 16, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text('${resource.viewCount}',
                      style: theme.textTheme.bodySmall),
                  const SizedBox(width: 16),
                  Icon(Icons.download_outlined,
                      size: 16, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text('${resource.downloadCount}',
                      style: theme.textTheme.bodySmall),
                  const SizedBox(width: 16),
                  Icon(Icons.favorite_outline,
                      size: 16, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text('${resource.favoriteCount}',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
