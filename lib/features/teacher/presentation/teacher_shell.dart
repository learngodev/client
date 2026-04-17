import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../im/application/im_providers.dart';
import '../../notification/application/notification_provider.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/domain/account.dart';
import '../application/teacher_assignment_provider.dart';

enum TeacherSection { overview, schedule, courses, assignments, resources, conversations }

extension TeacherSectionX on TeacherSection {
  String get label {
    return switch (this) {
      TeacherSection.overview => '概览',
      TeacherSection.schedule => '课表',
      TeacherSection.courses => '课程',
      TeacherSection.assignments => '作业',
      TeacherSection.resources => '资源',
      TeacherSection.conversations => '消息',
    };
  }

  IconData get icon {
    return switch (this) {
      TeacherSection.overview => Icons.dashboard_customize_outlined,
      TeacherSection.schedule => Icons.event_note_outlined,
      TeacherSection.courses => Icons.class_outlined,
      TeacherSection.assignments => Icons.assignment_outlined,
      TeacherSection.resources => Icons.folder_outlined,
      TeacherSection.conversations => Icons.chat_bubble_outline,
    };
  }

  String get path {
    return switch (this) {
      TeacherSection.overview => '/teacher',
      TeacherSection.schedule => '/teacher/schedule',
      TeacherSection.courses => '/teacher/courses',
      TeacherSection.assignments => '/teacher/assignments',
      TeacherSection.resources => '/teacher/resources',
      TeacherSection.conversations => '/teacher/conversations',
    };
  }
}

class TeacherShell extends HookConsumerWidget {
  const TeacherShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;
    final assignments = ref.watch(teacherAssignmentsProvider);
    final conversations = ref.watch(conversationsProvider);
    final unreadNotifications =
        ref.watch(unreadNotificationCountProvider).valueOrNull ?? 0;

    final pendingToGrade = assignments.maybeWhen(
      data: (items) =>
          items.fold<int>(0, (sum, item) => sum + item.pendingGradeCount),
      orElse: () => 0,
    );

    final unreadMessages = conversations.maybeWhen(
      data: (items) =>
          items.fold<int>(0, (sum, item) => sum + item.unreadCount),
      orElse: () => 0,
    );

    final totalUnreadMessages = unreadMessages + unreadNotifications;

    final destinations = TeacherSection.values
        .map(
          (section) => AdaptiveDestination(
            label: section.label,
            icon: section.icon,
            selectedIcon: section.icon,
            badgeCount: switch (section) {
              TeacherSection.assignments => pendingToGrade,
              TeacherSection.conversations => totalUnreadMessages,
              _ => null,
            },
          ),
        )
        .toList();

    final compactPaths = <String>[
      TeacherSection.overview.path,
      TeacherSection.resources.path,
      TeacherSection.conversations.path,
      TeacherSection.courses.path,
      '/teacher/profile',
    ];

    final compactDestinations = <AdaptiveDestination>[
      const AdaptiveDestination(
        label: '首页',
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
      ),
      const AdaptiveDestination(
        label: '资源',
        icon: Icons.folder_outlined,
        selectedIcon: Icons.folder,
      ),
      AdaptiveDestination(
        label: '消息',
        icon: Icons.chat_bubble_outline,
        selectedIcon: Icons.chat,
        badgeCount: totalUnreadMessages,
      ),
      const AdaptiveDestination(
        label: '课程',
        icon: Icons.class_outlined,
        selectedIcon: Icons.class_rounded,
      ),
      const AdaptiveDestination(
        label: '我',
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
      ),
    ];

    final location = state.matchedLocation;
    final currentSection = TeacherSection.values.lastWhere(
      (section) =>
          location == section.path || location.startsWith('${section.path}/'),
      orElse: () => TeacherSection.overview,
    );
    final currentIndex = TeacherSection.values.indexOf(currentSection);
    final compactIndex = _matchPathIndex(location, compactPaths);

    return AdaptiveNavigationScaffold(
      destinations: destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final target = TeacherSection.values[index].path;
        if (target != location) {
          context.go(target);
        }
      },
      compactDestinations: compactDestinations,
      compactSelectedIndex: compactIndex,
      onCompactDestinationSelected: (index) {
        final target = compactPaths[index];
        if (target != location) {
          context.go(target);
        }
      },
      hideAppBar: true,
      appBarTitle: null,
      userInfo: NavUserInfo(
        title: account?.displayName ?? '未登录',
        subtitle: account != null
            ? '${account.identifier} · ${account.role.label}'
            : '请登录以查看个人信息',
        onTap: () => context.go('/teacher/profile'),
      ),
      child: child,
    );
  }
}

int _matchPathIndex(String location, List<String> paths) {
  var bestIndex = 0;
  var bestLength = 0;

  for (var i = 0; i < paths.length; i++) {
    final path = paths[i];
    final isMatch = location == path || location.startsWith('$path/');
    if (isMatch && path.length > bestLength) {
      bestIndex = i;
      bestLength = path.length;
    }
  }

  return bestIndex;
}
