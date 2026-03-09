import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/admin_providers.dart';
import '../../data/admin_repository.dart';
import '../../domain/accounts.dart';
import '../../domain/models.dart';
import '../../../auth/application/auth_controller.dart';
import '../widgets/assign_student_dialog.dart';

class ClassDetailPage extends ConsumerStatefulWidget {
  const ClassDetailPage({
    super.key,
    required this.department,
    required this.classInfo,
  });

  final Department department;
  final ClassInfo classInfo;

  @override
  ConsumerState<ClassDetailPage> createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends ConsumerState<ClassDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.classInfo.name),
            Text(
              widget.department.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '学生列表'),
            Tab(text: '教师列表'),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          if (_tabController.index == 0) {
            return FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AssignStudentDialog(
                    department: widget.department,
                    classInfo: widget.classInfo,
                  ),
                );
              },
              icon: const Icon(Icons.person_add),
              label: const Text('分配学生'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ClassAccountList(
            classInfo: widget.classInfo,
            role: AdminAccountRole.student,
          ),
          _ClassAccountList(
            classInfo: widget.classInfo,
            role: AdminAccountRole.teacher,
          ),
        ],
      ),
    );
  }
}

class _ClassAccountList extends ConsumerStatefulWidget {
  const _ClassAccountList({required this.classInfo, required this.role});

  final ClassInfo classInfo;
  final AdminAccountRole role;

  @override
  ConsumerState<_ClassAccountList> createState() => _ClassAccountListState();
}

class _ClassAccountListState extends ConsumerState<_ClassAccountList> {
  final Set<String> _processingIds = <String>{};

  Future<void> _removeFromClass({
    required BuildContext context,
    required AdminAccount account,
    required String schoolId,
  }) async {
    if (widget.role != AdminAccountRole.student) return;
    if (_processingIds.contains(account.id)) return;

    setState(() {
      _processingIds.add(account.id);
    });

    try {
      final repository = ref.read(adminRepositoryProvider);

      await repository.updateAccountStructure(
        schoolId: schoolId,
        accountId: account.id,
        departmentId: '',
        classId: '',
      );

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('已取消学生分配')));

      ref.invalidate(adminAccountListProvider);
      ref.invalidate(adminDepartmentTreeProvider);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('操作失败: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _processingIds.remove(account.id);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: widget.role,
      classId: widget.classInfo.id,
      page: 1,
      pageSize: 100,
    );

    final accountsAsync = ref.watch(adminAccountListProvider(request));

    return accountsAsync.when(
      data: (page) {
        if (page.accounts.isEmpty) {
          return Center(
            child: Text(
              widget.role == AdminAccountRole.student ? '暂无学生' : '暂无教师',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }
        return ListView.separated(
          itemCount: page.accounts.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final account = page.accounts[index];
            final isProcessing = _processingIds.contains(account.id);
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  account.name.isNotEmpty ? account.name.substring(0, 1) : '?',
                ),
              ),
              title: Text(account.name),
              subtitle: Text(account.identifier),
              trailing: widget.role == AdminAccountRole.student
                  ? IconButton(
                      tooltip: '取消分配',
                      onPressed: schoolId.isEmpty || isProcessing
                          ? null
                          : () => _removeFromClass(
                              context: context,
                              account: account,
                              schoolId: schoolId,
                            ),
                      icon: isProcessing
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.person_remove_outlined),
                    )
                  : null,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('加载失败: $error')),
    );
  }
}
