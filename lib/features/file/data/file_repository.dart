import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/network/api_client.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/file/domain/file_model.dart';

import 'file_api_requests.dart';

final fileRepositoryProvider = Provider<FileRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return FileRepository(ApiClient(dio));
});

class FileRepository {
  final ApiClient _apiClient;

  const FileRepository(this._apiClient);

  Future<FileModel> getUploadUrl({
    required String fileName,
    required String fileType,
    required int size,
    required String role, // 'student' or 'teacher'
  }) {
    return _apiClient.execute(
      GetUploadUrlRequest(),
      payload: GetUploadUrlPayload(
        fileName: fileName,
        fileType: fileType,
        size: size,
      ),
    );
  }

  Future<String> getDownloadUrl(String fileId, String role) {
    return _apiClient
        .execute(GetDownloadUrlRequest(fileId: fileId))
        .then((result) => result.url);
  }

  Future<void> uploadFileToOss(
    String uploadUrl,
    File file,
    String contentType,
  ) async {
    // Use a separate Dio instance for direct upload to avoid default interceptors
    final dio = Dio();
    await dio.put(
      uploadUrl,
      data: file.openRead(),
      options: Options(
        contentType: contentType,
        headers: {Headers.contentLengthHeader: await file.length()},
      ),
    );
  }

  Future<FileModel> relayUploadFile({
    required File file,
    String? fileId,
    required String fileName,
    required String fileType,
  }) {
    return _apiClient.execute(
      RelayUploadFileRequest(),
      payload: RelayUploadFilePayload(
        file: file,
        fileId: fileId,
        fileName: fileName,
        fileType: fileType,
      ),
    );
  }
}
