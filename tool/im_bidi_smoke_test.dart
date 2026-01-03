// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:learn_go/features/im/data/generated/conversation.pb.dart' as pb;
import 'package:learn_go/features/im/data/generated/conversation.pbgrpc.dart'
    as grpcpb;
import 'package:web_socket_channel/web_socket_channel.dart';

class LoginInfo {
  const LoginInfo({
    required this.accessToken,
    required this.accountId,
    required this.role,
  });

  final String accessToken;
  final String accountId;
  final String role;
}

Future<void> main(List<String> args) async {
  final httpBase = args.isNotEmpty ? args[0] : 'http://localhost:8080';
  final grpcHost = args.length > 1 ? args[1] : 'localhost';
  final grpcPort = args.length > 2 ? int.parse(args[2]) : 9090;

  final schoolId = args.length > 3
      ? args[3]
      : '11111111-1111-1111-1111-111111111111';
  final identifier = args.length > 4 ? args[4] : 'stu-2025001';
  final password = args.length > 5 ? args[5] : 'Student@123';

  final teacherIdentifier = args.length > 6 ? args[6] : 'tch-1001';
  final teacherPassword = args.length > 7 ? args[7] : 'Teacher@123';

  // From scripts/postgres_sample.sql seed data.
  const teacherAccountId = 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb';

  print('HTTP base: $httpBase');
  print('gRPC: $grpcHost:$grpcPort');

  final studentLogin = await _login(
    httpBase: httpBase,
    schoolId: schoolId,
    identifier: identifier,
    password: password,
  );
  print(
    'Student login OK; id=${studentLogin.accountId} role=${studentLogin.role} tokenLen=${studentLogin.accessToken.length}',
  );

  final teacherLogin = await _login(
    httpBase: httpBase,
    schoolId: schoolId,
    identifier: teacherIdentifier,
    password: teacherPassword,
  );
  print(
    'Teacher login OK; id=${teacherLogin.accountId} role=${teacherLogin.role} tokenLen=${teacherLogin.accessToken.length}',
  );

  final conversationId = await _createConversation(
    httpBase: httpBase,
    accessToken: studentLogin.accessToken,
    participantId: teacherAccountId,
  );
  print('Conversation OK: $conversationId');

  await _testWebSocket(
    httpBase: httpBase,
    accessToken: studentLogin.accessToken,
    conversationId: conversationId,
  );

  await _testWebSocketConcurrent(
    httpBase: httpBase,
    conversationId: conversationId,
    student: studentLogin,
    teacher: teacherLogin,
  );

  await _testGrpcBidi(
    host: grpcHost,
    port: grpcPort,
    accessToken: studentLogin.accessToken,
    conversationId: conversationId,
  );

  print('DONE');
}

Future<LoginInfo> _login({
  required String httpBase,
  required String schoolId,
  required String identifier,
  required String password,
}) async {
  final uri = Uri.parse('$httpBase/api/v1/auth/login');
  final req = await HttpClient().postUrl(uri);
  req.headers.contentType = ContentType.json;
  req.add(
    utf8.encode(
      jsonEncode({
        'school_id': schoolId,
        'identifier': identifier,
        'password': password,
      }),
    ),
  );

  final resp = await req.close();
  final body = await resp.transform(utf8.decoder).join();
  if (resp.statusCode < 200 || resp.statusCode >= 300) {
    throw Exception('login failed ${resp.statusCode}: $body');
  }

  final json = jsonDecode(body) as Map<String, dynamic>;
  if (json['success'] != true) {
    throw Exception('login not successful: $body');
  }
  final data = json['data'] as Map<String, dynamic>;
  final account = data['account'] as Map<String, dynamic>;
  return LoginInfo(
    accessToken: data['access_token'] as String,
    accountId: account['id'] as String,
    role: (account['role'] as String).toString(),
  );
}

Future<String> _createConversation({
  required String httpBase,
  required String accessToken,
  required String participantId,
}) async {
  final uri = Uri.parse('$httpBase/api/v1/conversations');
  final req = await HttpClient().postUrl(uri);
  req.headers.contentType = ContentType.json;
  req.headers.set('Authorization', 'Bearer $accessToken');
  req.add(
    utf8.encode(
      jsonEncode({
        'participant_ids': [participantId],
      }),
    ),
  );

  final resp = await req.close();
  final body = await resp.transform(utf8.decoder).join();
  if (resp.statusCode < 200 || resp.statusCode >= 300) {
    throw Exception('create conversation failed ${resp.statusCode}: $body');
  }

  final json = jsonDecode(body) as Map<String, dynamic>;
  if (json['success'] != true) {
    throw Exception('create conversation not successful: $body');
  }
  final data = json['data'] as Map<String, dynamic>;
  final conv = data['conversation'] as Map<String, dynamic>;
  return conv['id'] as String;
}

