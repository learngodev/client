// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListNotificationsPayload _$ListNotificationsPayloadFromJson(
  Map<String, dynamic> json,
) => _ListNotificationsPayload(
  page: (json['page'] as num?)?.toInt() ?? 1,
  size: (json['size'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$ListNotificationsPayloadToJson(
  _ListNotificationsPayload instance,
) => <String, dynamic>{'page': instance.page, 'size': instance.size};

_ListNotificationsResult _$ListNotificationsResultFromJson(
  Map<String, dynamic> json,
) => _ListNotificationsResult(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AppNotification>[],
);

Map<String, dynamic> _$ListNotificationsResultToJson(
  _ListNotificationsResult instance,
) => <String, dynamic>{'items': instance.items};

_CountUnreadNotificationsResult _$CountUnreadNotificationsResultFromJson(
  Map<String, dynamic> json,
) => _CountUnreadNotificationsResult(count: (json['count'] as num).toInt());

Map<String, dynamic> _$CountUnreadNotificationsResultToJson(
  _CountUnreadNotificationsResult instance,
) => <String, dynamic>{'count': instance.count};
