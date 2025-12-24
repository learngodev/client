import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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

    return Scaffold(
      appBar: AppBar(
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
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                final session = await controller.createSession();
                if (session != null && context.mounted) {
                  final currentPath = GoRouterState.of(context).uri.path;
                  context.push('$currentPath/${session.id}');
                }
              },
            ),
        ],
      ),
      body: sessionsAsync.when(
        data: (sessions) {
          if (sessions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text('还没有对话记录'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            final session = await controller.createSession();
                            if (session != null && context.mounted) {
                              final currentPath = GoRouterState.of(
                                context,
                              ).uri.path;
                              context.push('$currentPath/${session.id}');
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('开始新对话'),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.smart_toy)),
                title: Text(session.title.isEmpty ? '新对话' : session.title),
                subtitle: Text(
                  '${DateFormat('MM-dd HH:mm').format(session.lastMessageAt)} · ${session.messageCount} 条消息',
                ),
                onTap: () {
                  final currentPath = GoRouterState.of(context).uri.path;
                  context.push('$currentPath/${session.id}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('加载失败: $err')),
      ),
    );
  }
}
