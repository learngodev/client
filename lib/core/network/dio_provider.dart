import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/utils/logger.dart';
import 'package:logger/logger.dart';

import '../../features/auth/application/auth_controller.dart';
import '../config/app_environment.dart';

final dioProvider = Provider<Dio>((ref) {
  final env = ref.watch(appEnvironmentProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      contentType: 'application/json',
    ),
  );

  dio.interceptors.add(_AuthInterceptor(ref));
  if (kDebugMode) dio.interceptors.add(_LogInterceptor(logger));

  return dio;
});

class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._ref);

  final Ref _ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final tokens = _ref.read(authStateProvider).tokens;
    if (tokens != null && tokens.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      unawaited(_ref.read(authControllerProvider.notifier).signOut());
    }
    super.onError(err, handler);
  }
}

class _LogInterceptor extends Interceptor {
  _LogInterceptor(this.logger);

  final Logger logger;

  String stringifyData(dynamic data) {
    if (data is Map || data is List) {
      return JsonEncoder.withIndent('  ').convert(data);
    }
    return data.toString();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final dataText = stringifyData(options.data);
    logger.t("👉🏻Request: ${options.method} ${options.uri}:\n$dataText");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final dataText = stringifyData(response.data);
    logger.t(
      "👈🏻Response: ${response.requestOptions.method} ${response.requestOptions.uri}:\n$dataText",
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      "Error: ${err.requestOptions.method} ${err.requestOptions.uri}",
      error: err.response?.data ?? err.message,
      stackTrace: err.stackTrace,
    );
    super.onError(err, handler);
  }
}
