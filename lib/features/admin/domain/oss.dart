import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum AdminOssPolicyStatus { enabled, readOnly, disabled }

extension AdminOssPolicyStatusX on AdminOssPolicyStatus {
  String get label => switch (this) {
    AdminOssPolicyStatus.enabled => '启用',
    AdminOssPolicyStatus.readOnly => '仅读',
    AdminOssPolicyStatus.disabled => '已禁用',
  };

  String get apiValue => switch (this) {
    AdminOssPolicyStatus.enabled => 'enabled',
    AdminOssPolicyStatus.readOnly => 'read_only',
    AdminOssPolicyStatus.disabled => 'disabled',
  };

  Color color(ThemeData theme) => switch (this) {
    AdminOssPolicyStatus.enabled => theme.colorScheme.primary,
    AdminOssPolicyStatus.readOnly => theme.colorScheme.tertiary,
    AdminOssPolicyStatus.disabled => theme.colorScheme.outline,
  };

  static AdminOssPolicyStatus fromApi(String value) {
    final normalized = value.toLowerCase();
    switch (normalized) {
      case 'enabled':
        return AdminOssPolicyStatus.enabled;
      case 'read_only':
      case 'readonly':
        return AdminOssPolicyStatus.readOnly;
      default:
        return AdminOssPolicyStatus.disabled;
    }
  }
}

class AdminOssCredential {
  const AdminOssCredential({
    required this.id,
    required this.name,
    required this.endpoint,
    required this.region,
    required this.bucket,
    required this.directoryPrefix,
    required this.accessKeyMasked,
    required this.allowPublicRead,
    required this.allowMultipartUpload,
    required this.isPrimary,
    required this.active,
    required this.createdAt,
    this.lastRotatedAt,
  });

  final String id;
  final String name;
  final String endpoint;
  final String region;
  final String bucket;
  final String directoryPrefix;
  final String accessKeyMasked;
  final bool allowPublicRead;
  final bool allowMultipartUpload;
  final bool isPrimary;
  final bool active;
  final DateTime createdAt;
  final DateTime? lastRotatedAt;

  factory AdminOssCredential.fromJson(Map<String, dynamic> json) {
    DateTime? parseNullable(String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      return DateTime.tryParse(value);
    }

    return AdminOssCredential(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      endpoint: json['endpoint']?.toString() ?? '',
      region: json['region']?.toString() ?? '',
      bucket: json['bucket']?.toString() ?? '',
      directoryPrefix: json['directory_prefix']?.toString() ?? '',
      accessKeyMasked: json['access_key_masked']?.toString() ?? '',
      allowPublicRead: json['allow_public_read'] as bool? ?? false,
      allowMultipartUpload: json['allow_multipart_upload'] as bool? ?? false,
      isPrimary: json['is_primary'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
      createdAt:
          DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      lastRotatedAt: parseNullable(json['last_rotated_at']?.toString()),
    );
  }

  AdminOssCredential copyWith({
    String? name,
    String? endpoint,
    String? region,
    String? bucket,
    String? directoryPrefix,
    String? accessKeyMasked,
    bool? allowPublicRead,
    bool? allowMultipartUpload,
    bool? isPrimary,
    bool? active,
    DateTime? createdAt,
    DateTime? lastRotatedAt,
  }) {
    return AdminOssCredential(
      id: id,
      name: name ?? this.name,
      endpoint: endpoint ?? this.endpoint,
      region: region ?? this.region,
      bucket: bucket ?? this.bucket,
      directoryPrefix: directoryPrefix ?? this.directoryPrefix,
      accessKeyMasked: accessKeyMasked ?? this.accessKeyMasked,
      allowPublicRead: allowPublicRead ?? this.allowPublicRead,
      allowMultipartUpload: allowMultipartUpload ?? this.allowMultipartUpload,
      isPrimary: isPrimary ?? this.isPrimary,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      lastRotatedAt: lastRotatedAt ?? this.lastRotatedAt,
    );
  }

  String get statusLabel => active ? '启用' : '停用';

  Color statusColor(ThemeData theme) =>
      active ? theme.colorScheme.primary : theme.colorScheme.outline;

  String get createdAtLabel {
    final formatter = DateFormat('创建于 yyyy-MM-dd');
    return formatter.format(createdAt);
  }

  String get lastRotatedLabel {
    if (lastRotatedAt == null) {
      return '暂无轮换记录';
    }
    final formatter = DateFormat('最后轮换：MM-dd HH:mm');
    return formatter.format(lastRotatedAt!.toLocal());
  }
}

class AdminOssPolicy {
  const AdminOssPolicy({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.appliesTo,
    required this.lastUpdatedAt,
  });

  final String id;
  final String name;
  final String description;
  final AdminOssPolicyStatus status;
  final String appliesTo;
  final DateTime lastUpdatedAt;

  factory AdminOssPolicy.fromJson(Map<String, dynamic> json) {
    return AdminOssPolicy(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      status: AdminOssPolicyStatusX.fromApi(json['status']?.toString() ?? ''),
      appliesTo: json['applies_to']?.toString() ?? '',
      lastUpdatedAt:
          DateTime.tryParse(json['last_updated_at']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  AdminOssPolicy copyWith({
    AdminOssPolicyStatus? status,
    DateTime? lastUpdatedAt,
  }) {
    return AdminOssPolicy(
      id: id,
      name: name,
      description: description,
      status: status ?? this.status,
      appliesTo: appliesTo,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }

  String get lastUpdatedLabel {
    final formatter = DateFormat('更新于 MM-dd HH:mm');
    return formatter.format(lastUpdatedAt.toLocal());
  }
}

class AdminOssAuditLog {
  const AdminOssAuditLog({
    required this.id,
    required this.action,
    required this.operator,
    required this.detail,
    required this.createdAt,
  });

  final String id;
  final String action;
  final String operator;
  final String detail;
  final DateTime createdAt;

  factory AdminOssAuditLog.fromJson(Map<String, dynamic> json) {
    return AdminOssAuditLog(
      id: json['id']?.toString() ?? '',
      action: json['action']?.toString() ?? '',
      operator: json['operator']?.toString() ?? '',
      detail: json['detail']?.toString() ?? '',
      createdAt:
          DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  String get timeLabel => DateFormat('MM-dd HH:mm').format(createdAt.toLocal());
}
