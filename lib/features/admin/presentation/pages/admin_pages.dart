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
    final accounts = admin_data.adminAccountItems;
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
      final matchesQuery = lowerQuery.isEmpty
          ? true
          : a.matchesQuery(query) ||
              a.name.toLowerCase().contains(lowerQuery) ||
              a.email.toLowerCase().contains(lowerQuery);
      return matchesRole && matchesQuery;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('账号管理', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        _AccountSectionCard(
          icon: Icons.tune_outlined,
          title: '筛选',
          child: Column(children: [
            Wrap(spacing: 8, children: [
              for (final f in _AccountRoleFilter.values)
                ChoiceChip(
                  label: Text(_accountRoleFilterLabel(f)),
                  selected: role.value == f,
                  onSelected: (s) => role.value = f,
                ),
            ]),
            const SizedBox(height: 8),
            TextField(controller: controller, decoration: const InputDecoration(labelText: '搜索账号')),
          ]),
        ),
        const SizedBox(height: 16),
        _AccountSectionCard(
          icon: Icons.manage_accounts_outlined,
          title: '账号列表',
          child: filtered.isEmpty
              ? const _EmptyPlaceholder(title: '暂无账号', description: '无匹配结果')
              : Column(children: [for (final a in filtered) _AccountTile(account: a, onFeatureTap: (f) => _showDevelopmentToast(context, f))]),
        ),
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
          final departmentMatch =
              node.department.name.toLowerCase().contains(normalized);
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
            Text('院系与班级',
                style: Theme.of(context).textTheme.headlineSmall),
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
      error: (e, _) =>
          _ErrorPlaceholder(message: e.toString(), onRetry: () {}),
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

    return ListView(padding: const EdgeInsets.all(16), children: [
      Text('OSS 设置', style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 12),
      _AccountSectionCard(
        icon: Icons.vpn_key_outlined,
        title: '访问凭证',
        child: Column(children: [for (final c in credentials) _OssCredentialTile(credential: c, onFeatureTap: (f) => _showDevelopmentToast(context, f))]),
      ),
      const SizedBox(height: 12),
      _AccountSectionCard(
        icon: Icons.rule_folder_outlined,
        title: '安全策略',
        child: Column(children: [for (final p in policies) _OssPolicyTile(policy: p, onFeatureTap: (f) => _showDevelopmentToast(context, f))]),
      ),
      const SizedBox(height: 12),
      _AccountSectionCard(
        icon: Icons.event_note_outlined,
        title: '审计记录',
        child: logs.isEmpty ? const _EmptyPlaceholder(title: '暂无审计', description: '') : Column(children: [for (final l in logs) _OssAuditTile(log: l)]),
      ),
    ]);
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

    return ListView(padding: const EdgeInsets.all(16), children: [
      Text('系统设置', style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 12),
      _AccountSectionCard(icon: Icons.toggle_on_outlined, title: '系统开关', child: Column(children: [for (final s in switches) _SystemSwitchTile(item: s, onFeatureTap: (f) => _showDevelopmentToast(context, f))])),
      const SizedBox(height: 12),
      _AccountSectionCard(icon: Icons.settings_applications_outlined, title: '平台参数', child: Column(children: [for (final p in parameters) _SystemParameterTile(item: p, onFeatureTap: (f) => _showDevelopmentToast(context, f))])),
      const SizedBox(height: 12),
      _AccountSectionCard(icon: Icons.campaign_outlined, title: '通知广播', child: Column(children: [for (final b in broadcasts) _SystemBroadcastTile(item: b, onFeatureTap: (f) => _showDevelopmentToast(context, f))])),
      const SizedBox(height: 12),
      _AccountSectionCard(icon: Icons.rule_outlined, title: '审计记录', child: Column(children: [for (final a in audits) _SystemAuditTile(item: a)])),
    ]);
  }
}

// -------------------- Helpers & small widgets --------------------

class _AdminStatsCard extends StatelessWidget {
  const _AdminStatsCard({required this.icon, required this.title, required this.value, required this.subtitle, required this.color});

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(value, style: theme.textTheme.headlineSmall?.copyWith(color: color)),
          const SizedBox(height: 4),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
        ]),
      ),
    );
  }
}

