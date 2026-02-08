import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_settings.freezed.dart';
part 'system_settings.g.dart';

enum AdminSystemBroadcastStatus { scheduled, sent, draft }

extension AdminSystemBroadcastStatusX on AdminSystemBroadcastStatus {
  String get label {
    return switch (this) {
      AdminSystemBroadcastStatus.scheduled => '待发送',
      AdminSystemBroadcastStatus.sent => '已发送',
      AdminSystemBroadcastStatus.draft => '草稿',
    };
  }

  Color color(ThemeData theme) {
    return switch (this) {
      AdminSystemBroadcastStatus.scheduled => theme.colorScheme.primary,
      AdminSystemBroadcastStatus.sent => theme.colorScheme.tertiary,
      AdminSystemBroadcastStatus.draft => theme.colorScheme.outline,
    };
  }

  static AdminSystemBroadcastStatus fromApiValue(String value) {
    switch (value.toLowerCase()) {
      case 'sent':
        return AdminSystemBroadcastStatus.sent;
      case 'draft':
        return AdminSystemBroadcastStatus.draft;
      case 'scheduled':
      default:
        return AdminSystemBroadcastStatus.scheduled;
    }
  }
}

AdminSystemBroadcastStatus _parseBroadcastStatus(dynamic value) {
  return AdminSystemBroadcastStatusX.fromApiValue((value ?? '').toString());
}

IconData _iconFromName(String name) {
  switch (name.trim().toLowerCase()) {
    case 'nightlight':
      return Icons.nightlight_round;
    case 'notifications_active':
      return Icons.notifications_active_outlined;
    case 'auto_awesome':
      return Icons.auto_awesome_outlined;
    case 'campaign':
      return Icons.campaign_outlined;
    case 'security':
      return Icons.security_outlined;
    default:
      return Icons.settings_outlined;
  }
}

List<String> _parseTags(dynamic value) {
  final tags = <String>[];
  if (value is List) {
    for (final tag in value) {
      if (tag is String && tag.trim().isNotEmpty) {
        tags.add(tag.trim());
      }
    }
  }
  return tags;
}

@freezed
abstract class AdminSystemSwitch with _$AdminSystemSwitch {
  const AdminSystemSwitch._();

  const factory AdminSystemSwitch({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool enabled,
    @Default('') String lastUpdatedLabel,
    @Default('') String responsible,
    @JsonKey(name: 'icon') @Default('settings') String iconName,
    @JsonKey(fromJson: _parseTags) @Default([]) List<String> tags,
    @Default('生产环境') String environment,
  }) = _AdminSystemSwitch;

  factory AdminSystemSwitch.fromJson(Map<String, dynamic> json) =>
      _$AdminSystemSwitchFromJson(json);

  IconData get icon => _iconFromName(iconName);
}

@freezed
abstract class AdminSystemParameter with _$AdminSystemParameter {
  const AdminSystemParameter._();

  const factory AdminSystemParameter({
    @Default('') String id,
    @Default('') String key,
    @Default('') String value,
    @Default('') String scope,
    @Default('') String description,
    @Default('') String lastUpdatedLabel,
    @Default(false) bool locked,
  }) = _AdminSystemParameter;

  factory AdminSystemParameter.fromJson(Map<String, dynamic> json) =>
      _$AdminSystemParameterFromJson(json);
}

@freezed
abstract class AdminSystemBroadcast with _$AdminSystemBroadcast {
  const AdminSystemBroadcast._();

  const factory AdminSystemBroadcast({
    @Default('') String id,
    @Default('') String title,
    @Default('') String messagePreview,
    @JsonKey(fromJson: _parseBroadcastStatus)
    required AdminSystemBroadcastStatus status,
    @Default('') String targetLabel,
    @Default('') String scheduleLabel,
    @Default('') String createdBy,
    @Default(false) bool pinned,
  }) = _AdminSystemBroadcast;

  factory AdminSystemBroadcast.fromJson(Map<String, dynamic> json) =>
      _$AdminSystemBroadcastFromJson(json);
}

@freezed
abstract class AdminSystemAuditLog with _$AdminSystemAuditLog {
  const AdminSystemAuditLog._();

  const factory AdminSystemAuditLog({
    @Default('') String category,
    @Default('') String action,
    @Default('') String operator,
    @Default('') String timeLabel,
    @Default('') String detail,
  }) = _AdminSystemAuditLog;

  factory AdminSystemAuditLog.fromJson(Map<String, dynamic> json) =>
      _$AdminSystemAuditLogFromJson(json);
}
