// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetUploadUrlPayload _$GetUploadUrlPayloadFromJson(Map<String, dynamic> json) =>
    _GetUploadUrlPayload(
      fileName: json['file_name'] as String,
      fileType: json['file_type'] as String,
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$GetUploadUrlPayloadToJson(
  _GetUploadUrlPayload instance,
) => <String, dynamic>{
  'file_name': instance.fileName,
  'file_type': instance.fileType,
  'size': instance.size,
};

_DownloadUrlResult _$DownloadUrlResultFromJson(Map<String, dynamic> json) =>
    _DownloadUrlResult(url: json['url'] as String);

Map<String, dynamic> _$DownloadUrlResultToJson(_DownloadUrlResult instance) =>
    <String, dynamic>{'url': instance.url};
