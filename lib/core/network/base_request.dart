enum HttpMethod { get, post, put, patch, delete }

abstract class BaseRequest<REQ, RES> {
  BaseRequest(
    this.path,
    this.method, {
    this.requestEncoder,
    this.responseParser,
    this.queryParameters,
    this.headers,
    this.fallbackMessage,
  });

  final String path;
  final HttpMethod method;
  final dynamic Function(REQ value)? requestEncoder;
  final RES Function(dynamic value)? responseParser;
  final Map<String, dynamic> Function(REQ value)? queryParameters;
  final Map<String, dynamic> Function(REQ value)? headers;
  final String? fallbackMessage;
}
