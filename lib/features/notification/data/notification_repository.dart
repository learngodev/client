import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/notification/domain/notification.dart';

class NotificationRepository {
  NotificationRepository(this._dio);

  final Dio _dio;

  // REST API Methods

  Future<List<AppNotification>> listNotifications({
    int page = 1,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/api/v1/notifications',
      queryParameters: {'page': page, 'size': size},
    );
    final data = response.data as Map<String, dynamic>;
    final items = data['items'] as List;
    return items.map((e) => AppNotification.fromJson(e)).toList();
  }

  Future<int> countUnread() async {
    final response = await _dio.get('/api/v1/notifications/unread-count');
    return response.data['count'] as int;
  }

  Future<void> markAsRead(String id) async {
    await _dio.put('/api/v1/notifications/$id/read');
  }

  Future<void> markAllAsRead() async {
    await _dio.put('/api/v1/notifications/read-all');
  }

  void dispose() {}
}

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return NotificationRepository(dio);
});
