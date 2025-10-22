import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/layout/adaptive_navigation_scaffold.dart';
import '../../auth/application/auth_controller.dart';

enum TeacherSection { overview, schedule, assignments, conversations, notes }

extension TeacherSectionX on TeacherSection {
  String get label {
    return switch (this) {
      TeacherSection.overview => '概览',
      TeacherSection.schedule => '课表',
      TeacherSection.assignments => '作业考试',
      TeacherSection.conversations => '消息',
      TeacherSection.notes => '笔记',
    };
  }

  IconData get icon {
    return switch (this) {
      TeacherSection.overview => Icons.dashboard_customize_outlined,
      TeacherSection.schedule => Icons.event_note_outlined,
      TeacherSection.assignments => Icons.assignment_turned_in_outlined,
      TeacherSection.conversations => Icons.chat_bubble_outline,
      TeacherSection.notes => Icons.note_alt_outlined,
    };
  }

  String get path {
    return switch (this) {
      TeacherSection.overview => '/teacher',
      TeacherSection.schedule => '/teacher/schedule',
      TeacherSection.assignments => '/teacher/assignments',
      TeacherSection.conversations => '/teacher/conversations',
      TeacherSection.notes => '/teacher/notes',
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
    final destinations = TeacherSection.values
        .map(
          (section) => AdaptiveDestination(
            label: section.label,
            icon: section.icon,
            selectedIcon: section.icon,
          ),
        )
        .toList();

    final location = state.matchedLocation;
    final currentSection = TeacherSection.values.firstWhere(
      (section) =>
          location == section.path || location.startsWith(section.path),
      orElse: () => TeacherSection.overview,
    );
    final currentIndex = TeacherSection.values.indexOf(currentSection);

    return AdaptiveNavigationScaffold(
      destinations: destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final target = TeacherSection.values[index].path;
        if (target != location) {
          context.go(target);
        }
      },
      appBarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('教师工作台'),
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
