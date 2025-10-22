import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class LearnGoApp extends HookConsumerWidget {
  const LearnGoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'LearnGo 乐学',
      theme: buildLightTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
