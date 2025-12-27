import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/gradient_app_bar.dart';
import '../../../core/widgets/pill_button.dart';
import '../application/ai_providers.dart';

class AIChatListScreen extends HookConsumerWidget {
  const AIChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(aiSessionsProvider);
    final controller = ref.watch(aiChatControllerProvider.notifier);
    final chatState = ref.watch(aiChatControllerProvider);
    final isLoading = chatState.isLoading;

    ref.listen<AsyncValue<void>>(aiChatControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('操作失败: ${next.error}')));
      }
    });

    final modern = Theme.of(context).extension<ModernUI>()!;

    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('AI 助手'),
        actions: [
          if (isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: PillButton(
                label: '新建',
                icon: Icons.add,
                compact: true,
                onPressed: () async {
                  final session = await controller.createSession();
                  if (session != null && context.mounted) {
                    final currentPath = GoRouterState.of(context).uri.path;
                    context.push('$currentPath/${session.id}');
                  }
                },
              ),
            ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
              Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: sessionsAsync.when(
          data: (sessions) {
            if (sessions.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GlassCard(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.7),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '还没有对话记录',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        PillButton(
                          label: '开始新对话',
                          icon: Icons.add,
                          onPressed: isLoading
                              ? null
                              : () async {
                                  final session = await controller
                                      .createSession();
                                  if (session != null && context.mounted) {
                                    final currentPath = GoRouterState.of(
                                      context,
                                    ).uri.path;
                                    context.push('$currentPath/${session.id}');
                                  }
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sessions.length,
              separatorBuilder: (context, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final session = sessions[index];
                return GlassCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  onTap: () {
                    final currentPath = GoRouterState.of(context).uri.path;
                    context.push('$currentPath/${session.id}');
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.9),
                              Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: 0.9),
                            ],
                          ),
                        ),
                        child: const Icon(Icons.smart_toy, color: Colors.white),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              session.title.isEmpty ? '新对话' : session.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${DateFormat('MM-dd HH:mm').format(session.lastMessageAt)} · ${session.messageCount} 条消息',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: modern.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('加载失败: $err')),
        ),
      ),
    );
  }
}
