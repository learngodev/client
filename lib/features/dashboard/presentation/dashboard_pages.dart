import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../admin/application/admin_providers.dart';
import '../../admin/presentation/admin_shell.dart';
import '../../auth/application/auth_controller.dart';
import '../../teacher/domain/sample_data.dart' as teacher_data;
import '../../teacher/presentation/teacher_shell.dart';

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
          onPressed: ref.read(authStateProvider.notifier).signOut,
          icon: const Icon(Icons.logout),
        ),
      ],
      child: metrics.when(
        data: (stats) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(adminDepartmentTreeProvider);
            await ref.read(adminDepartmentTreeProvider.future);
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
          onRetry: () => ref.invalidate(adminDepartmentTreeProvider),
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
    final tasks = teacher_data.teacherPendingTasks;
    final messages = teacher_data.teacherRecentMessages;
    final quickActions = _teacherQuickActions;
    final insights = teacher_data.teacherInsights;
    final stats = [
      _DashboardStatCard(
        icon: Icons.event_note_outlined,
        title: '今日课程',
        value: schedule.length.toString(),
        accent: theme.colorScheme.primary,
        onTap: () => context.go(TeacherSection.schedule.path),
      ),
      _DashboardStatCard(
        icon: Icons.assignment_turned_in_outlined,
        title: '待批改',
        value: tasks.where((task) => task.isGrading).length.toString(),
        accent: theme.colorScheme.secondary,
        onTap: () => context.go(TeacherSection.assignments.path),
      ),
      _DashboardStatCard(
        icon: Icons.mark_chat_unread_outlined,
        title: '未读消息',
        value: messages.length.toString(),
        accent: theme.colorScheme.tertiary,
        onTap: () => context.go(TeacherSection.conversations.path),
      ),
    ];

    return _DashboardScaffold(
      title: '教师工作台',
      subtitle: '欢迎 ${account?.displayName ?? ''}',
      actions: [
        IconButton(
          tooltip: '退出登录',
          onPressed: ref.read(authStateProvider.notifier).signOut,
          icon: const Icon(Icons.logout),
        ),
      ],
      child: ListView(
        padding: const EdgeInsets.all(24),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Wrap(spacing: 12, runSpacing: 12, children: stats),
          const SizedBox(height: 24),
          _TeacherCard(
            icon: Icons.insights_outlined,
            title: '教学洞察',
            description: '根据近期数据识别课堂风险与工作重点。',
            children: [
              for (var index = 0; index < insights.length; index++) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          insights[index].icon,
                          color: insights[index].barColor(theme),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                insights[index].label,
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                insights[index].hint,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          insights[index].value,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: insights[index].progress,
                        backgroundColor: theme.colorScheme.surfaceVariant
                            .withOpacity(0.5),
                        valueColor: AlwaysStoppedAnimation(
                          insights[index].barColor(theme),
                        ),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
                if (index < insights.length - 1) const Divider(height: 24),
              ],
            ],
          ),
          const SizedBox(height: 24),
          _TeacherCard(
            icon: Icons.schedule_outlined,
            title: '今日课表',
            description: '掌握当日教学安排，及时调整授课节奏。',
            children: [
              for (var index = 0; index < schedule.length; index++) ...[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Text(
                      schedule[index].startTime,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  title: Text(schedule[index].course),
                  subtitle: Text(
                    '${schedule[index].timeRange} · ${schedule[index].className}',
                  ),
                  trailing: Text(schedule[index].location),
                ),
                if (index < schedule.length - 1) const Divider(height: 16),
              ],
            ],
          ),
          const SizedBox(height: 16),
          _TeacherCard(
            icon: Icons.task_alt_outlined,
            title: '待处理事项',
            description: '查看批改与审批任务，保持教学进度。',
            children: [
              for (var index = 0; index < tasks.length; index++) ...[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    tasks[index].icon,
                    color: tasks[index].iconColor(theme),
                  ),
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].subtitle),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        tasks[index].deadlineLabel,
                        style: theme.textTheme.labelMedium,
                      ),
                      if (tasks[index].route != null)
                        TextButton(
                          onPressed: () => context.go(tasks[index].route!),
                          child: const Text('前往处理'),
                        ),
                    ],
                  ),
                ),
                if (index < tasks.length - 1) const Divider(height: 16),
              ],
            ],
          ),
          const SizedBox(height: 16),
          _TeacherCard(
            icon: Icons.mark_chat_unread_outlined,
            title: '最近消息',
            description: '关注学生与家长的反馈，保持顺畅沟通。',
            children: [
              for (var index = 0; index < messages.length; index++) ...[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Text(
                      messages[index].initials,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  title: Text(messages[index].sender),
                  subtitle: Text(messages[index].preview),
                  trailing: Text(
                    messages[index].timeLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  onTap: () => context.go(TeacherSection.conversations.path),
                ),
                if (index < messages.length - 1) const Divider(height: 16),
              ],
            ],
          ),
          const SizedBox(height: 24),
          _DashboardSectionHeader(
            icon: Icons.flash_on_outlined,
            title: '快捷操作',
            description: '常用教学入口，帮助你快速完成日常任务。',
          ),
          const SizedBox(height: 12),
          ...quickActions.map(
            (action) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _QuickActionCard(action: action),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentDashboardPage extends HookConsumerWidget {
  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;
    return _DashboardScaffold(
      title: '学生空间',
      subtitle: '欢迎 ${account?.displayName ?? ''}',
      actions: [
        IconButton(
          tooltip: '退出登录',
          onPressed: ref.read(authStateProvider.notifier).signOut,
          icon: const Icon(Icons.logout),
        ),
      ],
      child: const Center(child: Text('学生端功能模块待实现')),
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
    return Scaffold(
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

class _TeacherCard extends StatelessWidget {
  const _TeacherCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.children,
  });

  final IconData icon;
  final String title;
  final String description;
  final List<Widget> children;

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
                Text(title, style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surfaceVariant.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: accent, size: 28),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(color: accent),
            ),
            const SizedBox(height: 6),
            Text(title, style: theme.textTheme.titleMedium),
          ],
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

const List<_QuickAction> _teacherQuickActions = [
  _QuickAction(
    icon: Icons.assignment_outlined,
    title: '布置作业',
    subtitle: '选择班级并发布新的作业或考试',
    route: '/teacher/assignments',
  ),
  _QuickAction(
    icon: Icons.playlist_add_check_outlined,
    title: '批改提交',
    subtitle: '查看学生提交记录并完成批改反馈',
    route: '/teacher/assignments',
  ),
  _QuickAction(
    icon: Icons.event_available_outlined,
    title: '管理课程表',
    subtitle: '调整课程节次、审批调课请求',
    route: '/teacher/schedule',
  ),
  _QuickAction(
    icon: Icons.chat_bubble_outline,
    title: '消息中心',
    subtitle: '快速回复学生与家长的咨询消息',
    route: '/teacher/conversations',
  ),
];
