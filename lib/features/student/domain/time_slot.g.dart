// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => _TimeSlot(
  id: _trimString(json['id']),
  name: json['name'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TimeSlotToJson(_TimeSlot instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'sort_order': instance.sortOrder,
};
