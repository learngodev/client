import 'package:learn_go/core/network/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/notification/domain/notification.dart';

import 'notification_api_requests.dart';

class NotificationRepository {
  const NotificationRepository(this._apiClient);

  final ApiClient _apiClient;

  // REST API Methods

  Future<List<AppNotification>> listNotifications({
    int page = 1,
    int size = 20,
  }) {
    return _apiClient.execute(
      ListNotificationsRequest(),
      payload: ListNotificationsPayload(page: page, size: size),
    );
  }

  Future<int> countUnread() {
    return _apiClient
        .execute(CountUnreadNotificationsRequest())
        .then((result) => result.count);
  }

  Future<void> markAsRead(String id) async {
    await _apiClient.execute(MarkNotificationAsReadRequest(id: id));
  }

  Future<void> markAllAsRead() async {
    await _apiClient.execute(MarkAllNotificationsAsReadRequest());
  }

  void dispose() {}
}

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return NotificationRepository(ApiClient(dio));
});
