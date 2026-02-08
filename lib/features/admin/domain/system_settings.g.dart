// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminSystemSwitch _$AdminSystemSwitchFromJson(Map<String, dynamic> json) =>
    _AdminSystemSwitch(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      lastUpdatedLabel: json['last_updated_label'] as String? ?? '',
      responsible: json['responsible'] as String? ?? '',
      iconName: json['icon'] as String? ?? 'settings',
      tags: json['tags'] == null ? const [] : _parseTags(json['tags']),
      environment: json['environment'] as String? ?? '生产环境',
    );

Map<String, dynamic> _$AdminSystemSwitchToJson(_AdminSystemSwitch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'enabled': instance.enabled,
      'last_updated_label': instance.lastUpdatedLabel,
      'responsible': instance.responsible,
      'icon': instance.iconName,
      'tags': instance.tags,
      'environment': instance.environment,
    };

_AdminSystemParameter _$AdminSystemParameterFromJson(
  Map<String, dynamic> json,
) => _AdminSystemParameter(
  id: json['id'] as String? ?? '',
  key: json['key'] as String? ?? '',
  value: json['value'] as String? ?? '',
  scope: json['scope'] as String? ?? '',
  description: json['description'] as String? ?? '',
  lastUpdatedLabel: json['last_updated_label'] as String? ?? '',
  locked: json['locked'] as bool? ?? false,
);

Map<String, dynamic> _$AdminSystemParameterToJson(
  _AdminSystemParameter instance,
) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'value': instance.value,
  'scope': instance.scope,
  'description': instance.description,
  'last_updated_label': instance.lastUpdatedLabel,
  'locked': instance.locked,
};

_AdminSystemBroadcast _$AdminSystemBroadcastFromJson(
  Map<String, dynamic> json,
) => _AdminSystemBroadcast(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  messagePreview: json['message_preview'] as String? ?? '',
  status: _parseBroadcastStatus(json['status']),
  targetLabel: json['target_label'] as String? ?? '',
  scheduleLabel: json['schedule_label'] as String? ?? '',
  createdBy: json['created_by'] as String? ?? '',
  pinned: json['pinned'] as bool? ?? false,
);

Map<String, dynamic> _$AdminSystemBroadcastToJson(
  _AdminSystemBroadcast instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'message_preview': instance.messagePreview,
  'status': _$AdminSystemBroadcastStatusEnumMap[instance.status]!,
  'target_label': instance.targetLabel,
  'schedule_label': instance.scheduleLabel,
  'created_by': instance.createdBy,
  'pinned': instance.pinned,
};

const _$AdminSystemBroadcastStatusEnumMap = {
  AdminSystemBroadcastStatus.scheduled: 'scheduled',
  AdminSystemBroadcastStatus.sent: 'sent',
  AdminSystemBroadcastStatus.draft: 'draft',
};

_AdminSystemAuditLog _$AdminSystemAuditLogFromJson(Map<String, dynamic> json) =>
    _AdminSystemAuditLog(
      category: json['category'] as String? ?? '',
      action: json['action'] as String? ?? '',
      operator: json['operator'] as String? ?? '',
      timeLabel: json['time_label'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
    );

Map<String, dynamic> _$AdminSystemAuditLogToJson(
  _AdminSystemAuditLog instance,
) => <String, dynamic>{
  'category': instance.category,
  'action': instance.action,
  'operator': instance.operator,
  'time_label': instance.timeLabel,
  'detail': instance.detail,
};
