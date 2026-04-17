import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/features/file/data/file_repository.dart';
import 'package:learn_go/features/file/domain/file_model.dart';
import 'package:mime/mime.dart';

final fileServiceProvider = Provider<FileService>((ref) {
  return FileService(ref);
});

final downloadUrlProvider = FutureProvider.family<String, String>((
  ref,
  fileId,
) {
  return ref.read(fileServiceProvider).getDownloadUrl(fileId);
});

class FileService {
  final Ref _ref;

  FileService(this._ref);

  Future<FileModel> uploadFile(File file) async {
    final repo = _ref.read(fileRepositoryProvider);
    final authState = _ref.read(authStateProvider);
    final role =
        authState.account?.role.name ??
        'student'; // Default to student if unknown, but should be known

    final fileName = file.path.split(Platform.pathSeparator).last;
    final fileType = lookupMimeType(file.path) ?? 'application/octet-stream';
    final size = await file.length();

    print('[FileService] Starting upload: $fileName, size: $size, type: $fileType');

    // 1. Get Upload URL
    final fileModel = await repo.getUploadUrl(
      fileName: fileName,
      fileType: fileType,
      size: size,
      role: role,
    );

    print('[FileService] Got upload info: method=${fileModel.uploadMethod}, fileId=${fileModel.fileId}');

    final method = (fileModel.uploadMethod ?? '').toLowerCase();
    if (method == 'relay') {
      // Server-side relay upload (bucket/credential config driven)
      print('[FileService] Using relay upload');
      return repo.relayUploadFile(
        file: file,
        fileId: fileModel.fileId,
        fileName: fileName,
        fileType: fileType,
      );
    }

    if (fileModel.uploadUrl == null) {
      throw Exception('Failed to get upload URL');
    }

    print('[FileService] Using direct upload to: ${fileModel.uploadUrl}');

    // 2. Upload to OSS
    await repo.uploadFileToOss(fileModel.uploadUrl!, file, fileType);

    print('[FileService] Upload completed successfully');

    return fileModel;
  }

  Future<String> getDownloadUrl(String fileId) async {
    final repo = _ref.read(fileRepositoryProvider);
    final authState = _ref.read(authStateProvider);
    final role = authState.account?.role.name ?? 'student';
    return repo.getDownloadUrl(fileId, role);
  }
}
