import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/network/dio_provider.dart';
import 'package:learn_go/features/file/domain/file_model.dart';

final fileRepositoryProvider = Provider<FileRepository>((ref) {
  return FileRepository(ref.watch(dioProvider));
});

class FileRepository {
  final Dio _dio;

  FileRepository(this._dio);

  Future<FileModel> getUploadUrl({
    required String fileName,
    required String fileType,
    required int size,
    required String role, // 'student' or 'teacher'
  }) async {
    final response = await _dio.post(
      '/api/v1/files/upload',
      data: {'file_name': fileName, 'file_type': fileType, 'size': size},
    );
    return FileModel.fromJson(response.data['data']);
  }

  Future<String> getDownloadUrl(String fileId, String role) async {
    final response = await _dio.get('/api/v1/files/download/$fileId');
    return response.data['data']['url'];
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
}
