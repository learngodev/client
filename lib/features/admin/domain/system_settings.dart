import 'package:flutter/material.dart';

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

class AdminSystemSwitch {
  const AdminSystemSwitch({
    required this.id,
    required this.title,
    required this.description,
    required this.enabled,
    required this.lastUpdatedLabel,
    required this.responsible,
    required this.iconName,
    this.tags = const <String>[],
    this.environment = '生产环境',
  });

  final String id;
  final String title;
  final String description;
  final bool enabled;
  final String lastUpdatedLabel;
  final String responsible;
  final String iconName;
  final List<String> tags;
  final String environment;

  IconData get icon => _iconFromName(iconName);

  AdminSystemSwitch copyWith({
    bool? enabled,
    String? lastUpdatedLabel,
    List<String>? tags,
  }) {
    return AdminSystemSwitch(
      id: id,
      title: title,
      description: description,
      enabled: enabled ?? this.enabled,
      lastUpdatedLabel: lastUpdatedLabel ?? this.lastUpdatedLabel,
      responsible: responsible,
      iconName: iconName,
      tags: tags ?? this.tags,
      environment: environment,
    );
  }

  factory AdminSystemSwitch.fromJson(Map<String, dynamic> json) {
    final tags = <String>[];
    final rawTags = json['tags'];
    if (rawTags is List) {
      for (final tag in rawTags) {
        if (tag is String && tag.trim().isNotEmpty) {
          tags.add(tag.trim());
        }
      }
    }
    return AdminSystemSwitch(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      enabled: json['enabled'] == true,
      lastUpdatedLabel: json['last_updated_label']?.toString() ?? '',
      responsible: json['responsible']?.toString() ?? '',
      iconName: json['icon']?.toString() ?? 'settings',
      tags: tags,
      environment: json['environment']?.toString() ?? '生产环境',
    );
  }

  static IconData _iconFromName(String name) {
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
}

class AdminSystemParameter {
  const AdminSystemParameter({
    required this.id,
    required this.key,
    required this.value,
    required this.scope,
    required this.description,
    required this.lastUpdatedLabel,
    this.locked = false,
  });

  final String id;
  final String key;
  final String value;
  final String scope;
  final String description;
  final String lastUpdatedLabel;
  final bool locked;

  AdminSystemParameter copyWith({String? value, String? lastUpdatedLabel}) {
    return AdminSystemParameter(
      id: id,
      key: key,
      value: value ?? this.value,
      scope: scope,
      description: description,
      lastUpdatedLabel: lastUpdatedLabel ?? this.lastUpdatedLabel,
      locked: locked,
    );
  }

  factory AdminSystemParameter.fromJson(Map<String, dynamic> json) {
    return AdminSystemParameter(
      id: json['id']?.toString() ?? '',
      key: json['key']?.toString() ?? '',
      value: json['value']?.toString() ?? '',
      scope: json['scope']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      lastUpdatedLabel: json['last_updated_label']?.toString() ?? '',
      locked: json['locked'] == true,
    );
  }
}

class AdminSystemBroadcast {
  const AdminSystemBroadcast({
    required this.id,
    required this.title,
    required this.messagePreview,
    required this.status,
    required this.targetLabel,
    required this.scheduleLabel,
    required this.createdBy,
    this.pinned = false,
  });

  final String id;
  final String title;
  final String messagePreview;
  final AdminSystemBroadcastStatus status;
  final String targetLabel;
  final String scheduleLabel;
  final String createdBy;
  final bool pinned;

  AdminSystemBroadcast copyWith({
    AdminSystemBroadcastStatus? status,
    bool? pinned,
    String? scheduleLabel,
  }) {
    return AdminSystemBroadcast(
      id: id,
      title: title,
      messagePreview: messagePreview,
      status: status ?? this.status,
      targetLabel: targetLabel,
      scheduleLabel: scheduleLabel ?? this.scheduleLabel,
      createdBy: createdBy,
      pinned: pinned ?? this.pinned,
    );
  }

  factory AdminSystemBroadcast.fromJson(Map<String, dynamic> json) {
    final statusValue = json['status']?.toString() ?? '';
    return AdminSystemBroadcast(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      messagePreview: json['message_preview']?.toString() ?? '',
      status: AdminSystemBroadcastStatusX.fromApiValue(statusValue),
      targetLabel: json['target_label']?.toString() ?? '',
      scheduleLabel: json['schedule_label']?.toString() ?? '',
      createdBy: json['created_by']?.toString() ?? '',
      pinned: json['pinned'] == true,
    );
  }
}

class AdminSystemAuditLog {
  const AdminSystemAuditLog({
    required this.category,
    required this.action,
    required this.operator,
    required this.timeLabel,
    required this.detail,
  });

  final String category;
  final String action;
  final String operator;
  final String timeLabel;
  final String detail;

  factory AdminSystemAuditLog.fromJson(Map<String, dynamic> json) {
    return AdminSystemAuditLog(
      category: json['category']?.toString() ?? '',
      action: json['action']?.toString() ?? '',
      operator: json['operator']?.toString() ?? '',
      timeLabel: json['time_label']?.toString() ?? '',
      detail: json['detail']?.toString() ?? '',
    );
  }
}
