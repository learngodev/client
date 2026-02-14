import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

@freezed
abstract class TimeSlot with _$TimeSlot {
  const TimeSlot._();

  const factory TimeSlot({
    @JsonKey(fromJson: _trimString) required String id,
    required String name,
    required String startTime,
    required String endTime,
    @Default(0) int sortOrder,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);

  String get timeRange => '$startTime - $endTime';
}

String _trimString(dynamic value) {
  return value.toString().trim();
}
