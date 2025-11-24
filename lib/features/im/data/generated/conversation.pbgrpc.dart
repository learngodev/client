// This is a generated file - do not edit.
//
// Generated from conversation.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'conversation.pb.dart' as $0;

export 'conversation.pb.dart';

@$pb.GrpcServiceName('learngo.api.v1.ConversationService')
class ConversationServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ConversationServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseStream<$0.ConversationStreamResponse> stream(
    $async.Stream<$0.ConversationStreamRequest> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$stream, request, options: options);
  }

  // method descriptors

  static final _$stream = $grpc.ClientMethod<$0.ConversationStreamRequest,
          $0.ConversationStreamResponse>(
      '/learngo.api.v1.ConversationService/Stream',
      ($0.ConversationStreamRequest value) => value.writeToBuffer(),
      $0.ConversationStreamResponse.fromBuffer);
}

@$pb.GrpcServiceName('learngo.api.v1.ConversationService')
abstract class ConversationServiceBase extends $grpc.Service {
  $core.String get $name => 'learngo.api.v1.ConversationService';

  ConversationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ConversationStreamRequest,
            $0.ConversationStreamResponse>(
        'Stream',
        stream,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.ConversationStreamRequest.fromBuffer(value),
        ($0.ConversationStreamResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ConversationStreamResponse> stream($grpc.ServiceCall call,
      $async.Stream<$0.ConversationStreamRequest> request);
}
