import 'package:grpc/service_api.dart' as grpc_api;
import 'package:learn_go/core/config/app_environment.dart';

import 'grpc_channel_stub.dart'
    if (dart.library.html) 'grpc_channel_web.dart'
    if (dart.library.io) 'grpc_channel_io.dart';

grpc_api.ClientChannel createGrpcChannel(AppEnvironment env) =>
    createChannel(env);

Future<void> shutdownGrpcChannel(grpc_api.ClientChannel channel) =>
    shutdownChannel(channel);
