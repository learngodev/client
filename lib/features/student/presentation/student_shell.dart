import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/domain/account.dart';
import '../../im/application/im_providers.dart';
import '../application/student_dashboard_controller.dart';

enum StudentSection { overview, courses, schedule, assignments, messages }

extension StudentSectionX on StudentSection {
  String get label {
    return switch (this) {
      StudentSection.overview => '概览',
      StudentSection.courses => '课程',
      StudentSection.schedule => '课表',
      StudentSection.assignments => '作业',
      StudentSection.messages => '消息',
    };
  }

  IconData get icon {
    return switch (this) {
      StudentSection.overview => Icons.dashboard_outlined,
      StudentSection.courses => Icons.book_outlined,
      StudentSection.schedule => Icons.calendar_month_outlined,
      StudentSection.assignments => Icons.assignment_outlined,
      StudentSection.messages => Icons.chat_outlined,
    };
  }

  String get path {
    return switch (this) {
      StudentSection.overview => '/student',
      StudentSection.courses => '/student/courses',
      StudentSection.schedule => '/student/schedule',
      StudentSection.assignments => '/student/assignments',
      StudentSection.messages => '/student/messages',
    };
  }
}

class StudentShell extends HookConsumerWidget {
  const StudentShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(authStateProvider).account;
    final dashboard = ref.watch(studentDashboardProvider);
    final conversations = ref.watch(conversationsProvider);

    final pendingAssignments = dashboard.maybeWhen(
      data: (data) => data.pendingAssignments.length,
      orElse: () => 0,
    );

    final unreadMessages = conversations.maybeWhen(
      data: (items) =>
          items.fold<int>(0, (sum, item) => sum + item.unreadCount),
      orElse: () => 0,
    );

    // System notifications are temporarily hidden from the messages page,
    // so we don't include them in the messages badge count.
    final totalUnreadMessages = unreadMessages;

    final destinations = StudentSection.values
        .map(
          (section) => AdaptiveDestination(
            label: section.label,
            icon: section.icon,
            selectedIcon: section.icon,
            badgeCount: switch (section) {
              StudentSection.assignments => pendingAssignments,
              StudentSection.messages => totalUnreadMessages,
              _ => null,
            },
          ),
        )
        .toList();

    final compactPaths = <String>[
      StudentSection.overview.path,
      StudentSection.messages.path,
      '/student/profile',
    ];

    final compactDestinations = <AdaptiveDestination>[
      const AdaptiveDestination(
        label: '首页',
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
      ),
      AdaptiveDestination(
        label: '消息',
        icon: Icons.chat_bubble_outline,
        selectedIcon: Icons.chat,
        badgeCount: totalUnreadMessages,
      ),
      const AdaptiveDestination(
        label: '我',
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
      ),
    ];

    final location = state.matchedLocation;

    // Find the section with the longest path that matches the current location.
    // This handles cases where one path is a prefix of another (e.g. /student vs /student/messages).
    final bestMatch = StudentSection.values
        .where((s) => location == s.path || location.startsWith('${s.path}/'))
        .fold<StudentSection>(StudentSection.overview, (prev, curr) {
          return curr.path.length > prev.path.length ? curr : prev;
        });

    final currentIndex = StudentSection.values.indexOf(bestMatch);
    final compactIndex = _matchPathIndex(location, compactPaths);

    return AdaptiveNavigationScaffold(
      destinations: destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final target = StudentSection.values[index].path;
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
        onTap: () => context.go('/student/profile'),
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
