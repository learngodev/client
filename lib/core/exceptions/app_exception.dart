import 'package:dio/dio.dart';

class AppException implements Exception {
  const AppException(this.message, {this.details, this.code});

  final String message;
  final String? details;
  final String? code;

  factory AppException.fromDio(DioException error) {
    final body = error.response?.data;
    final statusCode = error.response?.statusCode;
    String? message;
    String? details;
    if (body is Map<String, dynamic>) {
      final map = body['error'] as Map<String, dynamic>?;
      message = map?['message']?.toString();
      details = map?['details']?.toString();
    }

    message = _normalizeMessage(
      message,
      statusCode: statusCode,
      dioError: error,
    );
    details ??= _normalizeDetails(body, statusCode: statusCode);

    return AppException(
      message,
      details: details,
      code: statusCode?.toString(),
    );
  }

  factory AppException.fromServer({
    required String? message,
    required String? details,
    required int? statusCode,
  }) {
    return AppException(
      _normalizeServerMessage(message, statusCode: statusCode),
      details: _normalizeDetails(details, statusCode: statusCode),
      code: statusCode?.toString(),
    );
  }

  @override
  String toString() {
    return message;
  }

  static String _normalizeMessage(
    String? raw, {
    required int? statusCode,
    required DioException dioError,
  }) {
    final message = raw?.trim();
    if (message != null && message.isNotEmpty) {
      return _normalizeServerMessage(message, statusCode: statusCode);
    }

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return '请求超时，请检查网络后重试';
      case DioExceptionType.connectionError:
        return '网络连接异常，请检查网络后重试';
      case DioExceptionType.cancel:
        return '请求已取消';
      default:
        break;
    }

    return switch (statusCode) {
      400 => '请求参数有误，请检查后重试',
      401 => '登录状态已失效，请重新登录',
      403 => '当前账号没有权限执行此操作',
      404 => '未找到请求的数据，请刷新后重试',
      409 => '请求冲突，请刷新页面后重试',
      500 || 502 || 503 || 504 => '服务器开小差了，请稍后重试',
      _ => '请求失败，请稍后重试',
    };
  }

  static String _normalizeServerMessage(
    String? message, {
    required int? statusCode,
  }) {
    final raw = message?.trim();
    if (raw == null || raw.isEmpty) {
      return _statusFallbackMessage(statusCode);
    }
    if (_containsChinese(raw)) {
      return raw;
    }

    final normalized = raw.toLowerCase();
    const mapping = <String, String>{
      'missing authorization': '未检测到登录凭证，请先登录后重试',
      'invalid token': '登录状态已失效，请重新登录',
      'invalid token claims': '登录状态已失效，请重新登录',
      'invalid token subject': '登录状态已失效，请重新登录',
      'insufficient role': '当前账号没有权限执行此操作',
      'invalid request': '请求参数不正确，请检查后重试',
      'invalid request body': '请求参数格式不正确，请检查后重试',
      'validation failed': '提交的数据不符合要求，请检查后重试',
      'validation error': '提交的数据不符合要求，请检查后重试',
      'schedule conflict': '课表时间冲突，请调整时间后重试',
      'invalid schedule': '课表参数无效，请检查后重试',
    };
    final mapped = mapping[normalized];
    if (mapped != null) {
      return mapped;
    }

    if (normalized.startsWith('failed_to_') ||
        normalized.startsWith('failed to ') ||
        normalized.startsWith('unable to ')) {
      return '操作失败，请稍后重试';
    }

    return _statusFallbackMessage(statusCode);
  }

  static String _statusFallbackMessage(int? statusCode) {
    return switch (statusCode) {
      400 => '请求参数有误，请检查后重试',
      401 => '登录状态已失效，请重新登录',
      403 => '当前账号没有权限执行此操作',
      404 => '未找到请求的数据，请刷新后重试',
      409 => '请求冲突，请刷新页面后重试',
      500 || 502 || 503 || 504 => '服务器开小差了，请稍后重试',
      _ => '请求失败，请稍后重试',
    };
  }

  static String? _normalizeDetails(dynamic body, {required int? statusCode}) {
    if (statusCode != null && statusCode >= 500) {
      return null;
    }
    if (body == null) {
      return null;
    }
    final text = body.toString().trim();
    if (text.isEmpty || !_containsChinese(text)) {
      return null;
    }
    return text.length > 300 ? text.substring(0, 300) : text;
  }

  static bool _containsChinese(String value) {
    final pattern = RegExp(r'[\u4E00-\u9FFF]');
    return pattern.hasMatch(value);
  }
}
