import 'package:grpc/grpc_web.dart';
import 'package:grpc/service_api.dart' as grpc_api;
import 'package:learn_go/core/config/app_environment.dart';

grpc_api.ClientChannel createChannel(AppEnvironment env) {
  final apiUri = Uri.parse(env.apiBaseUrl);

  final scheme = apiUri.scheme.isEmpty ? 'http' : apiUri.scheme;

  // gRPC-Web 走浏览器 http(s)；使用与 API 相同的 scheme/host，但端口为 GRPC_WEB_PORT。
  final grpcWebUri = Uri(
    scheme: scheme,
    host: apiUri.host,
    port: env.grpcWebPort,
  );

  return GrpcWebClientChannel.xhr(grpcWebUri);
}

Future<void> shutdownChannel(grpc_api.ClientChannel channel) async {
  try {
    if (channel is GrpcWebClientChannel) {
      channel.terminate();
    } else {
      await channel.shutdown();
    }
  } catch (_) {
    // ignore: best-effort
  }
}
