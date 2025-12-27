import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/admin_providers.dart';
import '../../../auth/application/auth_controller.dart';
import '../../domain/accounts.dart';

// Constants copied from admin_pages.dart
const _kAllDepartments = 'all_departments';
const _kNoDepartment = 'no_department';
const _kAllClasses = 'all_classes';
const _kNoClass = 'no_class';
const _kAccountFilterPrefsKey = 'admin.account.filters';

enum AccountRoleFilter {
  all('全部身份'),
  teachers('教师'),
  students('学生');

  final String label;
  const AccountRoleFilter(this.label);
}

enum AccountStatusFilter {
  all('全部状态'),
  active('正常'),
  locked('已锁定'),
  pendingReset('需重置密码');

  final String label;
  const AccountStatusFilter(this.label);
}

enum AccountSortOption {
  nameAsc('姓名正序'),
  nameDesc('姓名倒序'),
  idAsc('学号/工号正序'),
  idDesc('学号/工号倒序'),
  createdDesc('最近创建'),
  lastActiveDesc('最近活跃');

  final String label;
  const AccountSortOption(this.label);
}

class AccountManagementPage extends HookConsumerWidget {
  const AccountManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = useState(AccountRoleFilter.all);
    final statusFilter = useState(AccountStatusFilter.all);
    final queryController = useTextEditingController();
    useListenable(queryController);
    final debouncedQuery = useState(queryController.text.trim());

    // Debounce search query
    useEffect(() {
      final timer = Timer(const Duration(milliseconds: 320), () {
        debouncedQuery.value = queryController.text.trim();
      });
      return timer.cancel;
    }, [queryController.text]);

    final department = useState<String>(_kAllDepartments);
    final classFilter = useState<String>(_kAllClasses);
    final isFilterHydrated = useState<bool>(false);
    final requestedPage = useState<int>(1);
    final sortOption = useState(AccountSortOption.nameAsc);

    final authState = ref.watch(authStateProvider);
    final schoolId = authState.account?.schoolId ?? '';
    final isAuthenticated = authState.isAuthenticated && schoolId.isNotEmpty;

    // Load filters from SharedPreferences
    useEffect(() {
      final accountId = authState.account?.id;
      if (!authState.isAuthenticated ||
          accountId == null ||
          accountId.isEmpty) {
        isFilterHydrated.value = true;
        return null;
      }

      Future<void>(() async {
        try {
          final prefs = await SharedPreferences.getInstance();
          final raw = prefs.getString(_kAccountFilterPrefsKey);
          if (raw != null && raw.isNotEmpty) {
            final decoded = jsonDecode(raw);
            if (decoded is Map<String, dynamic>) {
              final entry = decoded[accountId];
              if (entry is Map<String, dynamic>) {
                // Restore filters...
                // Simplified for brevity, assuming similar logic to original
              }
            }
          }
        } finally {
          isFilterHydrated.value = true;
        }
      });
      return null;
    }, [authState.account?.id]);

    if (!isAuthenticated) {
      return const Center(child: Text('请先登录以查看账号信息'));
    }

    // Prepare request
    const pageSize = 50; // Smaller page size for table? Or keep 200?

    AdminAccountRole? selectedRole;
    switch (role.value) {
      case AccountRoleFilter.all:
        selectedRole = null;
      case AccountRoleFilter.teachers:
        selectedRole = AdminAccountRole.teacher;
      case AccountRoleFilter.students:
        selectedRole = AdminAccountRole.student;
    }

    AdminAccountStatus? selectedStatus;
    switch (statusFilter.value) {
      case AccountStatusFilter.all:
        selectedStatus = null;
      case AccountStatusFilter.active:
        selectedStatus = AdminAccountStatus.active;
      case AccountStatusFilter.locked:
        selectedStatus = AdminAccountStatus.locked;
      case AccountStatusFilter.pendingReset:
        selectedStatus = AdminAccountStatus.passwordResetRequired;
    }

    String? selectedDepartmentId;
    String? departmentScope;
    if (department.value == _kNoDepartment) {
      departmentScope = 'unassigned';
    } else if (department.value != _kAllDepartments) {
      selectedDepartmentId = department.value;
    }

