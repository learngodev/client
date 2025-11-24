// This is a generated file - do not edit.
//
// Generated from conversation.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class JoinConversation extends $pb.GeneratedMessage {
  factory JoinConversation({
    $core.String? conversationId,
  }) {
    final result = create();
    if (conversationId != null) result.conversationId = conversationId;
    return result;
  }

  JoinConversation._();

  factory JoinConversation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinConversation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinConversation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinConversation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinConversation copyWith(void Function(JoinConversation) updates) =>
      super.copyWith((message) => updates(message as JoinConversation))
          as JoinConversation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinConversation create() => JoinConversation._();
  @$core.override
  JoinConversation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinConversation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinConversation>(create);
  static JoinConversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => $_clearField(1);
}

class ConversationRead extends $pb.GeneratedMessage {
  factory ConversationRead({
    $core.String? messageId,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    return result;
  }

  ConversationRead._();

  factory ConversationRead.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationRead.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationRead',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationRead clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationRead copyWith(void Function(ConversationRead) updates) =>
      super.copyWith((message) => updates(message as ConversationRead))
          as ConversationRead;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationRead create() => ConversationRead._();
  @$core.override
  ConversationRead createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationRead getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationRead>(create);
  static ConversationRead? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);
}

class MessageCreate extends $pb.GeneratedMessage {
  factory MessageCreate({
    $core.String? conversationId,
    $core.String? kind,
    $core.String? text,
    $core.String? mediaUri,
    $core.String? metadata,
  }) {
    final result = create();
    if (conversationId != null) result.conversationId = conversationId;
    if (kind != null) result.kind = kind;
    if (text != null) result.text = text;
    if (mediaUri != null) result.mediaUri = mediaUri;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  MessageCreate._();

  factory MessageCreate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageCreate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageCreate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..aOS(2, _omitFieldNames ? '' : 'kind')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'mediaUri')
    ..aOS(5, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageCreate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageCreate copyWith(void Function(MessageCreate) updates) =>
      super.copyWith((message) => updates(message as MessageCreate))
          as MessageCreate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageCreate create() => MessageCreate._();
  @$core.override
  MessageCreate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageCreate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageCreate>(create);
  static MessageCreate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get kind => $_getSZ(1);
  @$pb.TagNumber(2)
  set kind($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKind() => $_has(1);
  @$pb.TagNumber(2)
  void clearKind() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mediaUri => $_getSZ(3);
  @$pb.TagNumber(4)
  set mediaUri($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMediaUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaUri() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get metadata => $_getSZ(4);
  @$pb.TagNumber(5)
  set metadata($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearMetadata() => $_clearField(5);
}

enum ConversationStreamRequest_Payload { join, read, create_3, notSet }

class ConversationStreamRequest extends $pb.GeneratedMessage {
  factory ConversationStreamRequest({
    JoinConversation? join,
    ConversationRead? read,
    MessageCreate? create_3,
  }) {
    final result = create();
    if (join != null) result.join = join;
    if (read != null) result.read = read;
    if (create_3 != null) result.create_3 = create_3;
    return result;
  }

  ConversationStreamRequest._();

  factory ConversationStreamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationStreamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ConversationStreamRequest_Payload>
      _ConversationStreamRequest_PayloadByTag = {
    1: ConversationStreamRequest_Payload.join,
    2: ConversationStreamRequest_Payload.read,
    3: ConversationStreamRequest_Payload.create_3,
    0: ConversationStreamRequest_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationStreamRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<JoinConversation>(1, _omitFieldNames ? '' : 'join',
        subBuilder: JoinConversation.create)
    ..aOM<ConversationRead>(2, _omitFieldNames ? '' : 'read',
        subBuilder: ConversationRead.create)
    ..aOM<MessageCreate>(3, _omitFieldNames ? '' : 'create',
        subBuilder: MessageCreate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationStreamRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationStreamRequest copyWith(
          void Function(ConversationStreamRequest) updates) =>
      super.copyWith((message) => updates(message as ConversationStreamRequest))
          as ConversationStreamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationStreamRequest create() => ConversationStreamRequest._();
  @$core.override
  ConversationStreamRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationStreamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationStreamRequest>(create);
  static ConversationStreamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ConversationStreamRequest_Payload whichPayload() =>
      _ConversationStreamRequest_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  JoinConversation get join => $_getN(0);
  @$pb.TagNumber(1)
  set join(JoinConversation value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasJoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearJoin() => $_clearField(1);
  @$pb.TagNumber(1)
  JoinConversation ensureJoin() => $_ensure(0);

  @$pb.TagNumber(2)
  ConversationRead get read => $_getN(1);
  @$pb.TagNumber(2)
  set read(ConversationRead value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRead() => $_has(1);
  @$pb.TagNumber(2)
  void clearRead() => $_clearField(2);
  @$pb.TagNumber(2)
  ConversationRead ensureRead() => $_ensure(1);

  @$pb.TagNumber(3)
  MessageCreate get create_3 => $_getN(2);
  @$pb.TagNumber(3)
  set create_3(MessageCreate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreate_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreate_3() => $_clearField(3);
  @$pb.TagNumber(3)
  MessageCreate ensureCreate_3() => $_ensure(2);
}

class ConversationSnapshot extends $pb.GeneratedMessage {
  factory ConversationSnapshot({
    ConversationSummary? summary,
    $core.Iterable<Message>? messages,
  }) {
    final result = create();
    if (summary != null) result.summary = summary;
    if (messages != null) result.messages.addAll(messages);
    return result;
  }

  ConversationSnapshot._();

  factory ConversationSnapshot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationSnapshot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationSnapshot',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOM<ConversationSummary>(1, _omitFieldNames ? '' : 'summary',
        subBuilder: ConversationSummary.create)
    ..pPM<Message>(2, _omitFieldNames ? '' : 'messages',
        subBuilder: Message.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationSnapshot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationSnapshot copyWith(void Function(ConversationSnapshot) updates) =>
      super.copyWith((message) => updates(message as ConversationSnapshot))
          as ConversationSnapshot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationSnapshot create() => ConversationSnapshot._();
  @$core.override
  ConversationSnapshot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationSnapshot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationSnapshot>(create);
  static ConversationSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  ConversationSummary get summary => $_getN(0);
  @$pb.TagNumber(1)
  set summary(ConversationSummary value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSummary() => $_has(0);
  @$pb.TagNumber(1)
  void clearSummary() => $_clearField(1);
  @$pb.TagNumber(1)
  ConversationSummary ensureSummary() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<Message> get messages => $_getList(1);
}

class ConversationSummary extends $pb.GeneratedMessage {
  factory ConversationSummary({
    Conversation? conversation,
    $core.Iterable<ConversationMember>? members,
    Message? lastMessage,
    $fixnum.Int64? unreadCount,
  }) {
    final result = create();
    if (conversation != null) result.conversation = conversation;
    if (members != null) result.members.addAll(members);
    if (lastMessage != null) result.lastMessage = lastMessage;
    if (unreadCount != null) result.unreadCount = unreadCount;
    return result;
  }

  ConversationSummary._();

  factory ConversationSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOM<Conversation>(1, _omitFieldNames ? '' : 'conversation',
        subBuilder: Conversation.create)
    ..pPM<ConversationMember>(2, _omitFieldNames ? '' : 'members',
        subBuilder: ConversationMember.create)
    ..aOM<Message>(3, _omitFieldNames ? '' : 'lastMessage',
        subBuilder: Message.create)
    ..aInt64(4, _omitFieldNames ? '' : 'unreadCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationSummary clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationSummary copyWith(void Function(ConversationSummary) updates) =>
      super.copyWith((message) => updates(message as ConversationSummary))
          as ConversationSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationSummary create() => ConversationSummary._();
  @$core.override
  ConversationSummary createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationSummary>(create);
  static ConversationSummary? _defaultInstance;

  @$pb.TagNumber(1)
  Conversation get conversation => $_getN(0);
  @$pb.TagNumber(1)
  set conversation(Conversation value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasConversation() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversation() => $_clearField(1);
  @$pb.TagNumber(1)
  Conversation ensureConversation() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<ConversationMember> get members => $_getList(1);

  @$pb.TagNumber(3)
  Message get lastMessage => $_getN(2);
  @$pb.TagNumber(3)
  set lastMessage(Message value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLastMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  Message ensureLastMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get unreadCount => $_getI64(3);
  @$pb.TagNumber(4)
  set unreadCount($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnreadCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnreadCount() => $_clearField(4);
}

class Conversation extends $pb.GeneratedMessage {
  factory Conversation({
    $core.String? id,
    $core.String? type,
    $core.String? schoolId,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (schoolId != null) result.schoolId = schoolId;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  Conversation._();

  factory Conversation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Conversation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Conversation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'schoolId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Conversation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Conversation copyWith(void Function(Conversation) updates) =>
      super.copyWith((message) => updates(message as Conversation))
          as Conversation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Conversation create() => Conversation._();
  @$core.override
  Conversation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Conversation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Conversation>(create);
  static Conversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get schoolId => $_getSZ(2);
  @$pb.TagNumber(3)
  set schoolId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSchoolId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchoolId() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureUpdatedAt() => $_ensure(4);
}

class ConversationMember extends $pb.GeneratedMessage {
  factory ConversationMember({
    $core.String? id,
    $core.String? conversationId,
    $core.String? accountId,
    $core.String? role,
    $1.Timestamp? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (conversationId != null) result.conversationId = conversationId;
    if (accountId != null) result.accountId = accountId;
    if (role != null) result.role = role;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  ConversationMember._();

  factory ConversationMember.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationMember.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationMember',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..aOS(3, _omitFieldNames ? '' : 'accountId')
    ..aOS(4, _omitFieldNames ? '' : 'role')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationMember clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationMember copyWith(void Function(ConversationMember) updates) =>
      super.copyWith((message) => updates(message as ConversationMember))
          as ConversationMember;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationMember create() => ConversationMember._();
  @$core.override
  ConversationMember createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationMember>(create);
  static ConversationMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountId => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccountId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get role => $_getSZ(3);
  @$pb.TagNumber(4)
  set role($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreatedAt() => $_ensure(4);
}

class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.String? id,
    $core.String? conversationId,
    $core.String? senderId,
    $core.String? senderRole,
    $core.String? kind,
    $core.String? text,
    $core.String? mediaUri,
    $core.String? metadata,
    $1.Timestamp? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (conversationId != null) result.conversationId = conversationId;
    if (senderId != null) result.senderId = senderId;
    if (senderRole != null) result.senderRole = senderRole;
    if (kind != null) result.kind = kind;
    if (text != null) result.text = text;
    if (mediaUri != null) result.mediaUri = mediaUri;
    if (metadata != null) result.metadata = metadata;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  Message._();

  factory Message.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..aOS(3, _omitFieldNames ? '' : 'senderId')
    ..aOS(4, _omitFieldNames ? '' : 'senderRole')
    ..aOS(5, _omitFieldNames ? '' : 'kind')
    ..aOS(6, _omitFieldNames ? '' : 'text')
    ..aOS(7, _omitFieldNames ? '' : 'mediaUri')
    ..aOS(8, _omitFieldNames ? '' : 'metadata')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message copyWith(void Function(Message) updates) =>
      super.copyWith((message) => updates(message as Message)) as Message;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  @$core.override
  Message createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderId => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderRole => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderRole($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderRole() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get kind => $_getSZ(4);
  @$pb.TagNumber(5)
  set kind($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearKind() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get text => $_getSZ(5);
  @$pb.TagNumber(6)
  set text($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasText() => $_has(5);
  @$pb.TagNumber(6)
  void clearText() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get mediaUri => $_getSZ(6);
  @$pb.TagNumber(7)
  set mediaUri($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMediaUri() => $_has(6);
  @$pb.TagNumber(7)
  void clearMediaUri() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get metadata => $_getSZ(7);
  @$pb.TagNumber(8)
  set metadata($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearMetadata() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCreatedAt() => $_ensure(8);
}

class ConversationReadEvent extends $pb.GeneratedMessage {
  factory ConversationReadEvent({
    $core.String? messageId,
    $core.String? readerId,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    if (readerId != null) result.readerId = readerId;
    return result;
  }

  ConversationReadEvent._();

  factory ConversationReadEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationReadEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationReadEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'readerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationReadEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationReadEvent copyWith(
          void Function(ConversationReadEvent) updates) =>
      super.copyWith((message) => updates(message as ConversationReadEvent))
          as ConversationReadEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationReadEvent create() => ConversationReadEvent._();
  @$core.override
  ConversationReadEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationReadEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationReadEvent>(create);
  static ConversationReadEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get readerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set readerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReaderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReaderId() => $_clearField(2);
}

class MessageCreatedEvent extends $pb.GeneratedMessage {
  factory MessageCreatedEvent({
    Message? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  MessageCreatedEvent._();

  factory MessageCreatedEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageCreatedEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageCreatedEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOM<Message>(1, _omitFieldNames ? '' : 'message',
        subBuilder: Message.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageCreatedEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageCreatedEvent copyWith(void Function(MessageCreatedEvent) updates) =>
      super.copyWith((message) => updates(message as MessageCreatedEvent))
          as MessageCreatedEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageCreatedEvent create() => MessageCreatedEvent._();
  @$core.override
  MessageCreatedEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageCreatedEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageCreatedEvent>(create);
  static MessageCreatedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);
}

class ConversationReadAck extends $pb.GeneratedMessage {
  factory ConversationReadAck({
    $core.String? messageId,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    return result;
  }

  ConversationReadAck._();

  factory ConversationReadAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationReadAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationReadAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationReadAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationReadAck copyWith(void Function(ConversationReadAck) updates) =>
      super.copyWith((message) => updates(message as ConversationReadAck))
          as ConversationReadAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationReadAck create() => ConversationReadAck._();
  @$core.override
  ConversationReadAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationReadAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationReadAck>(create);
  static ConversationReadAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);
}

class MessageCreateAck extends $pb.GeneratedMessage {
  factory MessageCreateAck({
    Message? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  MessageCreateAck._();

  factory MessageCreateAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageCreateAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageCreateAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOM<Message>(1, _omitFieldNames ? '' : 'message',
        subBuilder: Message.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageCreateAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageCreateAck copyWith(void Function(MessageCreateAck) updates) =>
      super.copyWith((message) => updates(message as MessageCreateAck))
          as MessageCreateAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageCreateAck create() => MessageCreateAck._();
  @$core.override
  MessageCreateAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageCreateAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageCreateAck>(create);
  static MessageCreateAck? _defaultInstance;

  @$pb.TagNumber(1)
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);
}

class Error extends $pb.GeneratedMessage {
  factory Error({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  Error._();

  factory Error.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Error.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Error',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Error clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Error copyWith(void Function(Error) updates) =>
      super.copyWith((message) => updates(message as Error)) as Error;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  @$core.override
  Error createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

enum ConversationStreamResponse_Payload {
  snapshot,
  readEvent,
  messageEvent,
  readAck,
  messageAck,
  error,
  notSet
}

class ConversationStreamResponse extends $pb.GeneratedMessage {
  factory ConversationStreamResponse({
    ConversationSnapshot? snapshot,
    ConversationReadEvent? readEvent,
    MessageCreatedEvent? messageEvent,
    ConversationReadAck? readAck,
    MessageCreateAck? messageAck,
    Error? error,
  }) {
    final result = create();
    if (snapshot != null) result.snapshot = snapshot;
    if (readEvent != null) result.readEvent = readEvent;
    if (messageEvent != null) result.messageEvent = messageEvent;
    if (readAck != null) result.readAck = readAck;
    if (messageAck != null) result.messageAck = messageAck;
    if (error != null) result.error = error;
    return result;
  }

  ConversationStreamResponse._();

  factory ConversationStreamResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConversationStreamResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ConversationStreamResponse_Payload>
      _ConversationStreamResponse_PayloadByTag = {
    1: ConversationStreamResponse_Payload.snapshot,
    2: ConversationStreamResponse_Payload.readEvent,
    3: ConversationStreamResponse_Payload.messageEvent,
    4: ConversationStreamResponse_Payload.readAck,
    5: ConversationStreamResponse_Payload.messageAck,
    6: ConversationStreamResponse_Payload.error,
    0: ConversationStreamResponse_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConversationStreamResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'learngo.api.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<ConversationSnapshot>(1, _omitFieldNames ? '' : 'snapshot',
        subBuilder: ConversationSnapshot.create)
    ..aOM<ConversationReadEvent>(2, _omitFieldNames ? '' : 'readEvent',
        subBuilder: ConversationReadEvent.create)
    ..aOM<MessageCreatedEvent>(3, _omitFieldNames ? '' : 'messageEvent',
        subBuilder: MessageCreatedEvent.create)
    ..aOM<ConversationReadAck>(4, _omitFieldNames ? '' : 'readAck',
        subBuilder: ConversationReadAck.create)
    ..aOM<MessageCreateAck>(5, _omitFieldNames ? '' : 'messageAck',
        subBuilder: MessageCreateAck.create)
    ..aOM<Error>(6, _omitFieldNames ? '' : 'error', subBuilder: Error.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationStreamResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationStreamResponse copyWith(
          void Function(ConversationStreamResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ConversationStreamResponse))
          as ConversationStreamResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationStreamResponse create() => ConversationStreamResponse._();
  @$core.override
  ConversationStreamResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConversationStreamResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConversationStreamResponse>(create);
  static ConversationStreamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  ConversationStreamResponse_Payload whichPayload() =>
      _ConversationStreamResponse_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ConversationSnapshot get snapshot => $_getN(0);
  @$pb.TagNumber(1)
  set snapshot(ConversationSnapshot value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSnapshot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSnapshot() => $_clearField(1);
  @$pb.TagNumber(1)
  ConversationSnapshot ensureSnapshot() => $_ensure(0);

  @$pb.TagNumber(2)
  ConversationReadEvent get readEvent => $_getN(1);
  @$pb.TagNumber(2)
  set readEvent(ConversationReadEvent value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReadEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearReadEvent() => $_clearField(2);
  @$pb.TagNumber(2)
  ConversationReadEvent ensureReadEvent() => $_ensure(1);

  @$pb.TagNumber(3)
  MessageCreatedEvent get messageEvent => $_getN(2);
  @$pb.TagNumber(3)
  set messageEvent(MessageCreatedEvent value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMessageEvent() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageEvent() => $_clearField(3);
  @$pb.TagNumber(3)
  MessageCreatedEvent ensureMessageEvent() => $_ensure(2);

  @$pb.TagNumber(4)
  ConversationReadAck get readAck => $_getN(3);
  @$pb.TagNumber(4)
  set readAck(ConversationReadAck value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasReadAck() => $_has(3);
  @$pb.TagNumber(4)
  void clearReadAck() => $_clearField(4);
  @$pb.TagNumber(4)
  ConversationReadAck ensureReadAck() => $_ensure(3);

  @$pb.TagNumber(5)
  MessageCreateAck get messageAck => $_getN(4);
  @$pb.TagNumber(5)
  set messageAck(MessageCreateAck value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMessageAck() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageAck() => $_clearField(5);
  @$pb.TagNumber(5)
  MessageCreateAck ensureMessageAck() => $_ensure(4);

  @$pb.TagNumber(6)
  Error get error => $_getN(5);
  @$pb.TagNumber(6)
  set error(Error value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);
  @$pb.TagNumber(6)
  Error ensureError() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
