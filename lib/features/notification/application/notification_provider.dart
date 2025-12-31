import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/grpc/grpc_connection_manager.dart';
import 'package:learn_go/features/notification/data/notification_repository.dart';
import 'package:learn_go/features/notification/domain/notification.dart';
import 'package:learn_go/proto/notification.pb.dart';

final notificationStreamProvider = StreamProvider<NotificationEvent>((ref) {
  return ref.watch(grpcNotificationEventsProvider);
});

final unreadNotificationCountProvider = FutureProvider<int>((ref) async {
  final repository = ref.watch(notificationRepositoryProvider);
  // Invalidate when a new notification arrives
  ref.listen(notificationStreamProvider, (_, next) {
    ref.invalidateSelf();
  });
  return repository.countUnread();
});

class NotificationListController extends AsyncNotifier<List<AppNotification>> {
  @override
  FutureOr<List<AppNotification>> build() async {
    return _fetchNotifications();
  }

  Future<List<AppNotification>> _fetchNotifications() {
    final repository = ref.read(notificationRepositoryProvider);
    return repository.listNotifications();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchNotifications());
  }

  Future<void> markAsRead(String id) async {
    final repository = ref.read(notificationRepositoryProvider);
    await repository.markAsRead(id);
    ref.invalidate(unreadNotificationCountProvider);

    // Optimistic update
    state = state.whenData((list) {
      return list.map((n) {
        if (n.id == id) {
          return n.copyWith(isRead: true);
        }
        return n;
      }).toList();
    });
  }

  Future<void> markAllAsRead() async {
    final repository = ref.read(notificationRepositoryProvider);
    await repository.markAllAsRead();
    ref.invalidate(unreadNotificationCountProvider);
    refresh();
  }
}

final notificationListProvider =
    AsyncNotifierProvider<NotificationListController, List<AppNotification>>(
      NotificationListController.new,
    );
