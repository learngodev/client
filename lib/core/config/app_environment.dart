import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppEnvironment {
  AppEnvironment({
    required this.apiBaseUrl,
    required this.grpcPort,
    required this.grpcWebPort,
  });

  final String apiBaseUrl;
  final int grpcPort;
  final int grpcWebPort;

  factory AppEnvironment.load() {
    final baseUrl = dotenv.maybeGet('API_BASE_URL')?.trim();

    final grpcPort = int.tryParse(dotenv.maybeGet('GRPC_PORT')?.trim() ?? '');
    final grpcWebPort = int.tryParse(
      dotenv.maybeGet('GRPC_WEB_PORT')?.trim() ?? '',
    );

    return AppEnvironment(
      apiBaseUrl: (baseUrl?.isNotEmpty ?? false)
          ? baseUrl!
          : 'http://localhost:8080',
      grpcPort: grpcPort ?? 9090,
      grpcWebPort: grpcWebPort ?? 9091,
    );
  }
}

final appEnvironmentProvider = Provider<AppEnvironment>((ref) {
  return AppEnvironment.load();
});
