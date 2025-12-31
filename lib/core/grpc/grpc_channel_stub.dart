import 'package:grpc/service_api.dart' as grpc_api;
import 'package:learn_go/core/config/app_environment.dart';

grpc_api.ClientChannel createChannel(AppEnvironment env) {
  throw UnsupportedError(
    'Unsupported platform: no gRPC channel implementation selected.',
  );
}

Future<void> shutdownChannel(grpc_api.ClientChannel channel) async {
  throw UnsupportedError(
    'Unsupported platform: no gRPC channel implementation selected.',
  );
}
