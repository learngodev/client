import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/domain/account.dart';
import '../../features/auth/presentation/sign_in_page.dart';
import '../../features/admin/presentation/admin_shell.dart';
import '../../features/admin/presentation/pages/admin_pages.dart';
import '../../features/admin/presentation/pages/admin_ai_settings_page.dart';
import '../../features/student/presentation/pages/assignment_detail_page.dart';
import '../../features/student/presentation/pages/submission_detail_page.dart';
import '../../features/student/presentation/pages/student_pages.dart';
import '../../features/student/presentation/student_shell.dart';
import '../../features/teacher/presentation/pages/teacher_pages.dart';
import '../../features/teacher/presentation/pages/grading_page.dart';
import '../../features/teacher/presentation/pages/teacher_assignments_page.dart';
import '../../features/teacher/presentation/pages/assignment_submissions_page.dart';
import '../../features/teacher/presentation/pages/create_assignment_page.dart';
import '../../features/teacher/domain/teacher_models.dart';
import '../../features/teacher/presentation/teacher_shell.dart';
import '../../features/im/presentation/pages/chat_screen.dart';
import '../../features/ai_assistant/presentation/ai_chat_list_screen.dart';
import '../../features/ai_assistant/presentation/ai_chat_screen.dart';
import '../widgets/status_pages.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final routerNotifier = ref.watch(_routerNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    refreshListenable: routerNotifier,
    redirect: (context, state) {
      final status = authState.status;
      final loggingIn = state.matchedLocation == '/sign-in';
      final isSplash = state.matchedLocation == '/splash';

      if (status == AuthStatus.unknown) {
        return isSplash ? null : '/splash';
      }

      if (status == AuthStatus.unauthenticated) {
        return loggingIn ? null : '/sign-in';
      }

      // 已登录情况下，避免留在登录或占位页。
      if (loggingIn || isSplash) {
        return _roleHomePath(authState.account?.role);
      }

      // 已登录但访问根路径时，根据角色跳转。
      if (state.matchedLocation == '/') {
        return _roleHomePath(authState.account?.role);
      }

      // 其他情况保持原路由。
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/sign-in',
        name: 'signIn',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const _RoleLandingPage(),
      ),
      GoRoute(
        path: '/conversations/:id',
        name: 'conversation',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final conversationId = state.pathParameters['id']!;
          return ChatScreen(conversationId: conversationId);
        },
      ),
      GoRoute(
        path: '/student/assignments/:id',
        name: 'studentAssignmentDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return AssignmentDetailPage(id: id);
        },
      ),
      GoRoute(
        path: '/student/assignments/:id/result',
        name: 'studentAssignmentResult',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return SubmissionDetailPage(assignmentId: id);
        },
      ),
      GoRoute(
        path: '/teacher/grading/:assignmentId/:submissionId',
        name: 'teacherGradingDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final assignmentId = state.pathParameters['assignmentId']!;
          final submissionId = state.pathParameters['submissionId']!;
          return GradingPage(
            assignmentId: assignmentId,
            submissionId: submissionId,
          );
        },
      ),
      ShellRoute(
        navigatorKey: _adminShellNavigatorKey,
        builder: (context, state, child) =>
            AdminShell(state: state, child: child),
        routes: [
          GoRoute(
            path: '/admin',
            name: 'adminOverview',
            redirect: (context, state) =>
                _guardRole(authState, AccountRole.admin, state),
            builder: (context, state) => const AdminOverviewPage(),
          ),
          GoRoute(
            path: '/admin/accounts',
            name: 'adminAccounts',
            builder: (context, state) => const AdminAccountsPage(),
          ),
          GoRoute(
            path: '/admin/structures',
            name: 'adminStructures',
            builder: (context, state) => const AdminStructuresPage(),
          ),
          GoRoute(
            path: '/admin/oss',
            name: 'adminOss',
            builder: (context, state) => const AdminOssSettingsPage(),
          ),
          GoRoute(
            path: '/admin/system',
            name: 'adminSystem',
            builder: (context, state) => const AdminSystemSettingsPage(),
          ),
          GoRoute(
            path: '/admin/ai',
            name: 'adminAI',
            builder: (context, state) => const AdminAISettingsPage(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _teacherShellNavigatorKey,
        builder: (context, state, child) =>
            TeacherShell(state: state, child: child),
        routes: [
          GoRoute(
            path: '/teacher',
            name: 'teacherOverview',
            redirect: (context, state) =>
                _guardRole(authState, AccountRole.teacher, state),
            builder: (context, state) => const TeacherOverviewPage(),
          ),
          GoRoute(
            path: '/teacher/schedule',
            name: 'teacherSchedule',
            builder: (context, state) => const TeacherSchedulePage(),
          ),
          GoRoute(
            path: '/teacher/assignments',
            name: 'teacherAssignments',
            builder: (context, state) => const TeacherAssignmentsPage(),
          ),
          GoRoute(
            path: '/teacher/assignments/create',
            name: 'teacherCreateAssignment',
            builder: (context, state) => const CreateAssignmentPage(),
          ),
          GoRoute(
            path: '/teacher/assignments/:assignmentId/submissions',
            name: 'teacherAssignmentSubmissions',
            builder: (context, state) {
              final assignmentId = state.pathParameters['assignmentId']!;
              final assignment = state.extra as TeacherAssignment?;
              return AssignmentSubmissionsPage(
                assignmentId: assignmentId,
                assignmentTitle: assignment?.title,
              );
            },
          ),
          GoRoute(
            path: '/teacher/conversations',
            name: 'teacherConversations',
            builder: (context, state) => const TeacherConversationsPage(),
          ),
          GoRoute(
            path: '/teacher/notes',
            name: 'teacherNotes',
            builder: (context, state) => const TeacherNotesPage(),
          ),
          GoRoute(
            path: '/teacher/ai-chat',
            name: 'teacherAIChat',
            builder: (context, state) => const AIChatListScreen(),
          ),
          GoRoute(
            path: '/teacher/ai-chat/:id',
            name: 'teacherAIChatDetail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return AIChatScreen(sessionId: id);
            },
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _studentShellNavigatorKey,
        builder: (context, state, child) =>
            StudentShell(state: state, child: child),
        routes: [
          GoRoute(
            path: '/student',
            name: 'studentOverview',
            redirect: (context, state) =>
                _guardRole(authState, AccountRole.student, state),
            builder: (context, state) => const StudentOverviewPage(),
          ),
          GoRoute(
            path: '/student/schedule',
            name: 'studentSchedule',
            builder: (context, state) => const StudentSchedulePage(),
          ),
          GoRoute(
            path: '/student/reminders',
            name: 'studentReminders',
            builder: (context, state) => const StudentRemindersPage(),
          ),
          GoRoute(
            path: '/student/assignments',
            name: 'studentAssignments',
            builder: (context, state) => const StudentAssignmentsPage(),
          ),
          GoRoute(
            path: '/student/exams',
            name: 'studentExams',
            builder: (context, state) => const StudentExamsPage(),
          ),
          GoRoute(
            path: '/student/notes',
            name: 'studentNotes',
            builder: (context, state) => const StudentNotesPage(),
          ),
          GoRoute(
            path: '/student/messages',
            name: 'studentMessages',
            builder: (context, state) => const StudentMessagesPage(),
          ),
          GoRoute(
            path: '/student/ai-chat',
            name: 'studentAIChat',
            builder: (context, state) => const AIChatListScreen(),
          ),
          GoRoute(
            path: '/student/ai-chat/:id',
            name: 'studentAIChatDetail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return AIChatScreen(sessionId: id);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _adminShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'adminShell',
);
final _teacherShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'teacherShell',
);
final _studentShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'studentShell',
);

String _roleHomePath(AccountRole? role) {
  return switch (role) {
    AccountRole.admin => '/admin',
    AccountRole.teacher => '/teacher',
    AccountRole.student => '/student',
    null => '/sign-in',
  };
}

String? _guardRole(
  AuthState state,
  AccountRole requiredRole,
  GoRouterState goState,
) {
  if (state.status != AuthStatus.authenticated) {
    return '/sign-in';
  }
  if (state.account?.role != requiredRole) {
    return _roleHomePath(state.account?.role);
  }
  return null;
}

class _RoleLandingPage extends StatelessWidget {
  const _RoleLandingPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(this.ref) {
    _subscription = ref.listen<AuthState>(authStateProvider, (previous, next) {
      if (previous?.status != next.status ||
          previous?.account?.role != next.account?.role ||
          previous?.requiresPasswordReset != next.requiresPasswordReset) {
        notifyListeners();
      }
    });
  }

  final Ref ref;
  late final ProviderSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}

final _routerNotifierProvider = Provider<_RouterNotifier>((ref) {
  final notifier = _RouterNotifier(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});
