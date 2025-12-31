import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/notification/application/notification_provider.dart';

class NotificationListenerWidget extends HookConsumerWidget {
  const NotificationListenerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notificationStreamProvider, (previous, next) {
      next.whenData((event) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(event.title),
            action: SnackBarAction(
              label: '查看',
              onPressed: () {
                // TODO: Navigate to notification detail or list
              },
            ),
          ),
        );
      });
    });

    return child;
  }
}
