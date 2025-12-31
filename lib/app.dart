import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/grpc/grpc_connection_manager.dart';
import 'package:learn_go/features/im/application/im_providers.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';

class LearnGoApp extends HookConsumerWidget {
  const LearnGoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 让 gRPC 连接管理器常驻：登录后立即连接，登出时断开。
    // 这里用 listen 避免因连接状态变更导致整个 App rebuild。
    ref.listen(grpcConnectionManagerProvider, (previous, next) {});

    // 让 IM 后台订阅常驻：登录后订阅所有会话，更新会话列表/未读角标。
    ref.listen(imRealtimeSyncProvider, (previous, next) {});

    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeControllerProvider);

    return MaterialApp.router(
      title: 'LearnGo 乐学',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
