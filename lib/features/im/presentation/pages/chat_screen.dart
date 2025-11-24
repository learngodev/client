import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/im/application/im_providers.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/features/auth/domain/account.dart';
import 'package:intl/intl.dart';

class ChatScreen extends HookConsumerWidget {
  final String conversationId;

  const ChatScreen({super.key, required this.conversationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesAsync = ref.watch(messagesProvider(conversationId));
    final conversationsAsync = ref.watch(conversationsProvider);
    final conversation = conversationsAsync.valueOrNull
        ?.where((c) => c.id == conversationId)
        .firstOrNull;

    final textController = useTextEditingController();
    final authState = ref.watch(authStateProvider);
    final currentUserId = authState.account?.id ?? '';
    final theme = Theme.of(context);

    useEffect(() {
      // Mark conversation as read when entering the screen or when new messages arrive
      if (messagesAsync.hasValue && messagesAsync.value!.isNotEmpty) {
        final latestMessage = messagesAsync.value!.first;
        ref
            .read(imServiceProvider)
            .markAsRead(conversationId, latestMessage.id)
            .then((_) {
              // Refresh conversations list to update unread count
              ref.invalidate(conversationsProvider);
            });
      }
      return null;
    }, [conversationId, messagesAsync]);

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        appBar: AppBar(
          title: Text(conversation?.getDisplayName(currentUserId) ?? '对话'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: messagesAsync.when(
                data: (messages) {
                  if (messages.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 48,
                            color: theme.colorScheme.outline,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '暂无消息',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMe = message.senderId == currentUserId;
                      // Check if we should show time.
                      // Since list is reversed (Newest at 0), next item is older.
                      // We show time if it's the last item (oldest) or if gap > 5 min.
                      final isLast = index == messages.length - 1;
                      final showTime =
                          isLast ||
                          message.createdAt
                                  .difference(messages[index + 1].createdAt)
                                  .inMinutes
                                  .abs() >
                              5;

                      return Column(
                        children: [
                          if (showTime)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                DateFormat(
                                  'MM-dd HH:mm',
                                ).format(message.createdAt.toLocal()),
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.outline,
                                ),
                              ),
                            ),
                          Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isMe
                                    ? theme.colorScheme.primaryContainer
                                    : theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(16),
                                  topRight: const Radius.circular(16),
                                  bottomLeft: isMe
                                      ? const Radius.circular(16)
                                      : const Radius.circular(4),
                                  bottomRight: isMe
                                      ? const Radius.circular(4)
                                      : const Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!isMe)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        (() {
                                          final member = conversation?.members
                                              .where(
                                                (m) =>
                                                    m.accountId ==
                                                    message.senderId,
                                              )
                                              .firstOrNull;
                                          if (member?.accountName != null &&
                                              member!.accountName!.isNotEmpty) {
                                            return '${member.accountName} (${message.senderRole.label})';
                                          }
                                          return message.senderRole.label;
                                        })(),
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  Text(
                                    message.text,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: isMe
                                          ? theme.colorScheme.onPrimaryContainer
                                          : theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('加载失败: $err')),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                        // TODO: Attachments
                      },
                      color: theme.colorScheme.primary,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                            hintText: '发送消息...',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            filled: false,
                          ),
                          minLines: 1,
                          maxLines: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filled(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final text = textController.text.trim();
                        if (text.isNotEmpty) {
                          ref
                              .read(imControllerProvider)
                              .sendMessage(conversationId, text);
                          textController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