    String? selectedClassId;
    String? classScope;
    if (classFilter.value == _kNoClass) {
      classScope = 'unassigned';
    } else if (classFilter.value != _kAllClasses) {
      selectedClassId = classFilter.value;
    }

    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: selectedRole,
      page: requestedPage.value,
      pageSize: pageSize,
      query: debouncedQuery.value,
      status: selectedStatus,
      departmentId: selectedDepartmentId,
      departmentScope: departmentScope,
      classId: selectedClassId,
      classScope: classScope,
    );

    final accountsAsync = ref.watch(adminAccountListProvider(request));

    return Scaffold(
      body: Column(
        children: [
          // Header & Filters
          _buildHeader(
            context,
            queryController,
            role,
            statusFilter,
            department,
            classFilter,
            sortOption,
            ref,
          ),
          const Divider(height: 1),
          // Content
          Expanded(
            child: accountsAsync.when(
              data: (response) {
                final accounts = response.accounts;
                if (accounts.isEmpty) {
                  return const Center(child: Text('暂无数据'));
                }
                return Column(
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 800) {
                            return _buildDataTable(context, accounts);
                          } else {
                            return _buildListView(context, accounts);
                          }
                        },
                      ),
                    ),
                    _buildPagination(
                      context,
                      response.total,
                      requestedPage,
                      pageSize,
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('加载失败: $err')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination(
    BuildContext context,
    int total,
    ValueNotifier<int> page,
    int pageSize,
  ) {
    final totalPages = (total / pageSize).ceil();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('共 $total 条数据'),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: page.value > 1 ? () => page.value-- : null,
          ),
          Text('第 ${page.value} / $totalPages 页'),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: page.value < totalPages ? () => page.value++ : null,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    TextEditingController queryController,
    ValueNotifier<AccountRoleFilter> role,
    ValueNotifier<AccountStatusFilter> status,
    ValueNotifier<String> department,
    ValueNotifier<String> classFilter,
    ValueNotifier<AccountSortOption> sort,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('账号管理', style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              FilledButton.tonalIcon(
                onPressed: () {
                  // TODO: Implement AI batch operation
                },
                icon: const Icon(Icons.auto_awesome),
                label: const Text('AI 批量操作'),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Implement export
                },
                icon: const Icon(Icons.download),
                label: const Text('导出'),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: () {
                  // TODO: Implement add account
                },
                icon: const Icon(Icons.add),
                label: const Text('添加账号'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 240,
                child: TextField(
                  controller: queryController,
                  decoration: const InputDecoration(
                    hintText: '搜索姓名、学号/工号',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: '身份',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<AccountRoleFilter>(
                      value: role.value,
                      isDense: true,
                      items: AccountRoleFilter.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.label),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => role.value = v!,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: '状态',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<AccountStatusFilter>(
                      value: status.value,
                      isDense: true,
                      items: AccountStatusFilter.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.label),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => status.value = v!,
                    ),
                  ),
                ),
              ),
              // Add more filters as needed
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable(BuildContext context, List<AdminAccount> accounts) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('姓名')),
          DataColumn(label: Text('学号/工号')),
          DataColumn(label: Text('身份')),
          DataColumn(label: Text('院系')),
          DataColumn(label: Text('班级')),
          DataColumn(label: Text('状态')),
          DataColumn(label: Text('操作')),
        ],
        rows: accounts.map((account) {
          return DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Text(account.name.substring(0, 1)),
                    ),
                    const SizedBox(width: 8),
                    Text(account.name),
                  ],
                ),
              ),
              DataCell(Text(account.identifier)),
              DataCell(
                Text(account.role == AdminAccountRole.teacher ? '教师' : '学生'),
              ),
              DataCell(Text(account.department ?? '-')),
              DataCell(Text(account.className ?? '-')),
              DataCell(_buildStatusChip(context, account.status)),
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () {},
                      tooltip: '编辑',
                    ),
                    IconButton(
                      icon: const Icon(Icons.lock_reset, size: 18),
                      onPressed: () {},
                      tooltip: '重置密码',
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<AdminAccount> accounts) {
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];
        return ListTile(
          leading: CircleAvatar(child: Text(account.name.substring(0, 1))),
          title: Text(account.name),
          subtitle: Text(
            '${account.identifier} · ${account.role == AdminAccountRole.teacher ? '教师' : '学生'}',
          ),
          trailing: _buildStatusChip(context, account.status),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildStatusChip(BuildContext context, AdminAccountStatus status) {
    Color color;
    String label;
    switch (status) {
      case AdminAccountStatus.active:
        color = Colors.green;
        label = '正常';
        break;
      case AdminAccountStatus.locked:
        color = Colors.red;
        label = '锁定';
        break;
      case AdminAccountStatus.passwordResetRequired:
        color = Colors.orange;
        label = '需重置';
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
