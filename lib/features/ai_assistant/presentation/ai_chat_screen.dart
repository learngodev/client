import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/gradient_app_bar.dart';
import '../../../core/widgets/pill_button.dart';
import '../application/ai_providers.dart';
import '../domain/ai_models.dart';

class AIChatScreen extends HookConsumerWidget {
  const AIChatScreen({super.key, required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modern = Theme.of(context).extension<ModernUI>()!;
    final messagesAsync = ref.watch(aiSessionMessagesProvider(sessionId));
    final controller = ref.watch(aiChatControllerProvider.notifier);
    final textController = useTextEditingController();
    final scrollController = useScrollController();
    final isSending = useState(false);

    // Auto-scroll to bottom when messages change
    useEffect(() {
      if (messagesAsync.hasValue && scrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
      return null;
    }, [messagesAsync.valueOrNull?.length]);

    return Scaffold(
      appBar: const GradientAppBar(title: Text('AI 助手')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.06),
              Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.06),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: messagesAsync.when(
                data: (messages) {
                  if (messages.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          '开始提问吧！',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return _ChatMessageBubble(message: message);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('加载失败: $err')),
              ),
            ),
            if (isSending.value)
              LinearProgressIndicator(
                minHeight: 3,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.15),
              ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(modern.sheetRadius),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: modern.glassSurface,
                        borderRadius: BorderRadius.circular(modern.sheetRadius),
                        border: Border.all(color: modern.borderSubtle),
                        boxShadow: [
                          BoxShadow(
                            color: modern.shadowColor,
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textController,
                              minLines: 1,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                hintText: '输入消息...',
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                              onSubmitted: (value) async {
                                if (value.trim().isEmpty || isSending.value) {
                                  return;
                                }
                                isSending.value = true;
                                try {
                                  await controller.sendMessage(
                                    sessionId,
                                    value,
                                  );
                                  textController.clear();
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('发送失败: $e')),
                                    );
                                  }
                                } finally {
                                  isSending.value = false;
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          PillButton(
                            label: '发送',
                            icon: Icons.send,
                            compact: true,
                            onPressed: isSending.value
                                ? null
                                : () async {
                                    final value = textController.text;
                                    if (value.trim().isEmpty) return;
                                    isSending.value = true;
                                    try {
                                      await controller.sendMessage(
                                        sessionId,
                                        value,
                                      );
                                      textController.clear();
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text('发送失败: $e')),
                                        );
                                      }
                                    } finally {
                                      isSending.value = false;
                                    }
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessageBubble extends StatelessWidget {
  const _ChatMessageBubble({required this.message});

  final AIChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final theme = Theme.of(context);
    final modern = theme.extension<ModernUI>()!;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.82,
        ),
        decoration: BoxDecoration(
          gradient: isUser
              ? LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.95),
                    theme.colorScheme.secondary.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isUser ? null : modern.glassSurface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 12 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 12),
          ),
          boxShadow: [
            BoxShadow(
              color: modern.shadowColor,
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
          border: isUser ? null : Border.all(color: modern.borderSubtle),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isUser
                    ? Colors.white
                    : theme.colorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              DateFormat('HH:mm').format(message.createdAt),
              style: theme.textTheme.labelSmall?.copyWith(
                color: isUser
                    ? Colors.white.withValues(alpha: 0.9)
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
