import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

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
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      unawaited(_ref.read(authStateProvider.notifier).signOut());
    }
    handler.next(err);
  }
}
