import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppEnvironment {
  AppEnvironment({required this.apiBaseUrl});

  final String apiBaseUrl;

  factory AppEnvironment.load() {
    final baseUrl = dotenv.maybeGet('API_BASE_URL')?.trim();
    return AppEnvironment(
      apiBaseUrl: (baseUrl?.isNotEmpty ?? false)
          ? baseUrl!
          : 'http://localhost:8080',
    );
  }
}

final appEnvironmentProvider = Provider<AppEnvironment>((ref) {
  return AppEnvironment.load();
});
