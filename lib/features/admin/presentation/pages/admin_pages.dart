import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/admin_providers.dart';
import '../../domain/models.dart';
import '../../domain/sample_data.dart' as admin_data;

class AdminOverviewPage extends ConsumerWidget {
  const AdminOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(adminDepartmentMetricsProvider);
    final onlyEmpty = ref.watch(adminOnlyEmptyDepartmentsProvider);

    return metrics.when(
      data: (stats) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(adminDepartmentTreeProvider);
          await ref.read(adminDepartmentTreeProvider.future);
        },
        child: ListView(
          padding: const EdgeInsets.all(24),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Text('学校概览', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(
              '快速了解院系配置情况，可前往“院系与班级”页面进行维护。',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _AdminStatsCard(
                  icon: Icons.apartment,
                  title: '院系总数',
                  value: stats.departmentCount.toString(),
                  subtitle: '当前已创建的院系数量。',
                  color: Theme.of(context).colorScheme.primary,
                ),
                _AdminStatsCard(
                  icon: Icons.class_outlined,
                  title: '班级总数',
                  value: stats.classCount.toString(),
                  subtitle: '所有院系下的班级合计。',
                  color: Theme.of(context).colorScheme.secondary,
                ),
                _AdminStatsCard(
                  icon: Icons.pending_actions_outlined,
                  title: '待补充院系',
                  value: stats.emptyDepartmentCount.toString(),
                  subtitle: '尚未配置班级的院系数量。',
                  children: node.classes.isEmpty
                      ? const [
                          ListTile(
                            leading: Icon(Icons.info_outline),
                            title: Text('暂无班级'),
                          ),
                        ]
                      : node.classes
                          .map(
                            (clazz) => ListTile(
                              leading: const Icon(Icons.class_outlined),
                              title: _HighlightText(
                                text: clazz.name,
                                query: trimmedQuery,
                                style: theme.textTheme.titleMedium,
                              ),
                              subtitle: _HighlightText(
                                text: _buildClassSubtitle(clazz),
                                query: trimmedQuery,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          )
                          .toList(),
        );

        void clearFilters() {
          controller.clear();
          ref.read(adminDepartmentFilterProvider.notifier).state = '';
          ref.read(adminOnlyEmptyDepartmentsProvider.notifier).state = false;
        }

        if (nodes.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(adminDepartmentTreeProvider);
              await ref.read(adminDepartmentTreeProvider.future);
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                _StructuresSearchField(
                  controller: controller,
                  hasQuery: hasQuery,
                  onlyEmpty: onlyEmpty,
                  onChanged: (value) =>
                      ref.read(adminDepartmentFilterProvider.notifier).state =
                          value,
                  onClear: () {
                    controller.clear();
                    ref.read(adminDepartmentFilterProvider.notifier).state = '';
                  },
                  onToggleEmpty: (value) =>
                      ref
                              .read(adminOnlyEmptyDepartmentsProvider.notifier)
                              .state =
                          value,
                ),
                const SizedBox(height: 16),
                _StructuresSummaryBar(
                  filtered: filteredStats,
                  total: totalStats,
                  isFiltering: hasQuery || onlyEmpty,
                  onClearFilters: clearFilters,
                ),
                const SizedBox(height: 24),
                _SearchEmptyPlaceholder(query: filter),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(adminDepartmentTreeProvider);
            await ref.read(adminDepartmentTreeProvider.future);
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              _StructuresSearchField(
                controller: controller,
                hasQuery: hasQuery,
                onlyEmpty: onlyEmpty,
                onChanged: (value) =>
                    ref.read(adminDepartmentFilterProvider.notifier).state =
                        value,
                onClear: () {
                  controller.clear();
                  ref.read(adminDepartmentFilterProvider.notifier).state = '';
                },
                onToggleEmpty: (value) =>
                    ref.read(adminOnlyEmptyDepartmentsProvider.notifier).state =
                        value,
              ),
              const SizedBox(height: 16),
              _StructuresSummaryBar(
                filtered: filteredStats,
                total: totalStats,
                isFiltering: hasQuery || onlyEmpty,
                onClearFilters: clearFilters,
              ),
              const SizedBox(height: 16),
              for (final node in nodes) ...[
                _DepartmentExpansion(node: node, query: filter),
                const SizedBox(height: 12),
              ],
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _ErrorPlaceholder(
        message: error.toString(),
        onRetry: () => ref.invalidate(adminDepartmentTreeProvider),
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
    final trimmedQuery = query.trim();
    return Card(
      elevation: 1,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: _HighlightText(
          text: node.department.name,
          query: trimmedQuery,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: _HighlightText(
          text: '院系ID：${node.department.id} · 学校：${node.department.schoolId}',
          query: trimmedQuery,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: node.classes.isEmpty
            ? const [
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('暂无班级'),
                ),
              ]
            : node.classes
                .map(
                  (clazz) => ListTile(
                    leading: const Icon(Icons.class_outlined),
                    title: _HighlightText(
                      text: clazz.name,
                      query: trimmedQuery,
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: _HighlightText(
                      text: _buildClassSubtitle(clazz),
                      query: trimmedQuery,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _AccountSummaryCard(
              icon: Icons.key_outlined,
              title: '凭证总数',
              value: credentials.length.toString(),
              subtitle: '已启用 $activeCount · 已停用 $disabledCount',
              color: theme.colorScheme.primary,
            ),
            _AccountSummaryCard(
              icon: Icons.remove_red_eye_outlined,
              title: '允许公开访问',
              value: publicReadableCount.toString(),
              subtitle: '开启静态资源直链的凭证数量',
              color: theme.colorScheme.secondary,
            ),
            _AccountSummaryCard(
              icon: Icons.policy_outlined,
              title: '策略总数',
              value: policies.length.toString(),
              subtitle:
                  '启用 $policyEnabledCount · 待调整 ${policies.length - policyEnabledCount}',
              color: theme.colorScheme.tertiary,
            ),
            _AccountSummaryCard(
              icon: Icons.manage_history_outlined,
              title: '近 30 日操作',
              value: logs.length.toString(),
              subtitle: '记录关键凭证与策略变更',
              color: theme.colorScheme.error,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.vpn_key_outlined,
          title: '访问凭证',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('凭证轮换'),
            icon: const Icon(Icons.autorenew_outlined),
            label: const Text('轮换 AccessKey'),
          ),
          child: Column(
            children: [
              for (final credential in credentials) ...[
                _OssCredentialTile(
                  credential: credential,
                  onFeatureTap: onFeatureTap,
                ),
                if (credentials.last != credential) const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.rule_folder_outlined,
          title: '安全策略',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('策略回滚'),
            icon: const Icon(Icons.history_outlined),
            label: const Text('查看历史版本'),
          ),
          child: Column(
            children: [
              for (final policy in policies) ...[
                _OssPolicyTile(policy: policy, onFeatureTap: onFeatureTap),
                if (policies.last != policy) const Divider(height: 24),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.event_note_outlined,
          title: '审计记录',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('导出审计日志'),
            icon: const Icon(Icons.file_download_outlined),
            label: const Text('导出日志'),
          ),
          child: logs.isEmpty
              ? const _EmptyPlaceholder(
                  title: '暂无审计记录',
                  description: '近期未对 OSS 配置进行修改。',
                )
              : Column(
                  children: [
                    for (final log in logs) ...[
                      _OssAuditTile(log: log),
                      if (logs.last != log) const Divider(),
                    ],
                  ],
                ),
        ),
      ],
    );
  }
}

          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _AccountSummaryCard(
              icon: Icons.toggle_on_outlined,
              title: '系统开关',
              value: switches.length.toString(),
              subtitle: '已启用 $enabledSwitchCount · 待确认 ${switches.length - enabledSwitchCount}',
              color: theme.colorScheme.primary,
            ),
            _AccountSummaryCard(
              icon: Icons.settings_suggest_outlined,
              title: '平台参数',
              value: parameters.length.toString(),
              subtitle: '受保护 $lockedParameterCount · 可编辑 ${parameters.length - lockedParameterCount}',
              color: theme.colorScheme.secondary,
            ),
            _AccountSummaryCard(
              icon: Icons.campaign_outlined,
              title: '通知广播',
              value: broadcasts.length.toString(),
              subtitle: '置顶 $pinnedBroadcastCount · 待发送 $scheduledBroadcastCount',
              color: theme.colorScheme.tertiary,
            ),
            _AccountSummaryCard(
              icon: Icons.manage_accounts_outlined,
              title: '审计记录',
              value: audits.length.toString(),
              subtitle: '记录最近 30 日关键操作',
              color: theme.colorScheme.error,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.toggle_on_outlined,
          title: '系统开关',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('导出系统开关'),
            icon: const Icon(Icons.download_outlined),
            label: const Text('导出配置'),
          ),
          child: Column(
            children: [
              for (final item in switches) ...[
                _SystemSwitchTile(item: item, onFeatureTap: onFeatureTap),
                if (switches.last != item) const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.settings_applications_outlined,
          title: '平台参数',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('批量编辑参数'),
            icon: const Icon(Icons.edit_note_outlined),
            label: const Text('批量编辑'),
          ),
          child: Column(
            children: [
              for (final item in parameters) ...[
                _SystemParameterTile(item: item, onFeatureTap: onFeatureTap),
                if (parameters.last != item) const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.campaign_outlined,
          title: '通知广播',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('新建广播'),
            icon: const Icon(Icons.add_alert_outlined),
            label: const Text('新建广播'),
          ),
          child: Column(
            children: [
              for (final item in broadcasts) ...[
                _SystemBroadcastTile(item: item, onFeatureTap: onFeatureTap),
                if (broadcasts.last != item) const Divider(height: 24),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        _AccountSectionCard(
          icon: Icons.rule_outlined,
          title: '审计记录',
          trailing: TextButton.icon(
            onPressed: () => onFeatureTap('导出审计记录'),
            icon: const Icon(Icons.file_download_outlined),
            label: const Text('导出记录'),
          ),
          child: audits.isEmpty
              ? const _EmptyPlaceholder(
                  title: '暂无审计事件',
                  description: '关键操作将自动记录以便追踪。',
                )
              : Column(
                  children: [
                    for (final item in audits) ...[
                      _SystemAuditTile(item: item),
                      if (audits.last != item) const Divider(),
                    ],
                  ],
                ),
        ),
      ],
    );
  }
}

class _PlaceholderContent extends StatelessWidget {
  const _PlaceholderContent({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 12),
          const Text('此页面稍后会接入真实数据与操作。'),
        ],
      ),
    );
  }
}

enum _AccountRoleFilter { all, teachers, students }

String _accountRoleFilterLabel(_AccountRoleFilter filter) {
  return switch (filter) {
    _AccountRoleFilter.all => '全部账号',
    _AccountRoleFilter.teachers => '仅教师',
    _AccountRoleFilter.students => '仅学生',
  };
}

class _AccountSummaryCard extends StatelessWidget {
  const _AccountSummaryCard({
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
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(color: color),
            ),
            const SizedBox(height: 6),
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
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
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _AccountStatusChip extends StatelessWidget {
  const _AccountStatusChip({required this.account});

  final admin_data.AdminAccountItem account;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = account.statusColor(theme);
    return Chip(
      label: Text(account.statusLabel),
      labelStyle: theme.textTheme.labelSmall?.copyWith(color: color),
      backgroundColor: color.withOpacity(0.12),
      side: BorderSide(color: color.withOpacity(0.4)),
    );
  }
}

class _OssCredentialTile extends StatelessWidget {
  const _OssCredentialTile({
    required this.credential,
    required this.onFeatureTap,
  });

  final admin_data.AdminOssCredential credential;
  final void Function(String feature) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = credential.statusColor(theme);
    final icon = credential.isPrimary
        ? Icons.verified_user_outlined
        : Icons.vpn_key_outlined;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: statusColor),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(credential.name, style: theme.textTheme.titleMedium),
                    Text(
                      '${credential.region} · ${credential.bucket}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              _OssStatusChip(label: credential.statusLabel, color: statusColor),
            ],
          ),
          const SizedBox(height: 12),
          Text('Endpoint：${credential.endpoint}'),
          Text('目录前缀：${credential.directoryPrefix}'),
          Text('AccessKey：${credential.accessKeyMasked}'),
          Text('${credential.createdAtLabel} · ${credential.lastRotatedLabel}'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _OssFlagChip(
                icon: credential.allowPublicRead
                    ? Icons.public
                    : Icons.public_off,
                label: credential.allowPublicRead ? '公开读取已开启' : '公开读取关闭',
                active: credential.allowPublicRead,
              ),
              _OssFlagChip(
                icon: credential.allowMultipartUpload
                    ? Icons.layers_outlined
                    : Icons.filter_1_outlined,
                label: credential.allowMultipartUpload ? '支持分片上传' : '仅单文件上传',
                active: credential.allowMultipartUpload,
              ),
              if (credential.isPrimary)
                _OssFlagChip(
                  icon: Icons.star_rate_outlined,
                  label: '主凭证',
                  active: true,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              TextButton.icon(
                onPressed: () => onFeatureTap('复制凭证配置'),
                icon: const Icon(Icons.copy_all_outlined),
                label: const Text('复制配置'),
              ),
              TextButton.icon(
                onPressed: () => onFeatureTap('绑定环境变量'),
                icon: const Icon(Icons.settings_ethernet_outlined),
                label: const Text('推送至环境'),
              ),
              if (credential.active)
                TextButton.icon(
                  onPressed: () => onFeatureTap('临时停用凭证'),
                  icon: const Icon(Icons.pause_circle_outline),
                  label: const Text('临时停用'),
                )
              else
                TextButton.icon(
                  onPressed: () => onFeatureTap('重新启用凭证'),
                  icon: const Icon(Icons.play_circle_outline),
                  label: const Text('重新启用'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OssPolicyTile extends StatelessWidget {
  const _OssPolicyTile({required this.policy, required this.onFeatureTap});

  final admin_data.AdminOssPolicy policy;
  final void Function(String feature) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = policy.status.color(theme);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.rule_outlined, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(policy.name, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(policy.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 6),
                  Text(
                    '适用范围：${policy.appliesTo}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    policy.lastUpdatedLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            _OssStatusChip(label: policy.status.label, color: color),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            TextButton.icon(
              onPressed: () => onFeatureTap('编辑策略'),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('编辑'),
            ),
            TextButton.icon(
              onPressed: () => onFeatureTap('策略发布审批'),
              icon: const Icon(Icons.approval_outlined),
              label: const Text('提交审批'),
            ),
            TextButton.icon(
              onPressed: () => onFeatureTap('策略克隆'),
              icon: const Icon(Icons.copy_outlined),
              label: const Text('克隆'),
            ),
          ],
        ),
      ],
    );
  }
}

class _OssAuditTile extends StatelessWidget {
  const _OssAuditTile({required this.log});

  final admin_data.AdminOssAuditLog log;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Icon(
          Icons.event_note_outlined,
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
      title: Text(log.action, style: theme.textTheme.titleMedium),
      subtitle: Text('${log.operator} · ${log.timeLabel}\n${log.detail}'),
      trailing: IconButton(
        tooltip: '查看详情',
        icon: const Icon(Icons.open_in_new_outlined),
        onPressed: () => _showDevelopmentToast(context, '审计详情'),
      ),
    );
  }
}

class _OssStatusChip extends StatelessWidget {
  const _OssStatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(color: color),
      backgroundColor: color.withOpacity(0.12),
      side: BorderSide(color: color.withOpacity(0.4)),
    );
  }
}

class _OssFlagChip extends StatelessWidget {
  const _OssFlagChip({
    required this.icon,
    required this.label,
    required this.active,
  });

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = active
        ? theme.colorScheme.secondary
        : theme.colorScheme.outline;
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      labelStyle: theme.textTheme.labelSmall?.copyWith(color: color),
      backgroundColor: color.withOpacity(0.08),
      side: BorderSide(color: color.withOpacity(0.4)),
    );
  }
}

class _SystemSwitchTile extends StatelessWidget {
  const _SystemSwitchTile({
    required this.item,
    required this.onFeatureTap,
  });

  final admin_data.AdminSystemSwitch item;
  final void Function(String feature) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = item.enabled
        ? theme.colorScheme.primary
        : theme.colorScheme.outline;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(item.icon, color: color),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        _SystemStatusChip(
                          label: item.enabled ? '已启用' : '已停用',
                          color: color,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(item.description),
                    const SizedBox(height: 6),
                    Text(
                      '${item.environment} · 负责人：${item.responsible}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      item.lastUpdatedLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    if (item.tags.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final tag in item.tags)
                            _SystemTagChip(label: tag),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Switch.adaptive(
                value: item.enabled,
                onChanged: (_) => onFeatureTap('切换 ${item.title}'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              TextButton.icon(
                onPressed: () => onFeatureTap('查看依赖 ${item.title}'),
                icon: const Icon(Icons.link_outlined),
                label: const Text('查看依赖'),
              ),
              TextButton.icon(
                onPressed: () => onFeatureTap('编辑窗口 ${item.title}'),
                icon: const Icon(Icons.schedule_outlined),
                label: const Text('编辑时间窗'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SystemParameterTile extends StatelessWidget {
  const _SystemParameterTile({
    required this.item,
    required this.onFeatureTap,
  });

  final admin_data.AdminSystemParameter item;
  final void Function(String feature) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = item.locked
        ? theme.colorScheme.error
        : theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tune_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.key, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('当前值：${item.value}'),
                    const SizedBox(height: 4),
                    Text(item.description),
                    const SizedBox(height: 6),
                    Text(
                      '${item.scope} · ${item.lastUpdatedLabel}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              _SystemStatusChip(
                label: item.locked ? '已锁定' : '可编辑',
                color: color,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              TextButton.icon(
                onPressed: () => onFeatureTap('编辑参数 ${item.key}'),
                icon: const Icon(Icons.edit_outlined),
                label: const Text('编辑'),
              ),
              if (item.locked)
                TextButton.icon(
                  onPressed: () => onFeatureTap('解锁参数 ${item.key}'),
                  icon: const Icon(Icons.lock_open_outlined),
                  label: const Text('解除锁定'),
                )
              else
                TextButton.icon(
                  onPressed: () => onFeatureTap('锁定参数 ${item.key}'),
                  icon: const Icon(Icons.lock_outline),
                  label: const Text('锁定'),
                ),
              TextButton.icon(
                onPressed: () => onFeatureTap('复制参数 ${item.key}'),
                icon: const Icon(Icons.copy_outlined),
                label: const Text('复制'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SystemBroadcastTile extends StatelessWidget {
  const _SystemBroadcastTile({
    required this.item,
    required this.onFeatureTap,
  });

  final admin_data.AdminSystemBroadcast item;
  final void Function(String feature) onFeatureTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = item.status.color(theme);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.campaign_outlined, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      if (item.pinned)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.push_pin_outlined,
                            size: 18,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      _SystemStatusChip(
                        label: item.status.label,
                        color: statusColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(item.messagePreview),
                  const SizedBox(height: 6),
                  Text(
                    '${item.targetLabel} · ${item.scheduleLabel}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '创建人：${item.createdBy}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            TextButton.icon(
              onPressed: () => onFeatureTap('预览广播 ${item.title}'),
              icon: const Icon(Icons.remove_red_eye_outlined),
              label: const Text('预览'),
            ),
            TextButton.icon(
              onPressed: () => onFeatureTap('编辑广播 ${item.title}'),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('编辑'),
            ),
            switch (item.status) {
              admin_data.AdminSystemBroadcastStatus.scheduled => TextButton.icon(
                  onPressed: () => onFeatureTap('取消排程 ${item.title}'),
                  icon: const Icon(Icons.event_busy_outlined),
                  label: const Text('取消排程'),
                ),
              admin_data.AdminSystemBroadcastStatus.draft => TextButton.icon(
                  onPressed: () => onFeatureTap('提交审批 ${item.title}'),
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('提交审批'),
                ),
              admin_data.AdminSystemBroadcastStatus.sent => TextButton.icon(
                  onPressed: () => onFeatureTap('复制广播 ${item.title}'),
                  icon: const Icon(Icons.copy_outlined),
                  label: const Text('复制公告'),
                ),
            },
          ],
        ),
      ],
    );
  }
}

class _SystemAuditTile extends StatelessWidget {
  const _SystemAuditTile({required this.item});

  final admin_data.AdminSystemAuditLog item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = _iconForCategory(item.category);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Icon(icon, color: theme.colorScheme.onPrimaryContainer),
      ),
      title: Text(item.action, style: theme.textTheme.titleMedium),
      subtitle: Text(
        '${item.category} · ${item.operator} · ${item.timeLabel}\n${item.detail}',
      ),
      trailing: IconButton(
        tooltip: '查看详情',
        icon: const Icon(Icons.open_in_new_outlined),
        onPressed: () => _showDevelopmentToast(context, '审计详情'),
      ),
    );
  }

  IconData _iconForCategory(String category) {
    final lower = category.toLowerCase();
    if (lower.contains('通知')) {
      return Icons.campaign_outlined;
    }
    if (lower.contains('安全')) {
      return Icons.shield_outlined;
    }
    if (lower.contains('参数')) {
      return Icons.tune_outlined;
    }
    return Icons.assessment_outlined;
  }
}

class _SystemStatusChip extends StatelessWidget {
  const _SystemStatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color,
          ),
      backgroundColor: color.withOpacity(0.12),
      side: BorderSide(color: color.withOpacity(0.4)),
    );
  }
}

class _SystemTagChip extends StatelessWidget {
  const _SystemTagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(label),
      labelStyle: theme.textTheme.labelSmall,
      backgroundColor: theme.colorScheme.secondaryContainer,
      side: BorderSide(color: theme.colorScheme.secondaryContainer),
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

class _DepartmentExpansion extends StatelessWidget {
  const _DepartmentExpansion({required this.node, required this.query});

  final DepartmentNode node;
  final String query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trimmedQuery = query.trim();
    return Card(
      elevation: 1,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: _HighlightText(
          text: node.department.name,
          query: trimmedQuery,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: _HighlightText(
          text: '院系ID：${node.department.id} · 学校：${node.department.schoolId}',
          query: trimmedQuery,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        children: node.classes.isEmpty
            ? const [
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('暂无班级'),
                ),
              ]
            : node.classes
                  .map(
                    (clazz) => ListTile(
                      leading: const Icon(Icons.class_outlined),
class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_tree_outlined,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
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
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text('加载失败', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
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

class _AdminStatsCard extends StatelessWidget {
  const _AdminStatsCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    this.action,
  });

  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 220, maxWidth: 320),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 12),
              Text(
                value,
                style: theme.textTheme.headlineMedium?.copyWith(color: color),
              ),
              const SizedBox(height: 4),
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              if (action != null) ...[const SizedBox(height: 12), action!],
            ],
          ),
        ),
      ),
    );
  }
}

class _StructuresSummaryBar extends StatelessWidget {
  const _StructuresSummaryBar({
    required this.filtered,
    required this.total,
    required this.isFiltering,
    required this.onClearFilters,
  });

  final AdminDepartmentMetrics? filtered;
  final AdminDepartmentMetrics? total;
  final bool isFiltering;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final departmentCount = filtered?.departmentCount;
    final classCount = filtered?.classCount;
    final totalDepartments = total?.departmentCount;
    final totalClasses = total?.classCount;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text('当前列表统计', style: theme.textTheme.titleMedium),
                const Spacer(),
                if (isFiltering)
                  TextButton.icon(
                    onPressed: onClearFilters,
                    icon: const Icon(Icons.filter_alt_off_outlined),
                    label: const Text('清除筛选'),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (departmentCount != null && classCount != null)
              Text(
                '显示院系：$departmentCount · 班级：$classCount',
                style: theme.textTheme.bodyMedium,
              )
            else
              const LinearProgressIndicator(minHeight: 2),
            if (totalDepartments != null && totalClasses != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '全部院系：$totalDepartments · 班级：$totalClasses',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            if (isFiltering)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '已应用筛选条件，列表仅展示匹配结果。',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HighlightText extends StatelessWidget {
  const _HighlightText({required this.text, required this.query, this.style});

  final String text;
  final String query;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) {
      return Text(text, style: effectiveStyle);
    }

    final theme = Theme.of(context);
    final highlightColor = theme.colorScheme.secondaryContainer;
    final highlightTextColor = theme.colorScheme.onSecondaryContainer;

    final lowerText = text.toLowerCase();
    final lowerQuery = trimmedQuery.toLowerCase();
    var start = 0;
    final spans = <TextSpan>[];

    while (true) {
      final index = lowerText.indexOf(lowerQuery, start);
      if (index == -1) {
        if (start < text.length) {
          spans.add(
            TextSpan(text: text.substring(start), style: effectiveStyle),
          );
        }
        break;
      }

      if (index > start) {
        spans.add(
          TextSpan(text: text.substring(start, index), style: effectiveStyle),
        );
      }

      spans.add(
        TextSpan(
          text: text.substring(index, index + trimmedQuery.length),
          style: effectiveStyle.copyWith(
            backgroundColor: highlightColor,
            color: highlightTextColor,
          ),
        ),
      );

      start = index + trimmedQuery.length;
    }

    return RichText(text: TextSpan(children: spans));
  }
}

class _StructuresSearchField extends StatelessWidget {
  const _StructuresSearchField({
    required this.controller,
    required this.hasQuery,
    required this.onlyEmpty,
    required this.onChanged,
    required this.onClear,
    required this.onToggleEmpty,
  });

  final TextEditingController controller;
  final bool hasQuery;
  final bool onlyEmpty;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final ValueChanged<bool> onToggleEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: '搜索院系或班级',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: hasQuery
                ? IconButton(onPressed: onClear, icon: const Icon(Icons.clear))
                : null,
            border: const OutlineInputBorder(),
          ),
          onChanged: onChanged,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            FilterChip(
              label: const Text('仅显示未配置班级'),
              selected: onlyEmpty,
              onSelected: onToggleEmpty,
            ),
          ],
        ),
      ],
    );
  }
}

class _SearchEmptyPlaceholder extends StatelessWidget {
  const _SearchEmptyPlaceholder({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            '未找到“$query”的匹配项',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '请调整关键词，或前往后台新增院系与班级。',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
