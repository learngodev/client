import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
abstract class FileModel with _$FileModel {
  const factory FileModel({
    required String fileId,
    required String fileName,
    required String fileType,
    required int size,
    String? uploadMethod,
    String? uploadUrl,
    String? relayUrl,
    String? downloadUrl,
    String? key,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
