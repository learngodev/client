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

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 助手'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final session = await controller.createSession();
              if (session != null && context.mounted) {
                context.push('/student/ai-chat/${session.id}');
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
                    onPressed: () async {
                      final session = await controller.createSession();
                      if (session != null && context.mounted) {
                        context.push('/student/ai-chat/${session.id}');
                      }
                    },
                    child: const Text('开始新对话'),
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
                  context.push('/student/ai-chat/${session.id}');
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
