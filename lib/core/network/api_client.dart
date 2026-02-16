import 'package:dio/dio.dart';

import '../exceptions/app_exception.dart';
import 'base_request.dart';

class ApiClient {
  const ApiClient(this._dio);

  final Dio _dio;

  Future<RES> execute<REQ, RES>(
    BaseRequest<REQ, RES> request, {
    REQ? payload,
  }) async {
    try {
      final response = await _send(request, payload: payload);
      final body = response.data;
      if (body is! Map<String, dynamic>) {
        throw AppException(request.fallbackMessage ?? '响应数据格式错误');
      }

      final success = body['success'] as bool? ?? false;
      if (!success) {
        final error = body['error'] as Map<String, dynamic>?;
        final message =
            error?['message']?.toString() ?? request.fallbackMessage ?? '请求失败';
        final details = error?['details']?.toString();
        throw AppException(message, details: details);
      }

      if (request.responseParser != null) {
        return request.responseParser!(body['data']);
      }

      return body['data'];
    } on DioException catch (error) {
      throw AppException.fromDio(error);
    }
  }

  Future<Response<dynamic>> _send<REQ, RES>(
    BaseRequest<REQ, RES> request, {
    REQ? payload,
  }) {
    final data = payload == null ? null : request.requestEncoder?.call(payload);
    final query = payload == null
        ? null
        : request.queryParameters?.call(payload);
    final requestHeaders = payload == null
        ? null
        : request.headers?.call(payload);

    final options = requestHeaders == null
        ? null
        : Options(headers: requestHeaders);

    return switch (request.method) {
      HttpMethod.get => _dio.get<dynamic>(
        request.path,
        queryParameters: query,
        options: options,
      ),
      HttpMethod.post => _dio.post<dynamic>(
        request.path,
        queryParameters: query,
        data: data,
        options: options,
      ),
      HttpMethod.put => _dio.put<dynamic>(
        request.path,
        queryParameters: query,
        data: data,
        options: options,
      ),
      HttpMethod.patch => _dio.patch<dynamic>(
        request.path,
        queryParameters: query,
        data: data,
        options: options,
      ),
      HttpMethod.delete => _dio.delete<dynamic>(
        request.path,
        queryParameters: query,
        data: data,
        options: options,
      ),
    };
  }
}
