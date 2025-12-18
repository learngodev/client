import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/admin_providers.dart';
import '../../domain/accounts.dart';
import '../../domain/models.dart';
import '../../../auth/application/auth_controller.dart';

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

class _ClassAccountList extends ConsumerWidget {
  const _ClassAccountList({required this.classInfo, required this.role});

  final ClassInfo classInfo;
  final AdminAccountRole role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: role,
      classId: classInfo.id,
      page: 1,
      pageSize: 100,
    );

    final accountsAsync = ref.watch(adminAccountListProvider(request));

    return accountsAsync.when(
      data: (page) {
        if (page.accounts.isEmpty) {
          return Center(
            child: Text(
              role == AdminAccountRole.student ? '暂无学生' : '暂无教师',
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
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  account.name.isNotEmpty ? account.name.substring(0, 1) : '?',
                ),
              ),
              title: Text(account.name),
              subtitle: Text(account.identifier),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('加载失败: $error')),
    );
  }
}
