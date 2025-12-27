import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeControllerProvider);
    final isSystem = themeMode == ThemeMode.system;
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('跟随系统'),
            value: isSystem,
            onChanged: (value) {
              if (value) {
                ref
                    .read(themeModeControllerProvider.notifier)
                    .setThemeMode(ThemeMode.system);
              } else {
                // Default to light when turning off system, or maybe current system brightness?
                // Let's just default to light for now.
                ref
                    .read(themeModeControllerProvider.notifier)
                    .setThemeMode(ThemeMode.light);
              }
            },
          ),
          SwitchListTile(
            title: const Text('深色模式'),
            value: isDark,
            onChanged: isSystem
                ? null
                : (value) {
                    ref
                        .read(themeModeControllerProvider.notifier)
                        .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                  },
            subtitle: isSystem ? const Text('已开启跟随系统') : null,
          ),
        ],
      ),
    );
  }
}
