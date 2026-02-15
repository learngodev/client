import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'oss.freezed.dart';
part 'oss.g.dart';

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

AdminOssPolicyStatus _parsePolicyStatus(dynamic value) {
  return AdminOssPolicyStatusX.fromApi((value ?? '').toString());
}

@freezed
abstract class AdminOssCredential with _$AdminOssCredential {
  const AdminOssCredential._();

  const factory AdminOssCredential({
    @Default('') String id,
    @Default('') String name,
    @Default('') String endpoint,
    @Default('') String internalEndpoint,
    @Default('') String region,
    @Default('') String bucket,
    @Default('') String directoryPrefix,
    @Default('') String accessKeyMasked,
    @Default(false) bool allowPublicRead,

    @Default(false) bool allowMultipartUpload,
    @Default(false) bool useRelayUpload,
    @Default(false) bool isPrimary,
    @Default(false) bool active,
    required DateTime createdAt,
    DateTime? lastRotatedAt,
  }) = _AdminOssCredential;

  factory AdminOssCredential.fromJson(Map<String, dynamic> json) =>
      _$AdminOssCredentialFromJson(json);

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

@freezed
abstract class AdminOssPolicy with _$AdminOssPolicy {
  const AdminOssPolicy._();

  const factory AdminOssPolicy({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @JsonKey(fromJson: _parsePolicyStatus) required AdminOssPolicyStatus status,
    @Default('') String appliesTo,
    required DateTime lastUpdatedAt,
  }) = _AdminOssPolicy;

  factory AdminOssPolicy.fromJson(Map<String, dynamic> json) =>
      _$AdminOssPolicyFromJson(json);

  String get lastUpdatedLabel {
    final formatter = DateFormat('更新于 MM-dd HH:mm');
    return formatter.format(lastUpdatedAt.toLocal());
  }
}

@freezed
abstract class AdminOssAuditLog with _$AdminOssAuditLog {
  const AdminOssAuditLog._();

  const factory AdminOssAuditLog({
    @Default('') String id,
    @Default('') String action,
    @Default('') String operator,
    @Default('') String detail,
    required DateTime createdAt,
  }) = _AdminOssAuditLog;

  factory AdminOssAuditLog.fromJson(Map<String, dynamic> json) =>
      _$AdminOssAuditLogFromJson(json);

  String get timeLabel => DateFormat('MM-dd HH:mm').format(createdAt.toLocal());
}
