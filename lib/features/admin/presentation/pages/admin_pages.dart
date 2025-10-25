import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/admin_providers.dart';
import '../../domain/models.dart';
import '../../domain/sample_data.dart' as admin_data;

/// Clean, single-file admin pages implementation (overview, accounts, structures, OSS, system)

class AdminOverviewPage extends ConsumerWidget {
  const AdminOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(adminDepartmentTreeProvider);

    return tree.when(
      data: (nodes) {
        final metrics = AdminDepartmentMetrics.fromNodes(nodes);
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('学校概览', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _AdminStatsCard(
                  icon: Icons.apartment,
                  title: '院系总数',
                  value: metrics.departmentCount.toString(),
                  subtitle: '当前已创建的院系数量。',
                  color: Theme.of(context).colorScheme.primary,
                ),
                _AdminStatsCard(
                  icon: Icons.class_outlined,
                  title: '班级总数',
                  value: metrics.classCount.toString(),
                  subtitle: '所有院系下的班级合计。',
                  color: Theme.of(context).colorScheme.secondary,
                ),
                _AdminStatsCard(
                  icon: Icons.pending_actions_outlined,
                  title: '未配置班级的院系',
                  value: metrics.emptyDepartmentCount.toString(),
                  subtitle: '需要补充班级信息的院系数。',
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _AccountSectionCard(
              icon: Icons.analytics_outlined,
              title: '快速检查',
              child: const _EmptyPlaceholder(
                title: '更多监控项',
                description: '该区域可扩展为更多运维统计与快速入口。',
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _ErrorPlaceholder(message: e.toString(), onRetry: () {}),
    );
  }
}

class AdminAccountsPage extends HookConsumerWidget {
  const AdminAccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = useState(_AccountRoleFilter.all);
    final controller = useTextEditingController();
    useListenable(controller);
    final department = useState<String>(_kAllDepartments);
    final accounts = admin_data.adminAccountItems;
    final invites = admin_data.adminAccountInvites;

    final departments =
        accounts.map((account) => account.department).toSet().toList()..sort();

    final query = controller.text.trim();
    final lowerQuery = query.toLowerCase();

    final filtered = accounts.where((a) {
      final matchesRole = switch (role.value) {
        _AccountRoleFilter.all => true,
        _AccountRoleFilter.teachers =>
          a.role == admin_data.AdminAccountRole.teacher,
        _AccountRoleFilter.students =>
          a.role == admin_data.AdminAccountRole.student,
      };
      final matchesDepartment =
          department.value == _kAllDepartments ||
          a.department == department.value;
      final matchesQuery = lowerQuery.isEmpty
          ? true
          : a.matchesQuery(query) ||
                a.name.toLowerCase().contains(lowerQuery) ||
                a.email.toLowerCase().contains(lowerQuery);
      return matchesRole && matchesDepartment && matchesQuery;
    }).toList()..sort((a, b) => a.name.compareTo(b.name));

    final metrics = _AccountMetrics.fromAccounts(filtered);
    final hasActiveFilters =
        role.value != _AccountRoleFilter.all ||
        department.value != _kAllDepartments ||
        query.isNotEmpty;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('账号管理', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.insights_outlined,
          title: '筛选结果概览',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hasActiveFilters
                    ? '共筛选到 ${metrics.total} 个账号'
                    : '系统共包含 ${metrics.total} 个账号样本',
              ),
              const SizedBox(height: 12),
              _AccountMetricsGrid(metrics: metrics),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _AccountSectionCard(
          icon: Icons.tune_outlined,
          title: '筛选',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final f in _AccountRoleFilter.values)
                    ChoiceChip(
                      label: Text(_accountRoleFilterLabel(f)),
                      selected: role.value == f,
                      onSelected: (selected) {
                        if (selected) {
                          role.value = f;
                        }
                      },
                    ),
                ],
              ),
              const SizedBox(height: 12),
              DropdownMenu<String>(
                key: ValueKey(department.value),
                initialSelection: department.value,
                label: const Text('按院系统一筛选'),
                leadingIcon: const Icon(Icons.account_tree_outlined),
                onSelected: (value) {
                  department.value = value ?? _kAllDepartments;
                },
                dropdownMenuEntries: [
                  const DropdownMenuEntry<String>(
                    value: _kAllDepartments,
                    label: '全部院系',
                  ),
                  for (final dept in departments)
                    DropdownMenuEntry<String>(value: dept, label: dept),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: '搜索账号',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              if (hasActiveFilters) ...[
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    icon: const Icon(Icons.filter_alt_off_outlined),
                    label: const Text('重置筛选'),
                    onPressed: () {
                      role.value = _AccountRoleFilter.all;
                      department.value = _kAllDepartments;
                      controller.clear();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        _AccountSectionCard(
          icon: Icons.manage_accounts_outlined,
          title: '账号列表',
          child: filtered.isEmpty
              ? _EmptyPlaceholder(
                  title: '暂无账号',
                  description: hasActiveFilters
                      ? '没有符合筛选条件的账号，请调整筛选条件后再试。'
                      : '系统中尚未录入账号样本。',
                )
              : Column(
                  children: [
                    for (final a in filtered)
                      _AccountTile(
                        account: a,
                        onFeatureTap: (f) => _showDevelopmentToast(context, f),
                      ),
                  ],
                ),
        ),
        if (invites.isNotEmpty) ...[
          const SizedBox(height: 16),
          _AccountSectionCard(
            icon: Icons.mark_email_unread_outlined,
            title: '待处理邀请',
            child: Column(
              children: [
                for (final invite in invites)
                  _AccountInviteTile(
                    invite: invite,
                    onFeatureTap: (feature) =>
                        _showDevelopmentToast(context, feature),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class AdminStructuresPage extends HookConsumerWidget {
  const AdminStructuresPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(adminDepartmentTreeProvider);
    final query = useState('');

    return tree.when(
      data: (nodes) {
        final normalized = query.value.trim().toLowerCase();
        final filtered = nodes.where((node) {
          if (normalized.isEmpty) return true;
          final departmentMatch = node.department.name.toLowerCase().contains(
            normalized,
          );
          final classMatch = node.classes.any((clazz) {
            final grade = clazz.grade?.toLowerCase() ?? '';
            final description = clazz.description?.toLowerCase() ?? '';
            return clazz.name.toLowerCase().contains(normalized) ||
                grade.contains(normalized) ||
                description.contains(normalized);
          });
          return departmentMatch || classMatch;
        }).toList();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('院系与班级', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: '搜索院系或班级',
              ),
              onChanged: (value) => query.value = value,
            ),
            const SizedBox(height: 12),
            if (filtered.isEmpty)
              const _EmptyPlaceholder(
                title: '暂无匹配结果',
                description: '尝试调整关键词，或检查是否创建了相关院系/班级。',
              )
            else
              for (final node in filtered)
                _DepartmentExpansion(node: node, query: normalized),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _ErrorPlaceholder(message: e.toString(), onRetry: () {}),
    );
  }
}

class AdminOssSettingsPage extends ConsumerWidget {
  const AdminOssSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credentials = admin_data.adminOssCredentials;
    final policies = admin_data.adminOssPolicies;
    final logs = admin_data.adminOssAuditLogs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('OSS 设置', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.vpn_key_outlined,
          title: '访问凭证',
          child: Column(
            children: [
              for (final c in credentials)
                _OssCredentialTile(
                  credential: c,
                  onFeatureTap: (f) => _showDevelopmentToast(context, f),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.rule_folder_outlined,
          title: '安全策略',
          child: Column(
            children: [
              for (final p in policies)
                _OssPolicyTile(
                  policy: p,
                  onFeatureTap: (f) => _showDevelopmentToast(context, f),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.event_note_outlined,
          title: '审计记录',
          child: logs.isEmpty
              ? const _EmptyPlaceholder(title: '暂无审计', description: '')
              : Column(children: [for (final l in logs) _OssAuditTile(log: l)]),
        ),
      ],
    );
  }
}

class AdminSystemSettingsPage extends ConsumerWidget {
  const AdminSystemSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switches = admin_data.adminSystemSwitches;
    final parameters = admin_data.adminSystemParameters;
    final broadcasts = admin_data.adminSystemBroadcasts;
    final audits = admin_data.adminSystemAuditLogs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('系统设置', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.toggle_on_outlined,
          title: '系统开关',
          child: Column(
            children: [
              for (final s in switches)
                _SystemSwitchTile(
                  item: s,
                  onFeatureTap: (f) => _showDevelopmentToast(context, f),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.settings_applications_outlined,
          title: '平台参数',
          child: Column(
            children: [
              for (final p in parameters)
                _SystemParameterTile(
                  item: p,
                  onFeatureTap: (f) => _showDevelopmentToast(context, f),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.campaign_outlined,
          title: '通知广播',
          child: Column(
            children: [
              for (final b in broadcasts)
                _SystemBroadcastTile(
                  item: b,
                  onFeatureTap: (f) => _showDevelopmentToast(context, f),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.rule_outlined,
          title: '审计记录',
          child: Column(
            children: [for (final a in audits) _SystemAuditTile(item: a)],
          ),
        ),
      ],
    );
  }
}

// -------------------- Helpers & small widgets --------------------

class _AdminStatsCard extends StatelessWidget {
  const _AdminStatsCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(color: color),
            ),
            const SizedBox(height: 4),
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountSectionCard extends StatelessWidget {
  const _AccountSectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  const _ErrorPlaceholder({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 8),
            Text('加载失败', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DepartmentExpansion extends StatelessWidget {
  const _DepartmentExpansion({required this.node, required this.query});
  final DepartmentNode node;
  final String query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final normalized = query.trim().toLowerCase();
    final departmentMatches = normalized.isEmpty
        ? true
        : node.department.name.toLowerCase().contains(normalized);
    final filteredClasses = normalized.isEmpty
        ? node.classes
        : node.classes.where((clazz) {
            final grade = clazz.grade?.toLowerCase() ?? '';
            final description = clazz.description?.toLowerCase() ?? '';
            return clazz.name.toLowerCase().contains(normalized) ||
                grade.contains(normalized) ||
                description.contains(normalized);
          }).toList();

    final children = filteredClasses.isEmpty
        ? <Widget>[
            ListTile(
              title: Text(
                node.classes.isEmpty
                    ? '暂无班级'
                    : (departmentMatches ? '无匹配的班级' : '无匹配的结果'),
              ),
            ),
          ]
        : filteredClasses
              .map(
                (clazz) => ListTile(
                  title: Text(clazz.name),
                  subtitle: Text(_buildClassSubtitle(clazz)),
                ),
              )
              .toList();

    return Card(
      elevation: 0,
      child: ExpansionTile(
        title: Text(node.department.name, style: theme.textTheme.titleMedium),
        subtitle: Text(
          '院系ID：${node.department.id} · 学校：${node.department.schoolId}',
        ),
        initiallyExpanded:
            normalized.isNotEmpty &&
            (departmentMatches || filteredClasses.isNotEmpty),
        children: children,
      ),
    );
  }
}

String _buildClassSubtitle(ClassInfo clazz) {
  final parts = <String>['班级ID：${clazz.id}'];
  if (clazz.grade != null && clazz.grade!.isNotEmpty) {
    parts.add('年级：${clazz.grade}');
  }
  if (clazz.description != null && clazz.description!.isNotEmpty) {
    parts.add(clazz.description!);
  }
  return parts.join(' · ');
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({required this.account, required this.onFeatureTap});
  final admin_data.AdminAccountItem account;
  final void Function(String) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(
              account.role.icon,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        account.name,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Chip(
                      label: Text(account.roleLabel),
                      side: BorderSide.none,
                      backgroundColor: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.4),
                    ),
                    Chip(
                      label: Text(account.statusLabel),
                      side: BorderSide(
                        color: account
                            .statusColor(theme)
                            .withValues(alpha: 0.4),
                      ),
                      backgroundColor: account
                          .statusColor(theme)
                          .withValues(alpha: 0.16),
                      labelStyle: theme.textTheme.bodySmall?.copyWith(
                        color: account.statusColor(theme),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(account.email),
                const SizedBox(height: 4),
                Text(
                  '账号：${account.identifier}',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Text(
                  '所属：${account.structureLabel}',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Text(
                  '最近活跃：${account.lastActiveLabel}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                if (account.phone != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '联系电话：${account.phone}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
                if (account.note != null && account.note!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    account.note!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            tooltip: '更多操作',
            onPressed: () => onFeatureTap('更多'),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}

class _AccountMetrics {
  const _AccountMetrics({
    required this.total,
    required this.teachers,
    required this.students,
    required this.locked,
    required this.pendingReset,
  });

  factory _AccountMetrics.fromAccounts(
    List<admin_data.AdminAccountItem> accounts,
  ) {
    var teachers = 0;
    var students = 0;
    var locked = 0;
    var pendingReset = 0;

    for (final account in accounts) {
      switch (account.role) {
        case admin_data.AdminAccountRole.teacher:
          teachers++;
        case admin_data.AdminAccountRole.student:
          students++;
      }
      if (account.locked) {
        locked++;
      }
      if (account.requiresPasswordReset) {
        pendingReset++;
      }
    }

    return _AccountMetrics(
      total: accounts.length,
      teachers: teachers,
      students: students,
      locked: locked,
      pendingReset: pendingReset,
    );
  }

  final int total;
  final int teachers;
  final int students;
  final int locked;
  final int pendingReset;
}

class _AccountMetricsGrid extends StatelessWidget {
  const _AccountMetricsGrid({required this.metrics});

  final _AccountMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cards = <Widget>[
      _AccountMetricCard(
        icon: Icons.people_alt_outlined,
        label: '账号数量',
        value: metrics.total.toString(),
        color: theme.colorScheme.primary,
      ),
      _AccountMetricCard(
        icon: Icons.co_present_outlined,
        label: '教师账号',
        value: metrics.teachers.toString(),
        color: theme.colorScheme.primary,
      ),
      _AccountMetricCard(
        icon: Icons.school_outlined,
        label: '学生账号',
        value: metrics.students.toString(),
        color: theme.colorScheme.secondary,
      ),
      _AccountMetricCard(
        icon: Icons.lock_outlined,
        label: '已锁定',
        value: metrics.locked.toString(),
        color: theme.colorScheme.error,
      ),
      _AccountMetricCard(
        icon: Icons.refresh_outlined,
        label: '待重置密码',
        value: metrics.pendingReset.toString(),
        color: theme.colorScheme.tertiary,
      ),
    ];

    return Wrap(spacing: 12, runSpacing: 12, children: cards);
  }
}

class _AccountMetricCard extends StatelessWidget {
  const _AccountMetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: const BoxConstraints(minWidth: 160),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: theme.textTheme.titleLarge?.copyWith(color: color),
              ),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountInviteTile extends StatelessWidget {
  const _AccountInviteTile({required this.invite, required this.onFeatureTap});

  final admin_data.AdminAccountInvite invite;
  final void Function(String) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(invite.email, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      '由 ${invite.invitedBy} 邀请 · 创建时间：${invite.createdAtLabel}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Chip(
                label: Text(invite.roleLabel),
                backgroundColor: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.4),
                side: BorderSide.none,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                size: 18,
                color: theme.colorScheme.outline,
              ),
              const SizedBox(width: 6),
              Text(
                '有效期至 ${invite.expiresAtLabel}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.link_outlined),
                  label: const Text('复制邀请链接'),
                  onPressed: () => onFeatureTap('复制邀请链接'),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('重新发送'),
                  onPressed: () => onFeatureTap('重新发送邀请'),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.close_outlined),
                  label: const Text('撤销邀请'),
                  onPressed: () => onFeatureTap('撤销邀请'),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _AccountRoleFilter { all, teachers, students }

const String _kAllDepartments = '__all_departments__';

String _accountRoleFilterLabel(_AccountRoleFilter f) {
  return switch (f) {
    _AccountRoleFilter.all => '全部账号',
    _AccountRoleFilter.teachers => '教师',
    _AccountRoleFilter.students => '学生',
  };
}

class _OssCredentialTile extends StatelessWidget {
  const _OssCredentialTile({
    required this.credential,
    required this.onFeatureTap,
  });
  final admin_data.AdminOssCredential credential;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.vpn_key_outlined, color: theme.colorScheme.primary),
      title: Text(credential.name),
      subtitle: Text('${credential.region} · ${credential.bucket}'),
      trailing: IconButton(
        icon: const Icon(Icons.copy_outlined),
        onPressed: () => onFeatureTap('复制'),
      ),
    );
  }
}

class _OssPolicyTile extends StatelessWidget {
  const _OssPolicyTile({required this.policy, required this.onFeatureTap});
  final admin_data.AdminOssPolicy policy;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(policy.name),
      subtitle: Text(policy.description),
    );
  }
}

class _OssAuditTile extends StatelessWidget {
  const _OssAuditTile({required this.log});
  final admin_data.AdminOssAuditLog log;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(log.action),
      subtitle: Text('${log.operator} · ${log.timeLabel}'),
    );
  }
}

class _SystemSwitchTile extends StatelessWidget {
  const _SystemSwitchTile({required this.item, required this.onFeatureTap});
  final admin_data.AdminSystemSwitch item;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.description),
      trailing: Switch.adaptive(
        value: item.enabled,
        onChanged: (_) => onFeatureTap('切换 ${item.title}'),
      ),
    );
  }
}

class _SystemParameterTile extends StatelessWidget {
  const _SystemParameterTile({required this.item, required this.onFeatureTap});
  final admin_data.AdminSystemParameter item;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(item.key), subtitle: Text('当前值：${item.value}'));
  }
}

class _SystemBroadcastTile extends StatelessWidget {
  const _SystemBroadcastTile({required this.item, required this.onFeatureTap});
  final admin_data.AdminSystemBroadcast item;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.messagePreview),
    );
  }
}

class _SystemAuditTile extends StatelessWidget {
  const _SystemAuditTile({required this.item});
  final admin_data.AdminSystemAuditLog item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.action),
      subtitle: Text('${item.category} · ${item.operator}'),
    );
  }
}

void _showDevelopmentToast(BuildContext context, String feature) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Text('$feature 功能即将上线'),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
