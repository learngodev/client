import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/pill_button.dart';
import '../../auth/application/school_list_provider.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/domain/account.dart';
import '../../auth/domain/school.dart';

enum AdminSection {
  overview,
  accounts,
  structures,
  schedule,
  classrooms,
  oss,
  system,
  ai,
}

extension AdminSectionX on AdminSection {
  String get label {
    return switch (this) {
      AdminSection.overview => '总览',
      AdminSection.accounts => '账号管理',
      AdminSection.structures => '院系班级',
      AdminSection.schedule => '教务管理',
      AdminSection.classrooms => '教室管理',
      AdminSection.oss => 'OSS 配置',
      AdminSection.system => '系统设置',
      AdminSection.ai => 'AI 配置',
    };
  }

  IconData get icon {
    return switch (this) {
      AdminSection.overview => Icons.dashboard_outlined,
      AdminSection.accounts => Icons.people_alt_outlined,
      AdminSection.structures => Icons.account_tree_outlined,
      AdminSection.schedule => Icons.school_outlined,
      AdminSection.classrooms => Icons.room_outlined,
      AdminSection.oss => Icons.cloud_upload_outlined,
      AdminSection.system => Icons.settings_outlined,
      AdminSection.ai => Icons.psychology_outlined,
    };
  }

  String get path {
    return switch (this) {
      AdminSection.overview => '/admin',
      AdminSection.accounts => '/admin/accounts',
      AdminSection.structures => '/admin/structures',
      AdminSection.schedule => '/admin/schedule',
      AdminSection.classrooms => '/admin/classrooms',
      AdminSection.oss => '/admin/oss',
      AdminSection.system => '/admin/system',
      AdminSection.ai => '/admin/ai',
    };
  }
}

class AdminShell extends HookConsumerWidget {
  const AdminShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;
    final schoolsAsync = ref.watch(schoolListProvider);
    final schoolName = schoolsAsync.when(
      data: (schools) => schools
          .firstWhere(
            (s) => s.id == account?.schoolId,
            orElse: () => School(id: '', name: account?.schoolId ?? ''),
          )
          .name,
      loading: () => '加载中...',
      error: (_, __) => account?.schoolId ?? '',
    );

    final destinations = AdminSection.values
        .map(
          (section) => AdaptiveDestination(
            label: section.label,
            icon: section.icon,
            selectedIcon: section.icon,
          ),
        )
        .toList();

    final location = state.matchedLocation;
    final currentSection = AdminSection.values.firstWhere(
      (section) =>
          location == section.path ||
          (section != AdminSection.overview &&
              location.startsWith(section.path)),
      orElse: () => AdminSection.overview,
    );

    final currentIndex = AdminSection.values.indexOf(currentSection);

    return AdaptiveNavigationScaffold(
      destinations: destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final section = AdminSection.values[index];
        if (section.path != location) {
          context.go(section.path);
        }
      },
      hideAppBar: true,
      appBarTitle: null,
      userInfo: NavUserInfo(
        title: account?.displayName ?? '未登录',
        subtitle: account != null
            ? '学校：$schoolName · ${account.role.label}'
            : '请登录以查看个人信息',
        onTap: () => _showProfile(context, ref, account),
      ),
      child: child,
    );
  }

  void _showProfile(BuildContext context, WidgetRef ref, Account? account) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final schoolsAsync = ref.watch(schoolListProvider);
            final schoolName = schoolsAsync.when(
              data: (schools) {
                if (account == null) return '';
                final school = schools.firstWhere(
                  (s) => s.id == account.schoolId,
                  orElse: () => School(id: '', name: account.schoolId),
                );
                return school.name;
              },
              loading: () => '加载中...',
              error: (_, __) => account?.schoolId ?? '',
            );

            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: GlassCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.secondary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _initial(account?.displayName),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account?.displayName ?? '未登录',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  account != null
                                      ? '学校：$schoolName · ${account.identifier}'
                                      : '请登录后查看',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: PillButton(
                            label: '退出登录',
                            icon: Icons.logout,
                            variant: PillButtonVariant.outline,
                            onPressed: account == null
                                ? null
                                : () {
                                    Navigator.pop(context);
                                    ref
                                        .read(authStateProvider.notifier)
                                        .signOut();
                                  },
                          ),
                        ),
                        const SizedBox(width: 12),
                        PillButton(
                          label: '关闭',
                          variant: PillButtonVariant.ghost,
                          compact: true,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _initial(String? name) {
    if (name == null || name.isEmpty) return '?';
    return name.characters.first;
  }
}
