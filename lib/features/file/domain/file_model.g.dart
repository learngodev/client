// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
  id: json['id'] as String,
  fileName: json['file_name'] as String,
  fileType: json['file_type'] as String,
  size: (json['size'] as num).toInt(),
  uploadUrl: json['upload_url'] as String?,
  downloadUrl: json['download_url'] as String?,
  key: json['key'] as String?,
);

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.fileName,
      'file_type': instance.fileType,
      'size': instance.size,
      'upload_url': instance.uploadUrl,
      'download_url': instance.downloadUrl,
      'key': instance.key,
    };
