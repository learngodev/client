import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../auth/application/auth_controller.dart';

enum StudentSection { overview, schedule, assignments, exams, notes, messages }

extension StudentSectionX on StudentSection {
  String get label {
    return switch (this) {
      StudentSection.overview => '概览',
      StudentSection.schedule => '课表',
      StudentSection.assignments => '作业',
      StudentSection.exams => '考试',
      StudentSection.notes => '笔记',
      StudentSection.messages => '消息',
    };
  }

  IconData get icon {
    return switch (this) {
      StudentSection.overview => Icons.dashboard_outlined,
      StudentSection.schedule => Icons.event_available_outlined,
      StudentSection.assignments => Icons.task_alt_outlined,
      StudentSection.exams => Icons.timer_outlined,
      StudentSection.notes => Icons.sticky_note_2_outlined,
      StudentSection.messages => Icons.chat_outlined,
    };
  }

  String get path {
    return switch (this) {
      StudentSection.overview => '/student',
      StudentSection.schedule => '/student/schedule',
      StudentSection.assignments => '/student/assignments',
      StudentSection.exams => '/student/exams',
      StudentSection.notes => '/student/notes',
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
    final currentSection = StudentSection.values.firstWhere(
      (section) =>
          location == section.path || location.startsWith(section.path),
      orElse: () => StudentSection.overview,
    );
    final currentIndex = StudentSection.values.indexOf(currentSection);

    return AdaptiveNavigationScaffold(
      destinations: destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final target = StudentSection.values[index].path;
        if (target != location) {
          context.go(target);
        }
      },
      appBarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('学生空间'),
          if (account != null)
            Text(
              '${account.displayName} · ${account.identifier}',
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
