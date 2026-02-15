// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOssCredential _$AdminOssCredentialFromJson(Map<String, dynamic> json) =>
    _AdminOssCredential(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      endpoint: json['endpoint'] as String? ?? '',
      internalEndpoint: json['internal_endpoint'] as String? ?? '',
      region: json['region'] as String? ?? '',
      bucket: json['bucket'] as String? ?? '',
      directoryPrefix: json['directory_prefix'] as String? ?? '',
      accessKeyMasked: json['access_key_masked'] as String? ?? '',
      allowPublicRead: json['allow_public_read'] as bool? ?? false,
      allowMultipartUpload: json['allow_multipart_upload'] as bool? ?? false,
      useRelayUpload: json['use_relay_upload'] as bool? ?? false,
      isPrimary: json['is_primary'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastRotatedAt: json['last_rotated_at'] == null
          ? null
          : DateTime.parse(json['last_rotated_at'] as String),
    );

Map<String, dynamic> _$AdminOssCredentialToJson(_AdminOssCredential instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'endpoint': instance.endpoint,
      'internal_endpoint': instance.internalEndpoint,
      'region': instance.region,
      'bucket': instance.bucket,
      'directory_prefix': instance.directoryPrefix,
      'access_key_masked': instance.accessKeyMasked,
      'allow_public_read': instance.allowPublicRead,
      'allow_multipart_upload': instance.allowMultipartUpload,
      'use_relay_upload': instance.useRelayUpload,
      'is_primary': instance.isPrimary,
      'active': instance.active,
      'created_at': instance.createdAt.toIso8601String(),
      'last_rotated_at': instance.lastRotatedAt?.toIso8601String(),
    };

_AdminOssPolicy _$AdminOssPolicyFromJson(Map<String, dynamic> json) =>
    _AdminOssPolicy(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      status: _parsePolicyStatus(json['status']),
      appliesTo: json['applies_to'] as String? ?? '',
      lastUpdatedAt: DateTime.parse(json['last_updated_at'] as String),
    );

Map<String, dynamic> _$AdminOssPolicyToJson(_AdminOssPolicy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': _$AdminOssPolicyStatusEnumMap[instance.status]!,
      'applies_to': instance.appliesTo,
      'last_updated_at': instance.lastUpdatedAt.toIso8601String(),
    };

const _$AdminOssPolicyStatusEnumMap = {
  AdminOssPolicyStatus.enabled: 'enabled',
  AdminOssPolicyStatus.readOnly: 'readOnly',
  AdminOssPolicyStatus.disabled: 'disabled',
};

_AdminOssAuditLog _$AdminOssAuditLogFromJson(Map<String, dynamic> json) =>
    _AdminOssAuditLog(
      id: json['id'] as String? ?? '',
      action: json['action'] as String? ?? '',
      operator: json['operator'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AdminOssAuditLogToJson(_AdminOssAuditLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'operator': instance.operator,
      'detail': instance.detail,
      'created_at': instance.createdAt.toIso8601String(),
    };
