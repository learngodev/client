import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../auth/application/auth_controller.dart';
import '../../application/classroom_providers.dart';
import '../../data/admin_repository.dart';
import '../../domain/classroom.dart';

class ClassroomManagementPage extends HookConsumerWidget {
  const ClassroomManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomsAsync = ref.watch(classroomsProvider);
    final searchController = useTextEditingController();
    final searchText = useState('');

    useEffect(() {
      void listener() {
        searchText.value = searchController.text;
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TextField(
          controller: searchController,
          decoration: const InputDecoration(
            labelText: '搜索教室',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        classroomsAsync.when(
          data: (classrooms) {
            final filteredClassrooms = classrooms.where((c) {
              return c.location.toLowerCase().contains(
                    searchText.value.toLowerCase(),
                  ) ||
                  c.id.toLowerCase().contains(searchText.value.toLowerCase());
            }).toList();

            if (filteredClassrooms.isEmpty) {
              return const Center(child: Text('暂无教室数据'));
            }

            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: SizedBox(
                width: double.infinity,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
                  border: TableBorder.all(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('地点')),
                    DataColumn(label: Text('操作')),
                  ],
                  rows: filteredClassrooms.map((classroom) {
                    return DataRow(
                      cells: [
                        DataCell(Text(classroom.id)),
                        DataCell(Text(classroom.location)),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showEditDialog(
                                  context,
                                  ref,
                                  classroom: classroom,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _confirmDelete(context, ref, classroom),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('加载失败: $err')),
        ),
      ],
    );
  }

  Future<void> _showEditDialog(
    BuildContext context,
    WidgetRef ref, {
    Classroom? classroom,
  }) async {
    final locationController = TextEditingController(
      text: classroom?.location ?? '',
    );
    final isEditing = classroom != null;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? '编辑教室' : '添加教室'),
        content: TextField(
          controller: locationController,
          decoration: const InputDecoration(labelText: '地点'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              final location = locationController.text.trim();
              if (location.isEmpty) return;

              final schoolId = ref.read(authStateProvider).account?.schoolId;
              if (schoolId == null) return;

              try {
                final repo = ref.read(adminRepositoryProvider);
                if (isEditing) {
                  await repo.updateClassroom(
                    id: classroom.id,
                    location: location,
                  );
                } else {
                  await repo.createClassroom(
                    schoolId: schoolId,
                    location: location,
                  );
                }
                ref.invalidate(classroomsProvider);
                if (context.mounted) Navigator.pop(context);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('操作失败: $e')));
                }
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Classroom classroom,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除教室 "${classroom.location}" 吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final repo = ref.read(adminRepositoryProvider);
        await repo.deleteClassroom(id: classroom.id);
        ref.invalidate(classroomsProvider);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('删除失败: $e')));
        }
      }
    }
  }
}
