import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../auth/application/auth_controller.dart';

enum AdminSection { overview, accounts, structures, oss, system }

extension AdminSectionX on AdminSection {
  String get label {
    return switch (this) {
      AdminSection.overview => '总览',
      AdminSection.accounts => '账号管理',
      AdminSection.structures => '院系班级',
      AdminSection.oss => 'OSS 配置',
      AdminSection.system => '系统设置',
    };
  }

  IconData get icon {
    return switch (this) {
      AdminSection.overview => Icons.dashboard_outlined,
      AdminSection.accounts => Icons.people_alt_outlined,
      AdminSection.structures => Icons.account_tree_outlined,
      AdminSection.oss => Icons.cloud_upload_outlined,
      AdminSection.system => Icons.settings_outlined,
    };
  }

  String get path {
    return switch (this) {
      AdminSection.overview => '/admin',
      AdminSection.accounts => '/admin/accounts',
      AdminSection.structures => '/admin/structures',
      AdminSection.oss => '/admin/oss',
      AdminSection.system => '/admin/system',
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
      appBarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('乐学后台管理'),
          if (account != null)
            Text(
              '当前学校：${account.schoolId} · 管理员：${account.displayName}',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Colors.white70),
            ),
        ],
      ),
      appBarActions: [
        IconButton(
          tooltip: '退出登录',
          onPressed: () => ref.read(authStateProvider.notifier).signOut(),
          icon: const Icon(Icons.logout),
        ),
      ],
      child: child,
    );
  }
}
