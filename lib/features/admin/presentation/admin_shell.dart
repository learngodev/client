import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../auth/application/school_list_provider.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/domain/account.dart';
import '../../auth/domain/school.dart';

enum AdminSection { overview, accounts, structures, schedule, oss, system, ai }

extension AdminSectionX on AdminSection {
  String get label {
    return switch (this) {
      AdminSection.overview => '总览',
      AdminSection.accounts => '账号管理',
      AdminSection.structures => '院系班级',
      AdminSection.schedule => '教务管理',
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
      error: (_, _) => account?.schoolId ?? '',
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
        onTap: () => context.go('/admin/profile'),
      ),
      child: child,
    );
  }
}
