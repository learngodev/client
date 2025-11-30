import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../auth/application/auth_controller.dart';

enum StudentSection { overview, schedule, messages, aiChat }

extension StudentSectionX on StudentSection {
  String get label {
    return switch (this) {
      StudentSection.overview => '概览',
      StudentSection.schedule => '课表',
      StudentSection.messages => '消息',
      StudentSection.aiChat => 'AI 助手',
    };
  }

  IconData get icon {
    return switch (this) {
      StudentSection.overview => Icons.dashboard_outlined,
      StudentSection.schedule => Icons.event_available_outlined,
      StudentSection.messages => Icons.chat_outlined,
      StudentSection.aiChat => Icons.smart_toy_outlined,
    };
  }

  String get path {
    return switch (this) {
      StudentSection.overview => '/student',
      StudentSection.schedule => '/student/schedule',
      StudentSection.messages => '/student/messages',
      StudentSection.aiChat => '/student/ai-chat',
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
    final destinations = StudentSection.values
        .map(
          (section) => AdaptiveDestination(
            label: section.label,
            icon: section.icon,
            selectedIcon: section.icon,
          ),
        )
        .toList();

    final location = state.matchedLocation;

    // Find the section with the longest path that matches the current location.
    // This handles cases where one path is a prefix of another (e.g. /student vs /student/messages).
    final bestMatch = StudentSection.values
        .where((s) => location == s.path || location.startsWith('${s.path}/'))
        .fold<StudentSection>(StudentSection.overview, (prev, curr) {
          return curr.path.length > prev.path.length ? curr : prev;
        });

    final currentIndex = StudentSection.values.indexOf(bestMatch);

    final isSubPage = !StudentSection.values.any((s) => s.path == location);

    return AdaptiveNavigationScaffold(
      destinations: destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final target = StudentSection.values[index].path;
        if (target != location) {
          context.go(target);
        }
      },
      appBarLeading: isSubPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/student'),
              tooltip: '返回概览',
            )
          : null,
      appBarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('学生空间'),
          if (account != null)
            Text(
              '${account.displayName} · ${account.identifier}',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Colors.black87),
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