Future<void> _testWebSocket({
  required String httpBase,
  required String accessToken,
  required String conversationId,
}) async {
  print('\n== WebSocket /ws/im test ==');

  final httpUri = Uri.parse(httpBase);
  final wsScheme = httpUri.scheme == 'https' ? 'wss' : 'ws';
  final wsUri = Uri(
    scheme: wsScheme,
    host: httpUri.host,
    port: httpUri.hasPort ? httpUri.port : null,
    path: '/ws/im',
    queryParameters: {'token': accessToken},
  );
  print('Connecting: $wsUri');

  final channel = WebSocketChannel.connect(wsUri);

  final completer = Completer<void>();
  String? lastMessageId;

  late final StreamSubscription wsSub;
  wsSub = channel.stream.listen(
    (event) {
      final bytes = _coerceToBytes(event);
      if (bytes == null) return;
      final resp = pb.ConversationStreamResponse.fromBuffer(bytes);

      if (resp.hasSnapshot()) {
        print(
          'WS <- snapshot (members=${resp.snapshot.summary.members.length}, messages=${resp.snapshot.messages.length})',
        );
      } else if (resp.hasMessageEvent()) {
        final msg = resp.messageEvent.message;
        lastMessageId = msg.id;
        print('WS <- messageEvent id=${msg.id} text=${msg.text}');
      } else if (resp.hasMessageAck()) {
        final msg = resp.messageAck.message;
        lastMessageId ??= msg.id;
        print('WS <- messageAck id=${msg.id} text=${msg.text}');
      } else if (resp.hasReadAck()) {
        print('WS <- readAck id=${resp.readAck.messageId}');
      } else if (resp.hasReadEvent()) {
        print('WS <- readEvent id=${resp.readEvent.messageId}');
      } else if (resp.hasError()) {
        print('WS <- ERROR ${resp.error.message}');
      } else {
        print('WS <- (unknown response)');
      }

      if (!completer.isCompleted && lastMessageId != null) {
        completer.complete();
      }
    },
    onError: (e) {
      if (!completer.isCompleted) completer.completeError(e);
    },
    onDone: () {
      if (!completer.isCompleted) {
        completer.completeError(Exception('ws closed'));
      }
    },
  );

  // 1) join
  channel.sink.add(
    Uint8List.fromList(
      (pb.ConversationStreamRequest()
            ..join = (pb.JoinConversation()..conversationId = conversationId))
          .writeToBuffer(),
    ),
  );

  // 2) create message
  final payloadText = 'smoke-test ${DateTime.now().toIso8601String()}';
  channel.sink.add(
    Uint8List.fromList(
      (pb.ConversationStreamRequest()
            ..create_3 = (pb.MessageCreate()
              ..conversationId = conversationId
              ..kind = 'text'
              ..text = payloadText))
          .writeToBuffer(),
    ),
  );

  // Wait until we see the message event.
  await completer.future.timeout(const Duration(seconds: 10));

  // 3) read (if we got message id)
  if (lastMessageId != null) {
    channel.sink.add(
      Uint8List.fromList(
        (pb.ConversationStreamRequest()
              ..read = (pb.ConversationRead()..messageId = lastMessageId!))
            .writeToBuffer(),
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  await wsSub.cancel();
  await channel.sink.close();
  print('WebSocket test OK');
}

Future<void> _testGrpcBidi({
  required String host,
  required int port,
  required String accessToken,
  required String conversationId,
}) async {
  print('\n== gRPC bidi Stream test ==');

  final channel = ClientChannel(
    host,
    port: port,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final client = grpcpb.ConversationServiceClient(
    channel,
    options: CallOptions(metadata: {'authorization': 'Bearer $accessToken'}),
  );

  final reqCtrl = StreamController<pb.ConversationStreamRequest>();
  final respStream = client.stream(reqCtrl.stream);

  final done = Completer<void>();
  String? lastMessageId;

  final sub = respStream.listen(
    (resp) {
      if (resp.hasSnapshot()) {
        print(
          'gRPC <- snapshot (members=${resp.snapshot.summary.members.length}, messages=${resp.snapshot.messages.length})',
        );
      } else if (resp.hasMessageEvent()) {
        final msg = resp.messageEvent.message;
        lastMessageId = msg.id;
        print('gRPC <- messageEvent id=${msg.id} text=${msg.text}');
      } else if (resp.hasMessageAck()) {
        final msg = resp.messageAck.message;
        lastMessageId ??= msg.id;
        print('gRPC <- messageAck id=${msg.id} text=${msg.text}');
      } else if (resp.hasReadAck()) {
        print('gRPC <- readAck id=${resp.readAck.messageId}');
      } else if (resp.hasReadEvent()) {
        print('gRPC <- readEvent id=${resp.readEvent.messageId}');
      } else if (resp.hasError()) {
        print('gRPC <- ERROR ${resp.error.message}');
      } else {
        print('gRPC <- (unknown response)');
      }

      if (!done.isCompleted && lastMessageId != null) {
        done.complete();
      }
    },
    onError: (e) {
      if (!done.isCompleted) done.completeError(e);
    },
    onDone: () {
      if (!done.isCompleted) done.completeError(Exception('grpc stream done'));
    },
  );

  // join
  reqCtrl.add(
    pb.ConversationStreamRequest()
      ..join = (pb.JoinConversation()..conversationId = conversationId),
  );

  // create
  final payloadText = 'grpc-smoke-test ${DateTime.now().toIso8601String()}';
  reqCtrl.add(
    pb.ConversationStreamRequest()
      ..create_3 = (pb.MessageCreate()
        ..conversationId = conversationId
        ..kind = 'text'
        ..text = payloadText),
  );

  await done.future.timeout(const Duration(seconds: 10));

  if (lastMessageId != null) {
    reqCtrl.add(
      pb.ConversationStreamRequest()
        ..read = (pb.ConversationRead()..messageId = lastMessageId!),
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  await reqCtrl.close();
  await sub.cancel();
  await channel.shutdown();

  print('gRPC bidi test OK');
}

class _WsClient {
  _WsClient({
    required this.name,
    required this.httpBase,
    required this.accessToken,
  }) {
    final httpUri = Uri.parse(httpBase);
    final wsScheme = httpUri.scheme == 'https' ? 'wss' : 'ws';
    final wsUri = Uri(
      scheme: wsScheme,
      host: httpUri.host,
      port: httpUri.hasPort ? httpUri.port : null,
      path: '/ws/im',
      queryParameters: {'token': accessToken},
    );
    _channel = WebSocketChannel.connect(wsUri);
    _sub = _channel.stream.listen(
      (event) {
        final bytes = _coerceToBytes(event);
        if (bytes == null) return;
        final resp = pb.ConversationStreamResponse.fromBuffer(bytes);
        _controller.add(resp);
      },
      onError: _controller.addError,
      onDone: () {
        if (!_controller.isClosed) _controller.close();
      },
    );
  }

  final String name;
  final String httpBase;
  final String accessToken;

  late final WebSocketChannel _channel;
  late final StreamSubscription _sub;
  final StreamController<pb.ConversationStreamResponse> _controller =
      StreamController.broadcast();

  Stream<pb.ConversationStreamResponse> get responses => _controller.stream;

  void send(pb.ConversationStreamRequest req) {
    _channel.sink.add(Uint8List.fromList(req.writeToBuffer()));
  }

  Future<void> close() async {
    await _sub.cancel();
    await _channel.sink.close();
    if (!_controller.isClosed) {
      await _controller.close();
    }
  }
}

Future<void> _testWebSocketConcurrent({
  required String httpBase,
  required String conversationId,
  required LoginInfo student,
  required LoginInfo teacher,
}) async {
  print('\n== WebSocket concurrent (2 clients) ==');

  final studentClient = _WsClient(
    name: 'student',
    httpBase: httpBase,
    accessToken: student.accessToken,
  );
  final teacherClient = _WsClient(
    name: 'teacher',
    httpBase: httpBase,
    accessToken: teacher.accessToken,
  );

  try {
    // Join both.
    studentClient.send(
      pb.ConversationStreamRequest()
        ..join = (pb.JoinConversation()..conversationId = conversationId),
    );
    teacherClient.send(
      pb.ConversationStreamRequest()
        ..join = (pb.JoinConversation()..conversationId = conversationId),
    );

    await studentClient.responses
        .firstWhere((e) => e.hasSnapshot())
        .timeout(const Duration(seconds: 10));
    await teacherClient.responses
        .firstWhere((e) => e.hasSnapshot())
        .timeout(const Duration(seconds: 10));

    // 1) student -> teacher
    final sText = 'concurrent-from-student ${DateTime.now().toIso8601String()}';
    studentClient.send(
      pb.ConversationStreamRequest()
        ..create_3 = (pb.MessageCreate()
          ..conversationId = conversationId
          ..kind = 'text'
          ..text = sText),
    );

    final teacherSawStudent = await teacherClient.responses
        .firstWhere(
          (e) =>
              e.hasMessageEvent() &&
              e.messageEvent.message.text == sText &&
              e.messageEvent.message.senderId == student.accountId,
        )
        .timeout(const Duration(seconds: 10));
    print(
      'OK teacher received student msg: ${teacherSawStudent.messageEvent.message.id}',
    );

    // 2) teacher -> student
    final tText = 'concurrent-from-teacher ${DateTime.now().toIso8601String()}';
    teacherClient.send(
      pb.ConversationStreamRequest()
        ..create_3 = (pb.MessageCreate()
          ..conversationId = conversationId
          ..kind = 'text'
          ..text = tText),
    );

    final studentSawTeacher = await studentClient.responses
        .firstWhere(
          (e) =>
              e.hasMessageEvent() &&
              e.messageEvent.message.text == tText &&
              e.messageEvent.message.senderId == teacher.accountId,
        )
        .timeout(const Duration(seconds: 10));
    print(
      'OK student received teacher msg: ${studentSawTeacher.messageEvent.message.id}',
    );
  } finally {
    await studentClient.close();
    await teacherClient.close();
  }

  print('WebSocket concurrent test OK');
}

Uint8List? _coerceToBytes(Object? event) {
  if (event == null) return null;
  if (event is Uint8List) return event;
  if (event is List<int>) return Uint8List.fromList(event);
  if (event is ByteBuffer) return event.asUint8List();
  return null;
}
