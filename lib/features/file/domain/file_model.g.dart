// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
  fileId: json['file_id'] as String,
  fileName: json['file_name'] as String,
  fileType: json['file_type'] as String,
  size: (json['size'] as num).toInt(),
  uploadMethod: json['upload_method'] as String?,
  uploadUrl: json['upload_url'] as String?,
  relayUrl: json['relay_url'] as String?,
  downloadUrl: json['download_url'] as String?,
  key: json['key'] as String?,
);

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'file_name': instance.fileName,
      'file_type': instance.fileType,
      'size': instance.size,
      'upload_method': instance.uploadMethod,
      'upload_url': instance.uploadUrl,
      'relay_url': instance.relayUrl,
      'download_url': instance.downloadUrl,
      'key': instance.key,
    };
