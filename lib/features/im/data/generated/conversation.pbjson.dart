// This is a generated file - do not edit.
//
// Generated from conversation.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use joinConversationDescriptor instead')
const JoinConversation$json = {
  '1': 'JoinConversation',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
  ],
};

/// Descriptor for `JoinConversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinConversationDescriptor = $convert.base64Decode(
    'ChBKb2luQ29udmVyc2F0aW9uEicKD2NvbnZlcnNhdGlvbl9pZBgBIAEoCVIOY29udmVyc2F0aW'
    '9uSWQ=');

@$core.Deprecated('Use conversationReadDescriptor instead')
const ConversationRead$json = {
  '1': 'ConversationRead',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
  ],
};

/// Descriptor for `ConversationRead`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationReadDescriptor = $convert.base64Decode(
    'ChBDb252ZXJzYXRpb25SZWFkEh0KCm1lc3NhZ2VfaWQYASABKAlSCW1lc3NhZ2VJZA==');

@$core.Deprecated('Use messageCreateDescriptor instead')
const MessageCreate$json = {
  '1': 'MessageCreate',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'kind', '3': 2, '4': 1, '5': 9, '10': 'kind'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    {'1': 'media_uri', '3': 4, '4': 1, '5': 9, '10': 'mediaUri'},
    {'1': 'metadata', '3': 5, '4': 1, '5': 9, '10': 'metadata'},
  ],
};

/// Descriptor for `MessageCreate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageCreateDescriptor = $convert.base64Decode(
    'Cg1NZXNzYWdlQ3JlYXRlEicKD2NvbnZlcnNhdGlvbl9pZBgBIAEoCVIOY29udmVyc2F0aW9uSW'
    'QSEgoEa2luZBgCIAEoCVIEa2luZBISCgR0ZXh0GAMgASgJUgR0ZXh0EhsKCW1lZGlhX3VyaRgE'
    'IAEoCVIIbWVkaWFVcmkSGgoIbWV0YWRhdGEYBSABKAlSCG1ldGFkYXRh');

