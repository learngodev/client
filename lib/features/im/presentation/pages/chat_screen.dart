import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_go/features/file/application/file_service.dart';
import 'package:learn_go/features/im/application/im_providers.dart';
import 'package:learn_go/features/im/domain/entities/message.dart';
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
                                  if (message.kind == MessageKind.image)
                                    _ImageMessage(
                                      fileId: message.mediaUri ?? '',
                                    )
                                  else if (message.kind == MessageKind.file)
                                    _FileMessage(
                                      fileName: message.text,
                                      fileId: message.mediaUri ?? '',
                                      isMe: isMe,
                                    )
                                  else
                                    Text(
                                      message.text,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: isMe
                                                ? theme
                                                      .colorScheme
                                                      .onPrimaryContainer
                                                : theme
                                                      .colorScheme
                                                      .onSurfaceVariant,
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
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: const Text('图片'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final picker = ImagePicker();
                                    final pickedFile = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (pickedFile != null) {
                                      final file = File(pickedFile.path);
                                      try {
                                        final fileModel = await ref
                                            .read(fileServiceProvider)
                                            .uploadFile(file);
                                        await ref
                                            .read(imControllerProvider)
                                            .sendMessage(
                                              conversationId,
                                              '[图片]',
                                              kind: MessageKind.image,
                                              mediaUri: fileModel.id,
                                            );
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(content: Text('上传失败: $e')),
                                          );
                                        }
                                      }
                                    }
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.attach_file),
                                  title: const Text('文件'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final result = await FilePicker.platform
                                        .pickFiles();
                                    if (result != null &&
                                        result.files.single.path != null) {
                                      final file = File(
                                        result.files.single.path!,
                                      );
                                      try {
                                        final fileModel = await ref
                                            .read(fileServiceProvider)
                                            .uploadFile(file);
                                        await ref
                                            .read(imControllerProvider)
                                            .sendMessage(
                                              conversationId,
                                              fileModel.fileName,
                                              kind: MessageKind.file,
                                              mediaUri: fileModel.id,
                                            );
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(content: Text('上传失败: $e')),
                                          );
                                        }
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
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

class _ImageMessage extends ConsumerWidget {
  final String fileId;

  const _ImageMessage({required this.fileId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlAsync = ref.watch(downloadUrlProvider(fileId));

    return urlAsync.when(
      data: (url) => GestureDetector(
        onTap: () {
          // TODO: Show full screen image
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            url,
            width: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 200,
                height: 150,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 200,
                height: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              );
            },
          ),
        ),
      ),
      loading: () => Container(
        width: 200,
        height: 150,
        color: Colors.grey[200],
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => const Icon(Icons.error),
    );
  }
}

class _FileMessage extends ConsumerWidget {
  final String fileName;
  final String fileId;
  final bool isMe;

  const _FileMessage({
    required this.fileName,
    required this.fileId,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final urlAsync = ref.watch(downloadUrlProvider(fileId));

    return GestureDetector(
      onTap: () {
        urlAsync.whenData((url) {
          // TODO: Open file
          // launchUrl(Uri.parse(url));
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isMe
              ? theme.colorScheme.primary.withValues(alpha: 0.1)
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.insert_drive_file,
              color: isMe
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                fileName,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isMe
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurface,
                  decoration: TextDecoration.underline,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
