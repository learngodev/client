import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_ops.freezed.dart';
part 'ai_ops.g.dart';

@freezed
abstract class AIOperation with _$AIOperation {
  const factory AIOperation({
    required String action,
    required Map<String, dynamic> data,
  }) = _AIOperation;

  factory AIOperation.fromJson(Map<String, dynamic> json) =>
      _$AIOperationFromJson(json);
}