class _AccountSectionCard extends StatelessWidget {
  const _AccountSectionCard({required this.icon, required this.title, required this.child});

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Icon(icon, color: theme.colorScheme.primary), const SizedBox(width: 8), Expanded(child: Text(title, style: theme.textTheme.titleMedium))]),
          const SizedBox(height: 12),
          child,
        ]),
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
      child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.inbox_outlined, size: 48, color: Colors.grey.shade400), const SizedBox(height: 12), Text(title, style: Theme.of(context).textTheme.titleLarge), const SizedBox(height: 6), Text(description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]))])),
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
        child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error), const SizedBox(height: 8), Text('加载失败', style: Theme.of(context).textTheme.titleLarge), const SizedBox(height: 6), Text(message, textAlign: TextAlign.center), const SizedBox(height: 8), OutlinedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text('重试'))]),
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
            .map((clazz) => ListTile(
                  title: Text(clazz.name),
                  subtitle: Text(_buildClassSubtitle(clazz)),
                ))
            .toList();

    return Card(
      elevation: 0,
      child: ExpansionTile(
        title: Text(node.department.name, style: theme.textTheme.titleMedium),
        subtitle:
            Text('院系ID：${node.department.id} · 学校：${node.department.schoolId}'),
        initiallyExpanded:
            normalized.isNotEmpty && (departmentMatches || filteredClasses.isNotEmpty),
        children: children,
      ),
    );
  }
}

String _buildClassSubtitle(ClassInfo clazz) {
  final parts = <String>['班级ID：${clazz.id}'];
  if (clazz.grade != null && clazz.grade!.isNotEmpty) parts.add('年级：${clazz.grade}');
  if (clazz.description != null && clazz.description!.isNotEmpty) parts.add(clazz.description!);
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
      decoration: BoxDecoration(border: Border.all(color: theme.colorScheme.outlineVariant), borderRadius: BorderRadius.circular(8)),
      child: Row(children: [CircleAvatar(backgroundColor: theme.colorScheme.primaryContainer, child: Icon(account.role.icon, color: theme.colorScheme.onPrimaryContainer)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(account.name, style: theme.textTheme.titleMedium), const SizedBox(height: 4), Text(account.email),])), IconButton(onPressed: () => onFeatureTap('更多'), icon: const Icon(Icons.more_vert))]),
    );
  }
}

enum _AccountRoleFilter { all, teachers, students }

String _accountRoleFilterLabel(_AccountRoleFilter f) {
  return switch (f) {
    _AccountRoleFilter.all => '全部账号',
    _AccountRoleFilter.teachers => '教师',
    _AccountRoleFilter.students => '学生',
  };
}

class _OssCredentialTile extends StatelessWidget {
  const _OssCredentialTile({required this.credential, required this.onFeatureTap});
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
      trailing: IconButton(icon: const Icon(Icons.copy_outlined), onPressed: () => onFeatureTap('复制')),
    );
  }
}

class _OssPolicyTile extends StatelessWidget {
  const _OssPolicyTile({required this.policy, required this.onFeatureTap});
  final admin_data.AdminOssPolicy policy;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(policy.name), subtitle: Text(policy.description));
  }
}

class _OssAuditTile extends StatelessWidget {
  const _OssAuditTile({required this.log});
  final admin_data.AdminOssAuditLog log;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(log.action), subtitle: Text('${log.operator} · ${log.timeLabel}'));
  }
}

class _SystemSwitchTile extends StatelessWidget {
  const _SystemSwitchTile({required this.item, required this.onFeatureTap});
  final admin_data.AdminSystemSwitch item;
  final void Function(String) onFeatureTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(item.title), subtitle: Text(item.description), trailing: Switch.adaptive(value: item.enabled, onChanged: (_) => onFeatureTap('切换 ${item.title}')));
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
    return ListTile(title: Text(item.title), subtitle: Text(item.messagePreview));
  }
}

class _SystemAuditTile extends StatelessWidget {
  const _SystemAuditTile({required this.item});
  final admin_data.AdminSystemAuditLog item;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(item.action), subtitle: Text('${item.category} · ${item.operator}'));
  }
}

void _showDevelopmentToast(BuildContext context, String feature) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(SnackBar(content: Text('$feature 功能即将上线'), behavior: SnackBarBehavior.floating));
}