@$core.Deprecated('Use conversationStreamRequestDescriptor instead')
const ConversationStreamRequest$json = {
  '1': 'ConversationStreamRequest',
  '2': [
    {
      '1': 'join',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.JoinConversation',
      '9': 0,
      '10': 'join'
    },
    {
      '1': 'read',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.ConversationRead',
      '9': 0,
      '10': 'read'
    },
    {
      '1': 'create',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.MessageCreate',
      '9': 0,
      '10': 'create'
    },
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `ConversationStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationStreamRequestDescriptor = $convert.base64Decode(
    'ChlDb252ZXJzYXRpb25TdHJlYW1SZXF1ZXN0EjYKBGpvaW4YASABKAsyIC5sZWFybmdvLmFwaS'
    '52MS5Kb2luQ29udmVyc2F0aW9uSABSBGpvaW4SNgoEcmVhZBgCIAEoCzIgLmxlYXJuZ28uYXBp'
    'LnYxLkNvbnZlcnNhdGlvblJlYWRIAFIEcmVhZBI3CgZjcmVhdGUYAyABKAsyHS5sZWFybmdvLm'
    'FwaS52MS5NZXNzYWdlQ3JlYXRlSABSBmNyZWF0ZUIJCgdwYXlsb2Fk');

@$core.Deprecated('Use conversationSnapshotDescriptor instead')
const ConversationSnapshot$json = {
  '1': 'ConversationSnapshot',
  '2': [
    {
      '1': 'summary',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.ConversationSummary',
      '10': 'summary'
    },
    {
      '1': 'messages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.learngo.api.v1.Message',
      '10': 'messages'
    },
  ],
};

/// Descriptor for `ConversationSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationSnapshotDescriptor = $convert.base64Decode(
    'ChRDb252ZXJzYXRpb25TbmFwc2hvdBI9CgdzdW1tYXJ5GAEgASgLMiMubGVhcm5nby5hcGkudj'
    'EuQ29udmVyc2F0aW9uU3VtbWFyeVIHc3VtbWFyeRIzCghtZXNzYWdlcxgCIAMoCzIXLmxlYXJu'
    'Z28uYXBpLnYxLk1lc3NhZ2VSCG1lc3NhZ2Vz');

@$core.Deprecated('Use conversationSummaryDescriptor instead')
const ConversationSummary$json = {
  '1': 'ConversationSummary',
  '2': [
    {
      '1': 'conversation',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.Conversation',
      '10': 'conversation'
    },
    {
      '1': 'members',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.learngo.api.v1.ConversationMember',
      '10': 'members'
    },
    {
      '1': 'last_message',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.Message',
      '10': 'lastMessage'
    },
    {'1': 'unread_count', '3': 4, '4': 1, '5': 3, '10': 'unreadCount'},
  ],
};

/// Descriptor for `ConversationSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationSummaryDescriptor = $convert.base64Decode(
    'ChNDb252ZXJzYXRpb25TdW1tYXJ5EkAKDGNvbnZlcnNhdGlvbhgBIAEoCzIcLmxlYXJuZ28uYX'
    'BpLnYxLkNvbnZlcnNhdGlvblIMY29udmVyc2F0aW9uEjwKB21lbWJlcnMYAiADKAsyIi5sZWFy'
    'bmdvLmFwaS52MS5Db252ZXJzYXRpb25NZW1iZXJSB21lbWJlcnMSOgoMbGFzdF9tZXNzYWdlGA'
    'MgASgLMhcubGVhcm5nby5hcGkudjEuTWVzc2FnZVILbGFzdE1lc3NhZ2USIQoMdW5yZWFkX2Nv'
    'dW50GAQgASgDUgt1bnJlYWRDb3VudA==');

@$core.Deprecated('Use conversationDescriptor instead')
const Conversation$json = {
  '1': 'Conversation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'school_id', '3': 3, '4': 1, '5': 9, '10': 'schoolId'},
    {
      '1': 'created_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `Conversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationDescriptor = $convert.base64Decode(
    'CgxDb252ZXJzYXRpb24SDgoCaWQYASABKAlSAmlkEhIKBHR5cGUYAiABKAlSBHR5cGUSGwoJc2'
    'Nob29sX2lkGAMgASgJUghzY2hvb2xJZBI5CgpjcmVhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYBSABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use conversationMemberDescriptor instead')
const ConversationMember$json = {
  '1': 'ConversationMember',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'account_id', '3': 3, '4': 1, '5': 9, '10': 'accountId'},
    {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
    {
      '1': 'created_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `ConversationMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationMemberDescriptor = $convert.base64Decode(
    'ChJDb252ZXJzYXRpb25NZW1iZXISDgoCaWQYASABKAlSAmlkEicKD2NvbnZlcnNhdGlvbl9pZB'
    'gCIAEoCVIOY29udmVyc2F0aW9uSWQSHQoKYWNjb3VudF9pZBgDIAEoCVIJYWNjb3VudElkEhIK'
    'BHJvbGUYBCABKAlSBHJvbGUSOQoKY3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'sender_id', '3': 3, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'sender_role', '3': 4, '4': 1, '5': 9, '10': 'senderRole'},
    {'1': 'kind', '3': 5, '4': 1, '5': 9, '10': 'kind'},
    {'1': 'text', '3': 6, '4': 1, '5': 9, '10': 'text'},
    {'1': 'media_uri', '3': 7, '4': 1, '5': 9, '10': 'mediaUri'},
    {'1': 'metadata', '3': 8, '4': 1, '5': 9, '10': 'metadata'},
    {
      '1': 'created_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBInCg9jb252ZXJzYXRpb25faWQYAiABKAlSDmNvbn'
    'ZlcnNhdGlvbklkEhsKCXNlbmRlcl9pZBgDIAEoCVIIc2VuZGVySWQSHwoLc2VuZGVyX3JvbGUY'
    'BCABKAlSCnNlbmRlclJvbGUSEgoEa2luZBgFIAEoCVIEa2luZBISCgR0ZXh0GAYgASgJUgR0ZX'
    'h0EhsKCW1lZGlhX3VyaRgHIAEoCVIIbWVkaWFVcmkSGgoIbWV0YWRhdGEYCCABKAlSCG1ldGFk'
    'YXRhEjkKCmNyZWF0ZWRfYXQYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcm'
    'VhdGVkQXQ=');

@$core.Deprecated('Use conversationReadEventDescriptor instead')
const ConversationReadEvent$json = {
  '1': 'ConversationReadEvent',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'reader_id', '3': 2, '4': 1, '5': 9, '10': 'readerId'},
  ],
};

/// Descriptor for `ConversationReadEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationReadEventDescriptor = $convert.base64Decode(
    'ChVDb252ZXJzYXRpb25SZWFkRXZlbnQSHQoKbWVzc2FnZV9pZBgBIAEoCVIJbWVzc2FnZUlkEh'
    'sKCXJlYWRlcl9pZBgCIAEoCVIIcmVhZGVySWQ=');

@$core.Deprecated('Use messageCreatedEventDescriptor instead')
const MessageCreatedEvent$json = {
  '1': 'MessageCreatedEvent',
  '2': [
    {
      '1': 'message',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.Message',
      '10': 'message'
    },
  ],
};

/// Descriptor for `MessageCreatedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageCreatedEventDescriptor = $convert.base64Decode(
    'ChNNZXNzYWdlQ3JlYXRlZEV2ZW50EjEKB21lc3NhZ2UYASABKAsyFy5sZWFybmdvLmFwaS52MS'
    '5NZXNzYWdlUgdtZXNzYWdl');

