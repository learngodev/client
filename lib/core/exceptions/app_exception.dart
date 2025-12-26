import 'package:dio/dio.dart';

class AppException implements Exception {
  const AppException(this.message, {this.details, this.code});

  final String message;
  final String? details;
  final String? code;

  factory AppException.fromDio(DioException error) {
    final body = error.response?.data;
    String? message;
    String? details;
    if (body is Map<String, dynamic>) {
      final map = body['error'] as Map<String, dynamic>?;
      message = map?['message']?.toString();
      details = map?['details']?.toString();
    }
    message ??= error.message ?? '网络错误';
    details ??= body?.toString();
    return AppException(message, details: details);
  }

  @override
  String toString() {
    final buffer = StringBuffer('AppException: $message');
    if (code != null) {
      buffer.write(' (code: $code)');
    }
    if (details != null) {
      buffer.write(' -> $details');
    }
    return buffer.toString();
  }
}
