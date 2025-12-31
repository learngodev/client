import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart' as grpc_api;
import 'package:learn_go/core/config/app_environment.dart';

grpc_api.ClientChannel createChannel(AppEnvironment env) {
  final uri = Uri.parse(env.apiBaseUrl);
  final host = uri.host;

  return ClientChannel(
    host,
    port: env.grpcPort,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
}

Future<void> shutdownChannel(grpc_api.ClientChannel channel) async {
  try {
    await channel.shutdown();
  } catch (_) {
    // ignore: best-effort
  }
}
