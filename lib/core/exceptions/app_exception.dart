class AppException implements Exception {
  const AppException(this.message, {this.details, this.code});

  final String message;
  final String? details;
  final String? code;

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
