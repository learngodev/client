import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/base_request.dart';
import '../domain/file_model.dart';

part 'file_api_requests.freezed.dart';
part 'file_api_requests.g.dart';

@freezed
abstract class GetUploadUrlPayload with _$GetUploadUrlPayload {
  const factory GetUploadUrlPayload({
    required String fileName,
    required String fileType,
    required int size,
  }) = _GetUploadUrlPayload;

  factory GetUploadUrlPayload.fromJson(Map<String, dynamic> json) =>
      _$GetUploadUrlPayloadFromJson(json);
}

class GetUploadUrlRequest extends BaseRequest<GetUploadUrlPayload, FileModel> {
  GetUploadUrlRequest()
    : super(
        '/api/v1/files/upload',
        HttpMethod.post,
        fallbackMessage: '获取上传地址失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => FileModel.fromJson(value),
      );
}

@freezed
abstract class DownloadUrlResult with _$DownloadUrlResult {
  const factory DownloadUrlResult({required String url}) = _DownloadUrlResult;

  factory DownloadUrlResult.fromJson(Map<String, dynamic> json) =>
      _$DownloadUrlResultFromJson(json);
}

class GetDownloadUrlRequest extends BaseRequest<void, DownloadUrlResult> {
  GetDownloadUrlRequest({required String fileId})
    : super(
        '/api/v1/files/download/$fileId',
        HttpMethod.get,
        fallbackMessage: '获取下载地址失败',
        responseParser: (value) => DownloadUrlResult.fromJson(value),
      );
}

@freezed
abstract class RelayUploadFilePayload with _$RelayUploadFilePayload {
  const factory RelayUploadFilePayload({
    required File file,
    String? fileId,
    required String fileName,
    required String fileType,
  }) = _RelayUploadFilePayload;
}

class RelayUploadFileRequest
    extends BaseRequest<RelayUploadFilePayload, FileModel> {
  RelayUploadFileRequest()
    : super(
        '/api/v1/files/upload/relay',
        HttpMethod.post,
        fallbackMessage: '中转上传失败',
        requestEncoder: _encode,
        headers: (_) => const {'Content-Type': 'multipart/form-data'},
        responseParser: (value) => FileModel.fromJson(value),
      );

  static FormData _encode(RelayUploadFilePayload value) {
    return FormData.fromMap({
      'file': MultipartFile.fromFileSync(
        value.file.path,
        filename: value.fileName,
      ),
      if (value.fileId != null && value.fileId!.isNotEmpty)
        'file_id': value.fileId,
      'file_name': value.fileName,
      'file_type': value.fileType,
    });
  }
}
