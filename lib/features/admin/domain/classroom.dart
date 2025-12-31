import 'package:freezed_annotation/freezed_annotation.dart';

part 'classroom.freezed.dart';
part 'classroom.g.dart';

@freezed
abstract class Classroom with _$Classroom {
  const factory Classroom({
    required String id,
    required String schoolId,
    required String location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Classroom;

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);
}
