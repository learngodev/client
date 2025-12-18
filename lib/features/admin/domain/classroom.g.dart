// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Classroom _$ClassroomFromJson(Map<String, dynamic> json) => _Classroom(
  id: json['id'] as String,
  schoolId: json['school_id'] as String,
  location: json['location'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ClassroomToJson(_Classroom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'location': instance.location,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
