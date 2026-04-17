import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:animations/animations.dart';

import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/domain/account.dart';
import '../../features/auth/presentation/sign_in_page.dart';
import '../../features/auth/presentation/password_reset_page.dart';
import '../../features/notification/presentation/notification_page.dart';
import '../../features/admin/presentation/admin_shell.dart';
import '../../features/admin/presentation/pages/admin_pages.dart';
import '../../features/admin/presentation/pages/admin_ai_settings_page.dart';
import '../../features/admin/presentation/pages/course_management_page.dart';
import '../../features/admin/presentation/pages/schedule_management_page.dart';
import '../../features/admin/presentation/pages/classroom_management_page.dart';
import '../../features/student/presentation/pages/assignment_detail_page.dart';
import '../../features/student/presentation/pages/student_course_detail_page.dart';
import '../../features/student/presentation/pages/student_course_chapter_detail_page.dart';
import '../../features/student/presentation/pages/submission_detail_page.dart';
import '../../features/student/presentation/pages/student_pages.dart';
import '../../features/student/presentation/pages/student_video_player_page.dart';
import '../../features/student/presentation/student_shell.dart';
import '../../features/teacher/presentation/pages/teacher_pages.dart';
import '../../features/teacher/presentation/pages/grading_page.dart';
import '../../features/teacher/presentation/pages/teacher_assignments_page.dart';
import '../../features/teacher/presentation/pages/assignment_submissions_page.dart';
import '../../features/teacher/presentation/pages/create_assignment_page.dart';
import '../../features/teacher/presentation/pages/teacher_courses_page.dart';
import '../../features/teacher/presentation/pages/teacher_course_detail_page.dart';
import '../../features/teacher/presentation/pages/teacher_class_students_page.dart';
import '../../features/teacher/presentation/pages/teacher_course_chapters_page.dart';
import '../../features/teacher/presentation/pages/teacher_course_chapter_edit_page.dart';
import '../../features/teacher/domain/teacher_models.dart';
import '../../features/teacher/presentation/teacher_shell.dart';
import '../../features/im/presentation/pages/chat_screen.dart';
import '../../features/profile/presentation/profile_page.dart';
import '../../features/profile/presentation/settings_page.dart';
import '../../features/resource/presentation/pages/resources_browse_page.dart';
import '../../features/resource/presentation/pages/teacher_resources_page.dart';
import '../../features/resource/presentation/pages/create_resource_page.dart';
import '../../features/resource/presentation/pages/resource_detail_page.dart';
import '../widgets/status_pages.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _adminShellNavigatorKey = GlobalKey<NavigatorState>();
final _teacherShellNavigatorKey = GlobalKey<NavigatorState>();
final _studentShellNavigatorKey = GlobalKey<NavigatorState>();

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
        pageBuilder: (context, state) => _sharedAxisTransitionPage(
          context: context,
          state: state,
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: '/sign-in',
        name: 'signIn',
        pageBuilder: (context, state) => _sharedAxisTransitionPage(
          context: context,
          state: state,
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: '/password-reset',
        name: 'passwordReset',
        pageBuilder: (context, state) => _sharedAxisTransitionPage(
          context: context,
          state: state,
          child: const PasswordResetPage(),
        ),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => _sharedAxisTransitionPage(
          context: context,
          state: state,
          child: const SettingsPage(),
        ),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => _sharedAxisTransitionPage(
          context: context,
          state: state,
          child: const NotificationPage(),
        ),
      ),
      GoRoute(
        path: '/',
        name: 'root',
        pageBuilder: (context, state) => _sharedAxisTransitionPage(
          context: context,
          state: state,
          child: const _RoleLandingPage(),
        ),
      ),
      GoRoute(
        path: '/conversations/:id',
        name: 'conversation',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final conversationId = state.pathParameters['id']!;
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: ChatScreen(conversationId: conversationId),
          );
        },
      ),
      GoRoute(
        path: '/student/courses/:courseId',
        name: 'studentCourseDetail',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final courseId = state.pathParameters['courseId']!;
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: StudentCourseDetailPage(courseId: courseId),
          );
        },
      ),
      GoRoute(
        path: '/student/courses/:courseId/chapters/:chapterId',
        name: 'studentCourseChapterDetail',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final courseId = state.pathParameters['courseId']!;
          final chapterId = state.pathParameters['chapterId']!;
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: StudentCourseChapterDetailPage(
              courseId: courseId,
              chapterId: chapterId,
            ),
          );
        },
      ),
      GoRoute(
        path: '/student/video',
        name: 'studentVideo',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra;
          String title = '视频播放';
          String url = '';
          if (extra is Map) {
            title = extra['title']?.toString() ?? title;
            url = extra['url']?.toString() ?? url;
          }
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: StudentVideoPlayerPage(title: title, url: url),
          );
        },
      ),
      GoRoute(
        path: '/student/assignments/:id',
        name: 'studentAssignmentDetail',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: AssignmentDetailPage(id: id),
          );
        },
      ),
      GoRoute(
        path: '/student/assignments/:id/result',
        name: 'studentAssignmentResult',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: SubmissionDetailPage(assignmentId: id),
          );
        },
      ),
      GoRoute(
        path: '/teacher/grading/:assignmentId/:submissionId',
        name: 'teacherGradingDetail',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final assignmentId = state.pathParameters['assignmentId']!;
          final submissionId = state.pathParameters['submissionId']!;
          return _sharedAxisTransitionPage(
            context: context,
            state: state,
            child: GradingPage(
              assignmentId: assignmentId,
              submissionId: submissionId,
            ),
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
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const AdminOverviewPage(),
            ),
          ),
          GoRoute(
            path: '/admin/profile',
            name: 'adminProfile',
            redirect: (context, state) =>
                _guardRole(authState, AccountRole.admin, state),
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const ProfilePage(),
            ),
          ),
          GoRoute(
            path: '/admin/accounts',
            name: 'adminAccounts',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const AdminAccountsPage(),
            ),
          ),
          GoRoute(
            path: '/admin/structures',
            name: 'adminStructures',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const AdminStructuresPage(),
            ),
          ),
          GoRoute(
            path: '/admin/courses',
            name: 'adminCourses',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const CourseManagementPage(),
            ),
          ),
          GoRoute(
            path: '/admin/schedule',
            name: 'adminSchedule',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const ScheduleManagementPage(),
            ),
          ),
          GoRoute(
            path: '/admin/classrooms',
            name: 'adminClassrooms',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const ClassroomManagementPage(),
            ),
          ),
          GoRoute(
            path: '/admin/oss',
            name: 'adminOss',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const AdminOssSettingsPage(),
            ),
          ),
          GoRoute(
            path: '/admin/system',
            name: 'adminSystem',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const AdminSystemSettingsPage(),
            ),
          ),
          GoRoute(
            path: '/admin/ai',
            name: 'adminAI',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const AdminAISettingsPage(),
            ),
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
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const TeacherOverviewPage(),
            ),
          ),
          GoRoute(
            path: '/teacher/schedule',
            name: 'teacherSchedule',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const TeacherSchedulePage(),
            ),
          ),
          GoRoute(
            path: '/teacher/assignments',
            name: 'teacherAssignments',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const TeacherAssignmentsPage(),
            ),
          ),
          GoRoute(
            path: '/teacher/courses',
            name: 'teacherCourses',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const TeacherCoursesPage(),
            ),
          ),
          GoRoute(
            path: '/teacher/courses/:id',
            name: 'teacherCourseClasses',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: TeacherCourseDetailPage(courseId: id),
              );
            },
          ),
          GoRoute(
            path: '/teacher/courses/:id/chapters',
            name: 'teacherCourseChapters',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: TeacherCourseChaptersPage(courseId: id),
              );
            },
          ),
          GoRoute(
            path: '/teacher/courses/:id/chapters/create',
            name: 'teacherCreateCourseChapter',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: TeacherCourseChapterEditPage(courseId: id),
              );
            },
          ),
          GoRoute(
            path: '/teacher/courses/:id/chapters/:chapterId/edit',
            name: 'teacherEditCourseChapter',
            pageBuilder: (context, state) {
              final courseId = state.pathParameters['id']!;
              final chapterId = state.pathParameters['chapterId']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: TeacherCourseChapterEditPage(
                  courseId: courseId,
                  chapterId: chapterId,
                ),
              );
            },
          ),
          GoRoute(
            path: '/teacher/classes/:id/students',
            name: 'teacherClassStudents',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: TeacherClassStudentsPage(classId: id),
              );
            },
          ),
          GoRoute(
            path: '/teacher/assignments/create',
            name: 'teacherCreateAssignment',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const CreateAssignmentPage(),
            ),
          ),
          GoRoute(
            path: '/teacher/assignments/:assignmentId/submissions',
            name: 'teacherAssignmentSubmissions',
            pageBuilder: (context, state) {
              final assignmentId = state.pathParameters['assignmentId']!;
              final assignment = state.extra as TeacherAssignment?;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: AssignmentSubmissionsPage(
                  assignmentId: assignmentId,
                  assignmentTitle: assignment?.title,
                ),
              );
            },
          ),
          GoRoute(
            path: '/teacher/conversations',
            name: 'teacherConversations',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const TeacherConversationsPage(),
            ),
          ),
          GoRoute(
            path: '/teacher/resources',
            name: 'teacherResources',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const TeacherResourcesPage(),
            ),
          ),
          GoRoute(
            path: '/teacher/resources/create',
            name: 'teacherCreateResource',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const CreateResourcePage(),
            ),
          ),
          GoRoute(
            path: '/teacher/resources/:id',
            name: 'teacherResourceDetail',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: ResourceDetailPage(resourceId: id),
              );
            },
          ),

          GoRoute(
            path: '/teacher/profile',
            name: 'teacherProfile',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const ProfilePage(),
            ),
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
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const StudentOverviewPage(),
            ),
          ),
          GoRoute(
            path: '/student/courses',
            name: 'studentCourses',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const StudentCoursesPage(),
            ),
          ),
          GoRoute(
            path: '/student/schedule',
            name: 'studentSchedule',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const StudentSchedulePage(),
            ),
          ),
          GoRoute(
            path: '/student/assignments',
            name: 'studentAssignments',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const StudentAssignmentsPage(),
            ),
          ),
          GoRoute(
            path: '/student/resources',
            name: 'studentResources',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const ResourcesBrowsePage(),
            ),
          ),
          GoRoute(
            path: '/student/resources/:id',
            name: 'studentResourceDetail',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return _sharedAxisTransitionPage(
                context: context,
                state: state,
                child: ResourceDetailPage(resourceId: id),
              );
            },
          ),
          GoRoute(
            path: '/student/exams',
            name: 'studentExams',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const StudentExamsPage(),
            ),
          ),

          GoRoute(
            path: '/student/messages',
            name: 'studentMessages',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const StudentMessagesPage(),
            ),
          ),
          GoRoute(
            path: '/student/profile',
            name: 'studentProfile',
            pageBuilder: (context, state) => _sharedAxisTransitionPage(
              context: context,
              state: state,
              child: const ProfilePage(),
            ),
          ),
        ],
      ),
    ],
  );
});

String _roleHomePath(AccountRole? role) {
  return switch (role) {
    AccountRole.admin => '/admin',
    AccountRole.teacher => '/teacher',
    AccountRole.student => '/student',
    AccountRole.ai => throw UnimplementedError(),
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

Page<void> _sharedAxisTransitionPage({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  SharedAxisTransitionType? transitionType,
}) {
  // 窄屏（通常底部导航）使用水平切换，中宽屏（通常侧边导航）使用垂直切换
  final effectiveTransitionType =
      transitionType ??
      (MediaQuery.of(context).size.width > 600
          ? SharedAxisTransitionType.vertical
          : SharedAxisTransitionType.horizontal);

  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: effectiveTransitionType,
        fillColor: Colors.transparent,
        child: child,
      );
    },
  );
}
