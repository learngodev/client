import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../admin/application/admin_providers.dart';
import '../../admin/presentation/admin_shell.dart';
import '../../auth/application/auth_controller.dart';
import '../../teacher/domain/sample_data.dart' as teacher_data;

class AdminDashboardPage extends HookConsumerWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;
    final metrics = ref.watch(adminDepartmentMetricsProvider);
    final theme = Theme.of(context);
    return _DashboardScaffold(
      title: '管理员后台',
      subtitle: '欢迎 ${account?.displayName ?? ''}',
      actions: [
        IconButton(
          tooltip: '退出登录',
          onPressed: ref.read(authControllerProvider.notifier).signOut,
          icon: const Icon(Icons.logout),
        ),
      ],
      child: metrics.when(
        data: (stats) => RefreshIndicator(
          onRefresh: () async {
            await ref.read(adminDepartmentTreeProvider.notifier).refresh();
          },
          child: ListView(
            padding: const EdgeInsets.all(24),
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('校务概览', style: theme.textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(
                        '快速浏览基础数据，点击任意卡片可跳转到对应模块继续配置。',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _DashboardStatCard(
                    icon: Icons.apartment,
                    title: '院系总数',
                    value: stats.departmentCount.toString(),
                    accent: theme.colorScheme.primary,
                    onTap: () => context.go(AdminSection.structures.path),
                  ),
                  _DashboardStatCard(
                    icon: Icons.class_outlined,
                    title: '班级总数',
                    value: stats.classCount.toString(),
                    accent: theme.colorScheme.secondary,
                    onTap: () => context.go(AdminSection.structures.path),
                  ),
                  _DashboardStatCard(
                    icon: Icons.pending_actions_outlined,
                    title: '待补充院系',
                    value: stats.emptyDepartmentCount.toString(),
                    accent: theme.colorScheme.error,
                    onTap: () => context.go(AdminSection.structures.path),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _DashboardSectionHeader(
                icon: Icons.flash_on_outlined,
                title: '快捷操作',
                description: '常用后台入口，帮助你快速定位核心任务。',
              ),
              const SizedBox(height: 12),
              ..._adminQuickActions.map(
                (action) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _QuickActionCard(action: action),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('下一步', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('· 完成院系与班级数据维护，确保教师与学生归属准确。'),
                      Text('· 后续将开放账号管理、系统设置等模块，敬请期待。'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _DashboardErrorCard(
          message: error.toString(),
          onRetry: () {
            ref.read(adminDepartmentTreeProvider.notifier).refresh();
          },
        ),
      ),
    );
  }
}

class TeacherDashboardPage extends HookConsumerWidget {
  const TeacherDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;
    final theme = Theme.of(context);
    final schedule = teacher_data.teacherTodaySchedule;
    final gradingTasks = teacher_data.teacherPendingTasks
        .where((t) => t.isGrading)
        .toList();

    // Mock classes data since it's not in sample_data
    final classes = [
      {'name': '2023 级计科 1 班', 'studentCount': 45, 'course': '线性代数'},
      {'name': '2023 级计科 2 班', 'studentCount': 42, 'course': '高等数学'},
      {'name': '2023 级计科 3 班', 'studentCount': 44, 'course': '线性代数'},
    ];

    return _DashboardScaffold(
      title: '教师工作台',
      subtitle: '欢迎 ${account?.displayName ?? ''}',
      actions: [
        IconButton(
          tooltip: '退出登录',
          onPressed: ref.read(authControllerProvider.notifier).signOut,
          icon: const Icon(Icons.logout),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // 1. 作业情况 (Homework Status) - Prominent
          _TeacherSectionHeader(title: '作业情况', icon: Icons.assignment_outlined),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _InfoCard(
                  title: '待批改',
                  value: gradingTasks.length.toString(),
                  unit: '份',
                  icon: Icons.rate_review_outlined,
                  color: theme.colorScheme.primary,
                  onTap: () => context.go('/teacher/assignments'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoCard(
                  title: '批改完成率',
                  value: '68', // Mocked from insights
                  unit: '%',
                  icon: Icons.pie_chart_outline,
                  color: theme.colorScheme.tertiary,
                  onTap: () => context.go('/teacher/assignments'),
                ),
              ),
            ],
          ),
          if (gradingTasks.isNotEmpty) ...[
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: gradingTasks
                    .map(
                      (task) => ListTile(
                        title: Text(task.title),
                        subtitle: Text(task.subtitle),
                        trailing: TextButton(
                          onPressed: () =>
                              context.go(task.route ?? '/teacher/assignments'),
                          child: const Text('去批改'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],

          const SizedBox(height: 24),

          // 2. 所属班级 (Class Information)
          _TeacherSectionHeader(title: '所属班级', icon: Icons.people_outline),
          const SizedBox(height: 12),
          ...classes.map(
            (cls) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.class_outlined,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
                title: Text(cls['name'] as String),
                subtitle: Text(
                  '课程：${cls['course']} · ${cls['studentCount']} 人',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to class details if available
                },
              ),
            ),
          ),

          const SizedBox(height: 12),

          // 3. 课程安排 (Course Schedule)
          _TeacherSectionHeader(title: '课程安排', icon: Icons.calendar_today),
          const SizedBox(height: 12),
          if (schedule.isEmpty)
            const Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('今日无课程安排')),
              ),
            )
          else
            ...schedule.map(
              (item) => Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.startTime,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    item.course,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${item.className} · ${item.location}'),
                  onTap: () => context.go('/teacher/schedule'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TeacherSectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _TeacherSectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color.withValues(alpha: 0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      unit,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: color.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardScaffold extends StatelessWidget {
  const _DashboardScaffold({
    required this.title,
    required this.child,
    this.subtitle,
    this.actions,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.white70),
                ),
            ],
          ),
          actions: actions,
        ),
        body: child,
      ),
    );
  }
}

class _DashboardSectionHeader extends StatelessWidget {
  const _DashboardSectionHeader({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.accent,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color accent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accent, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                value,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAction {
  const _QuickAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({required this.action});

  final _QuickAction action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(action.icon, color: theme.colorScheme.onPrimaryContainer),
        ),
        title: Text(action.title),
        subtitle: Text(action.subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.go(action.route),
      ),
    );
  }
}

class _DashboardErrorCard extends StatelessWidget {
  const _DashboardErrorCard({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
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
              Text('数据加载失败', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                message,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<_QuickAction> _adminQuickActions = [
  _QuickAction(
    icon: Icons.account_tree_outlined,
    title: '管理院系与班级',
    subtitle: '建立学校组织架构，支撑课程分配',
    route: '/admin/structures',
  ),
  _QuickAction(
    icon: Icons.people_alt_outlined,
    title: '账号与角色',
    subtitle: '创建教师与学生账号，分配权限',
    route: '/admin/accounts',
  ),
  _QuickAction(
    icon: Icons.cloud_upload_outlined,
    title: 'OSS 上传配置',
    subtitle: '配置文件上传凭证，保障资料安全',
    route: '/admin/oss',
  ),
  _QuickAction(
    icon: Icons.settings_outlined,
    title: '系统参数',
    subtitle: '统一维护公告、平台参数与日志',
    route: '/admin/system',
  ),
];