@$core.Deprecated('Use conversationReadAckDescriptor instead')
const ConversationReadAck$json = {
  '1': 'ConversationReadAck',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
  ],
};

/// Descriptor for `ConversationReadAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationReadAckDescriptor = $convert.base64Decode(
    'ChNDb252ZXJzYXRpb25SZWFkQWNrEh0KCm1lc3NhZ2VfaWQYASABKAlSCW1lc3NhZ2VJZA==');

@$core.Deprecated('Use messageCreateAckDescriptor instead')
const MessageCreateAck$json = {
  '1': 'MessageCreateAck',
  '2': [
    {
      '1': 'message',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.Message',
      '10': 'message'
    },
  ],
};

/// Descriptor for `MessageCreateAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageCreateAckDescriptor = $convert.base64Decode(
    'ChBNZXNzYWdlQ3JlYXRlQWNrEjEKB21lc3NhZ2UYASABKAsyFy5sZWFybmdvLmFwaS52MS5NZX'
    'NzYWdlUgdtZXNzYWdl');

@$core.Deprecated('Use errorDescriptor instead')
const Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor =
    $convert.base64Decode('CgVFcnJvchIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use conversationStreamResponseDescriptor instead')
const ConversationStreamResponse$json = {
  '1': 'ConversationStreamResponse',
  '2': [
    {
      '1': 'snapshot',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.ConversationSnapshot',
      '9': 0,
      '10': 'snapshot'
    },
    {
      '1': 'read_event',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.ConversationReadEvent',
      '9': 0,
      '10': 'readEvent'
    },
    {
      '1': 'message_event',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.MessageCreatedEvent',
      '9': 0,
      '10': 'messageEvent'
    },
    {
      '1': 'read_ack',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.ConversationReadAck',
      '9': 0,
      '10': 'readAck'
    },
    {
      '1': 'message_ack',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.MessageCreateAck',
      '9': 0,
      '10': 'messageAck'
    },
    {
      '1': 'error',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.learngo.api.v1.Error',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `ConversationStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationStreamResponseDescriptor = $convert.base64Decode(
    'ChpDb252ZXJzYXRpb25TdHJlYW1SZXNwb25zZRJCCghzbmFwc2hvdBgBIAEoCzIkLmxlYXJuZ2'
    '8uYXBpLnYxLkNvbnZlcnNhdGlvblNuYXBzaG90SABSCHNuYXBzaG90EkYKCnJlYWRfZXZlbnQY'
    'AiABKAsyJS5sZWFybmdvLmFwaS52MS5Db252ZXJzYXRpb25SZWFkRXZlbnRIAFIJcmVhZEV2ZW'
    '50EkoKDW1lc3NhZ2VfZXZlbnQYAyABKAsyIy5sZWFybmdvLmFwaS52MS5NZXNzYWdlQ3JlYXRl'
    'ZEV2ZW50SABSDG1lc3NhZ2VFdmVudBJACghyZWFkX2FjaxgEIAEoCzIjLmxlYXJuZ28uYXBpLn'
    'YxLkNvbnZlcnNhdGlvblJlYWRBY2tIAFIHcmVhZEFjaxJDCgttZXNzYWdlX2FjaxgFIAEoCzIg'
    'LmxlYXJuZ28uYXBpLnYxLk1lc3NhZ2VDcmVhdGVBY2tIAFIKbWVzc2FnZUFjaxItCgVlcnJvch'
    'gGIAEoCzIVLmxlYXJuZ28uYXBpLnYxLkVycm9ySABSBWVycm9yQgkKB3BheWxvYWQ=');
