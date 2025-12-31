import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../auth/application/auth_controller.dart';
import '../../application/admin_providers.dart';
import '../../data/admin_repository.dart';
import '../../domain/accounts.dart';
import '../../domain/models.dart';

class AssignTeacherDialog extends HookConsumerWidget {
  const AssignTeacherDialog({
    super.key,
    required this.department,
    required this.classInfo,
  });

  final Department department;
  final ClassInfo classInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final query = useState('');
    final addedIds = useState<Set<String>>({});
    final removedIds = useState<Set<String>>({});
    final isSubmitting = useState(false);

    // Debounce search
    useEffect(() {
      void listener() {
        query.value = searchController.text;
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: AdminAccountRole.teacher,
      page: 1,
      pageSize: 50,
      query: query.value,
    );

    final accountsAsync = ref.watch(adminAccountListProvider(request));

    Future<void> submit() async {
      if (addedIds.value.isEmpty && removedIds.value.isEmpty) return;

      isSubmitting.value = true;
      try {
        final repository = ref.read(adminRepositoryProvider);

        // Handle additions
        if (addedIds.value.isNotEmpty) {
          await Future.wait(
            addedIds.value.map(
              (id) => repository.addTeacherToClass(
                schoolId: schoolId,
                classId: classInfo.id,
                accountId: id,
              ),
            ),
          );
        }

        // Handle removals
        if (removedIds.value.isNotEmpty) {
          await Future.wait(
            removedIds.value.map(
              (id) => repository.removeTeacherFromClass(
                schoolId: schoolId,
                classId: classInfo.id,
                accountId: id,
              ),
            ),
          );
        }

        if (context.mounted) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('已成功更新教师分配')));
          ref.invalidate(adminAccountListProvider);
          ref.invalidate(adminDepartmentTreeProvider);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('操作失败: $e')));
        }
      } finally {
        isSubmitting.value = false;
      }
    }

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '分配教师到 ${classInfo.name}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                '所属院系: ${department.name}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: '搜索教师',
                  hintText: '输入姓名或工号',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: accountsAsync.when(
                  data: (page) {
                    if (page.accounts.isEmpty) {
                      return const Center(child: Text('未找到匹配的教师'));
                    }
                    return ListView.builder(
                      itemCount: page.accounts.length,
                      itemBuilder: (context, index) {
                        final account = page.accounts[index];
                        final isInClass = account.classId == classInfo.id;
                        final isAdded = addedIds.value.contains(account.id);
                        final isRemoved = removedIds.value.contains(account.id);

                        final isChecked = (isInClass && !isRemoved) || isAdded;

                        return CheckboxListTile(
                          value: isChecked,
                          onChanged: (value) {
                            final newAdded = Set<String>.from(addedIds.value);
                            final newRemoved = Set<String>.from(
                              removedIds.value,
                            );

                            if (value == true) {
                              // Checking
                              if (isInClass) {
                                newRemoved.remove(
                                  account.id,
                                ); // Restore original state
                              } else {
                                newAdded.add(account.id); // Mark for addition
                              }
                            } else {
                              // Unchecking
                              if (isInClass) {
                                newRemoved.add(account.id); // Mark for removal
                              } else {
                                newAdded.remove(account.id); // Cancel addition
                              }
                            }
                            addedIds.value = newAdded;
                            removedIds.value = newRemoved;
                          },
                          title: Text(account.name),
                          subtitle: Text(
                            '${account.identifier} ${account.className != null ? '(${account.className})' : ''}',
                          ),
                          secondary: CircleAvatar(
                            child: Text(account.name.substring(0, 1)),
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('加载失败: $err')),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: isSubmitting.value
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: const Text('取消'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed:
                        isSubmitting.value ||
                            (addedIds.value.isEmpty && removedIds.value.isEmpty)
                        ? null
                        : submit,
                    child: isSubmitting.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            '保存 (${addedIds.value.length + removedIds.value.length})',
                          ),
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
