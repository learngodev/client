import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/application/auth_controller.dart';
import '../../auth/application/school_list_provider.dart';
import '../../auth/domain/account.dart';
import '../../auth/domain/school.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;

    final schoolsAsync = ref.watch(schoolListProvider);
    final schoolName = schoolsAsync.when(
      data: (schools) {
        if (account == null) return '';
        if (account.schoolId.isEmpty) return '';
        return schools
            .firstWhere(
              (s) => s.id == account.schoolId,
              orElse: () =>
                  School(id: account.schoolId, name: account.schoolId),
            )
            .name;
      },
      loading: () => account?.schoolId.isNotEmpty == true ? '加载中...' : '',
      error: (_, _) => account?.schoolId ?? '',
    );

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          _ProfileHeader(account: account, schoolName: schoolName),
          const SizedBox(height: 12),
          _InfoCard(account: account, schoolName: schoolName),
          const SizedBox(height: 24),
          const _GeneralSection(),
          const SizedBox(height: 24),
          _DangerZone(account: account),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.account, required this.schoolName});

  final Account? account;
  final String schoolName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = account?.displayName ?? '未登录';
    final subtitle = account == null
        ? '请登录后查看完整信息'
        : [
            if (schoolName.isNotEmpty) '学校：$schoolName',
            account!.identifier,
            account!.role.label,
          ].join(' · ');

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withValues(alpha: 0.15),
            theme.colorScheme.secondary.withValues(alpha: 0.08),
          ],
        ),
      ),
      child: Row(
        children: [
          _Avatar(
            initial: name.characters.isNotEmpty ? name.characters.first : '?',
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withValues(
                      alpha: 0.7,
                    ),
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.account, required this.schoolName});

  final Account? account;
  final String schoolName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final schoolText = account == null
        ? '未登录'
        : account!.schoolId.isEmpty
        ? '未绑定'
        : (schoolName.isNotEmpty && schoolName != account!.schoolId)
        ? '$schoolName（${account!.schoolId}）'
        : schoolName;

    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('学校'),
            subtitle: Text(schoolText),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: const Text('账号'),
            subtitle: Text(account?.identifier ?? '未登录'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text('身份'),
            subtitle: Text(account?.role.label ?? '未登录'),
          ),
        ],
      ),
    );
  }
}

class _GeneralSection extends StatelessWidget {
  const _GeneralSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('设置'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }
}

class _DangerZone extends ConsumerWidget {
  const _DangerZone({required this.account});

  final Account? account;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.errorContainer.withValues(alpha: 0.18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: Icon(Icons.logout, color: theme.colorScheme.error),
        title: Text(
          '退出登录',
          style: TextStyle(
            color: theme.colorScheme.error,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          account == null ? '当前未登录' : '退出当前账号并返回登录页',
          style: TextStyle(
            color: theme.colorScheme.error.withValues(alpha: 0.8),
          ),
        ),
        onTap: account == null
            ? null
            : () async {
                await ref.read(authControllerProvider.notifier).signOut();
                if (context.mounted) {
                  context.go('/sign-in');
                }
              },
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
      ),
    );
  }
}
