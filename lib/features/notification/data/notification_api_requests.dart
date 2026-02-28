import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/base_request.dart';
import '../domain/notification.dart';

part 'notification_api_requests.freezed.dart';
part 'notification_api_requests.g.dart';

@freezed
abstract class ListNotificationsPayload with _$ListNotificationsPayload {
  const factory ListNotificationsPayload({
    @Default(1) int page,
    @Default(20) int size,
  }) = _ListNotificationsPayload;

  factory ListNotificationsPayload.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationsPayloadFromJson(json);
}

@freezed
abstract class ListNotificationsResult with _$ListNotificationsResult {
  const factory ListNotificationsResult({
    @Default(<AppNotification>[]) List<AppNotification> items,
  }) = _ListNotificationsResult;

  factory ListNotificationsResult.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationsResultFromJson(json);
}

class ListNotificationsRequest
    extends BaseRequest<ListNotificationsPayload, List<AppNotification>> {
  ListNotificationsRequest()
    : super(
        '/api/v1/notifications',
        HttpMethod.get,
        fallbackMessage: '获取通知失败',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            ListNotificationsResult.fromJson(value).items,
      );
}

@freezed
abstract class CountUnreadNotificationsResult
    with _$CountUnreadNotificationsResult {
  const factory CountUnreadNotificationsResult({required int count}) =
      _CountUnreadNotificationsResult;

  factory CountUnreadNotificationsResult.fromJson(Map<String, dynamic> json) =>
      _$CountUnreadNotificationsResultFromJson(json);
}

class CountUnreadNotificationsRequest
    extends BaseRequest<void, CountUnreadNotificationsResult> {
  CountUnreadNotificationsRequest()
    : super(
        '/api/v1/notifications/unread-count',
        HttpMethod.get,
        fallbackMessage: '获取未读通知数量失败',
        responseParser: (value) =>
            CountUnreadNotificationsResult.fromJson(value),
      );
}

class MarkNotificationAsReadRequest extends BaseRequest<void, void> {
  MarkNotificationAsReadRequest({required String id})
    : super(
        '/api/v1/notifications/$id/read',
        HttpMethod.put,
        fallbackMessage: '标记通知已读失败',
      );
}

class MarkAllNotificationsAsReadRequest extends BaseRequest<void, void> {
  MarkAllNotificationsAsReadRequest()
    : super(
        '/api/v1/notifications/read-all',
        HttpMethod.put,
        fallbackMessage: '标记全部通知已读失败',
      );
}
