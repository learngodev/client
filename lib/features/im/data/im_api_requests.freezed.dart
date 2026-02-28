// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'im_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetConversationsResult {

 List<Conversation> get conversations;
/// Create a copy of GetConversationsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetConversationsResultCopyWith<GetConversationsResult> get copyWith => _$GetConversationsResultCopyWithImpl<GetConversationsResult>(this as GetConversationsResult, _$identity);

  /// Serializes this GetConversationsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetConversationsResult&&const DeepCollectionEquality().equals(other.conversations, conversations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(conversations));

@override
String toString() {
  return 'GetConversationsResult(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class $GetConversationsResultCopyWith<$Res>  {
  factory $GetConversationsResultCopyWith(GetConversationsResult value, $Res Function(GetConversationsResult) _then) = _$GetConversationsResultCopyWithImpl;
@useResult
$Res call({
 List<Conversation> conversations
});




}
/// @nodoc
class _$GetConversationsResultCopyWithImpl<$Res>
    implements $GetConversationsResultCopyWith<$Res> {
  _$GetConversationsResultCopyWithImpl(this._self, this._then);

  final GetConversationsResult _self;
  final $Res Function(GetConversationsResult) _then;

/// Create a copy of GetConversationsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversations = null,}) {
  return _then(_self.copyWith(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetConversationsResult].
extension GetConversationsResultPatterns on GetConversationsResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetConversationsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetConversationsResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetConversationsResult value)  $default,){
final _that = this;
switch (_that) {
case _GetConversationsResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetConversationsResult value)?  $default,){
final _that = this;
switch (_that) {
case _GetConversationsResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Conversation> conversations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetConversationsResult() when $default != null:
return $default(_that.conversations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Conversation> conversations)  $default,) {final _that = this;
switch (_that) {
case _GetConversationsResult():
return $default(_that.conversations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Conversation> conversations)?  $default,) {final _that = this;
switch (_that) {
case _GetConversationsResult() when $default != null:
return $default(_that.conversations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetConversationsResult implements GetConversationsResult {
  const _GetConversationsResult({final  List<Conversation> conversations = const <Conversation>[]}): _conversations = conversations;
  factory _GetConversationsResult.fromJson(Map<String, dynamic> json) => _$GetConversationsResultFromJson(json);

 final  List<Conversation> _conversations;
@override@JsonKey() List<Conversation> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of GetConversationsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConversationsResultCopyWith<_GetConversationsResult> get copyWith => __$GetConversationsResultCopyWithImpl<_GetConversationsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetConversationsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConversationsResult&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'GetConversationsResult(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$GetConversationsResultCopyWith<$Res> implements $GetConversationsResultCopyWith<$Res> {
  factory _$GetConversationsResultCopyWith(_GetConversationsResult value, $Res Function(_GetConversationsResult) _then) = __$GetConversationsResultCopyWithImpl;
@override @useResult
$Res call({
 List<Conversation> conversations
});




}
/// @nodoc
class __$GetConversationsResultCopyWithImpl<$Res>
    implements _$GetConversationsResultCopyWith<$Res> {
  __$GetConversationsResultCopyWithImpl(this._self, this._then);

  final _GetConversationsResult _self;
  final $Res Function(_GetConversationsResult) _then;

/// Create a copy of GetConversationsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(_GetConversationsResult(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Conversation>,
  ));
}


}


/// @nodoc
mixin _$GetConversationMessagesPayload {

 int get page; int get pageSize;
/// Create a copy of GetConversationMessagesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetConversationMessagesPayloadCopyWith<GetConversationMessagesPayload> get copyWith => _$GetConversationMessagesPayloadCopyWithImpl<GetConversationMessagesPayload>(this as GetConversationMessagesPayload, _$identity);

  /// Serializes this GetConversationMessagesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetConversationMessagesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize);

@override
String toString() {
  return 'GetConversationMessagesPayload(page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $GetConversationMessagesPayloadCopyWith<$Res>  {
  factory $GetConversationMessagesPayloadCopyWith(GetConversationMessagesPayload value, $Res Function(GetConversationMessagesPayload) _then) = _$GetConversationMessagesPayloadCopyWithImpl;
@useResult
$Res call({
 int page, int pageSize
});




}
/// @nodoc
class _$GetConversationMessagesPayloadCopyWithImpl<$Res>
    implements $GetConversationMessagesPayloadCopyWith<$Res> {
  _$GetConversationMessagesPayloadCopyWithImpl(this._self, this._then);

  final GetConversationMessagesPayload _self;
  final $Res Function(GetConversationMessagesPayload) _then;

/// Create a copy of GetConversationMessagesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetConversationMessagesPayload].
extension GetConversationMessagesPayloadPatterns on GetConversationMessagesPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetConversationMessagesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetConversationMessagesPayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetConversationMessagesPayload value)  $default,){
final _that = this;
switch (_that) {
case _GetConversationMessagesPayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetConversationMessagesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _GetConversationMessagesPayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetConversationMessagesPayload() when $default != null:
return $default(_that.page,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _GetConversationMessagesPayload():
return $default(_that.page,_that.pageSize);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _GetConversationMessagesPayload() when $default != null:
return $default(_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetConversationMessagesPayload implements GetConversationMessagesPayload {
  const _GetConversationMessagesPayload({this.page = 1, this.pageSize = 20});
  factory _GetConversationMessagesPayload.fromJson(Map<String, dynamic> json) => _$GetConversationMessagesPayloadFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;

/// Create a copy of GetConversationMessagesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConversationMessagesPayloadCopyWith<_GetConversationMessagesPayload> get copyWith => __$GetConversationMessagesPayloadCopyWithImpl<_GetConversationMessagesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetConversationMessagesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConversationMessagesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize);

@override
String toString() {
  return 'GetConversationMessagesPayload(page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$GetConversationMessagesPayloadCopyWith<$Res> implements $GetConversationMessagesPayloadCopyWith<$Res> {
  factory _$GetConversationMessagesPayloadCopyWith(_GetConversationMessagesPayload value, $Res Function(_GetConversationMessagesPayload) _then) = __$GetConversationMessagesPayloadCopyWithImpl;
@override @useResult
$Res call({
 int page, int pageSize
});




}
/// @nodoc
class __$GetConversationMessagesPayloadCopyWithImpl<$Res>
    implements _$GetConversationMessagesPayloadCopyWith<$Res> {
  __$GetConversationMessagesPayloadCopyWithImpl(this._self, this._then);

  final _GetConversationMessagesPayload _self;
  final $Res Function(_GetConversationMessagesPayload) _then;

/// Create a copy of GetConversationMessagesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,}) {
  return _then(_GetConversationMessagesPayload(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GetConversationMessagesResult {

 List<Message> get messages;
/// Create a copy of GetConversationMessagesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetConversationMessagesResultCopyWith<GetConversationMessagesResult> get copyWith => _$GetConversationMessagesResultCopyWithImpl<GetConversationMessagesResult>(this as GetConversationMessagesResult, _$identity);

  /// Serializes this GetConversationMessagesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetConversationMessagesResult&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'GetConversationMessagesResult(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $GetConversationMessagesResultCopyWith<$Res>  {
  factory $GetConversationMessagesResultCopyWith(GetConversationMessagesResult value, $Res Function(GetConversationMessagesResult) _then) = _$GetConversationMessagesResultCopyWithImpl;
@useResult
$Res call({
 List<Message> messages
});




}
/// @nodoc
class _$GetConversationMessagesResultCopyWithImpl<$Res>
    implements $GetConversationMessagesResultCopyWith<$Res> {
  _$GetConversationMessagesResultCopyWithImpl(this._self, this._then);

  final GetConversationMessagesResult _self;
  final $Res Function(GetConversationMessagesResult) _then;

/// Create a copy of GetConversationMessagesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetConversationMessagesResult].
extension GetConversationMessagesResultPatterns on GetConversationMessagesResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetConversationMessagesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetConversationMessagesResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetConversationMessagesResult value)  $default,){
final _that = this;
switch (_that) {
case _GetConversationMessagesResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetConversationMessagesResult value)?  $default,){
final _that = this;
switch (_that) {
case _GetConversationMessagesResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Message> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetConversationMessagesResult() when $default != null:
return $default(_that.messages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Message> messages)  $default,) {final _that = this;
switch (_that) {
case _GetConversationMessagesResult():
return $default(_that.messages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Message> messages)?  $default,) {final _that = this;
switch (_that) {
case _GetConversationMessagesResult() when $default != null:
return $default(_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetConversationMessagesResult implements GetConversationMessagesResult {
  const _GetConversationMessagesResult({final  List<Message> messages = const <Message>[]}): _messages = messages;
  factory _GetConversationMessagesResult.fromJson(Map<String, dynamic> json) => _$GetConversationMessagesResultFromJson(json);

 final  List<Message> _messages;
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of GetConversationMessagesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConversationMessagesResultCopyWith<_GetConversationMessagesResult> get copyWith => __$GetConversationMessagesResultCopyWithImpl<_GetConversationMessagesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetConversationMessagesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConversationMessagesResult&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'GetConversationMessagesResult(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$GetConversationMessagesResultCopyWith<$Res> implements $GetConversationMessagesResultCopyWith<$Res> {
  factory _$GetConversationMessagesResultCopyWith(_GetConversationMessagesResult value, $Res Function(_GetConversationMessagesResult) _then) = __$GetConversationMessagesResultCopyWithImpl;
@override @useResult
$Res call({
 List<Message> messages
});




}
/// @nodoc
class __$GetConversationMessagesResultCopyWithImpl<$Res>
    implements _$GetConversationMessagesResultCopyWith<$Res> {
  __$GetConversationMessagesResultCopyWithImpl(this._self, this._then);

  final _GetConversationMessagesResult _self;
  final $Res Function(_GetConversationMessagesResult) _then;

/// Create a copy of GetConversationMessagesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_GetConversationMessagesResult(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}


}


/// @nodoc
mixin _$SendMessagePayload {

 String get kind; String get text; String? get mediaUri; String get metadata;
/// Create a copy of SendMessagePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessagePayloadCopyWith<SendMessagePayload> get copyWith => _$SendMessagePayloadCopyWithImpl<SendMessagePayload>(this as SendMessagePayload, _$identity);

  /// Serializes this SendMessagePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessagePayload&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.text, text) || other.text == text)&&(identical(other.mediaUri, mediaUri) || other.mediaUri == mediaUri)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,text,mediaUri,metadata);

@override
String toString() {
  return 'SendMessagePayload(kind: $kind, text: $text, mediaUri: $mediaUri, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $SendMessagePayloadCopyWith<$Res>  {
  factory $SendMessagePayloadCopyWith(SendMessagePayload value, $Res Function(SendMessagePayload) _then) = _$SendMessagePayloadCopyWithImpl;
@useResult
$Res call({
 String kind, String text, String? mediaUri, String metadata
});




}
/// @nodoc
class _$SendMessagePayloadCopyWithImpl<$Res>
    implements $SendMessagePayloadCopyWith<$Res> {
  _$SendMessagePayloadCopyWithImpl(this._self, this._then);

  final SendMessagePayload _self;
  final $Res Function(SendMessagePayload) _then;

/// Create a copy of SendMessagePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? text = null,Object? mediaUri = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,mediaUri: freezed == mediaUri ? _self.mediaUri : mediaUri // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMessagePayload].
extension SendMessagePayloadPatterns on SendMessagePayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessagePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessagePayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessagePayload value)  $default,){
final _that = this;
switch (_that) {
case _SendMessagePayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessagePayload value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessagePayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String text,  String? mediaUri,  String metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessagePayload() when $default != null:
return $default(_that.kind,_that.text,_that.mediaUri,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String text,  String? mediaUri,  String metadata)  $default,) {final _that = this;
switch (_that) {
case _SendMessagePayload():
return $default(_that.kind,_that.text,_that.mediaUri,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String text,  String? mediaUri,  String metadata)?  $default,) {final _that = this;
switch (_that) {
case _SendMessagePayload() when $default != null:
return $default(_that.kind,_that.text,_that.mediaUri,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessagePayload implements SendMessagePayload {
  const _SendMessagePayload({required this.kind, required this.text, this.mediaUri, this.metadata = ''});
  factory _SendMessagePayload.fromJson(Map<String, dynamic> json) => _$SendMessagePayloadFromJson(json);

@override final  String kind;
@override final  String text;
@override final  String? mediaUri;
@override@JsonKey() final  String metadata;

/// Create a copy of SendMessagePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessagePayloadCopyWith<_SendMessagePayload> get copyWith => __$SendMessagePayloadCopyWithImpl<_SendMessagePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessagePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessagePayload&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.text, text) || other.text == text)&&(identical(other.mediaUri, mediaUri) || other.mediaUri == mediaUri)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,text,mediaUri,metadata);

@override
String toString() {
  return 'SendMessagePayload(kind: $kind, text: $text, mediaUri: $mediaUri, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SendMessagePayloadCopyWith<$Res> implements $SendMessagePayloadCopyWith<$Res> {
  factory _$SendMessagePayloadCopyWith(_SendMessagePayload value, $Res Function(_SendMessagePayload) _then) = __$SendMessagePayloadCopyWithImpl;
@override @useResult
$Res call({
 String kind, String text, String? mediaUri, String metadata
});




}
/// @nodoc
class __$SendMessagePayloadCopyWithImpl<$Res>
    implements _$SendMessagePayloadCopyWith<$Res> {
  __$SendMessagePayloadCopyWithImpl(this._self, this._then);

  final _SendMessagePayload _self;
  final $Res Function(_SendMessagePayload) _then;

/// Create a copy of SendMessagePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? text = null,Object? mediaUri = freezed,Object? metadata = null,}) {
  return _then(_SendMessagePayload(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,mediaUri: freezed == mediaUri ? _self.mediaUri : mediaUri // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SendMessageResult {

 Message get message;
/// Create a copy of SendMessageResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageResultCopyWith<SendMessageResult> get copyWith => _$SendMessageResultCopyWithImpl<SendMessageResult>(this as SendMessageResult, _$identity);

  /// Serializes this SendMessageResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageResult&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendMessageResult(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMessageResultCopyWith<$Res>  {
  factory $SendMessageResultCopyWith(SendMessageResult value, $Res Function(SendMessageResult) _then) = _$SendMessageResultCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$SendMessageResultCopyWithImpl<$Res>
    implements $SendMessageResultCopyWith<$Res> {
  _$SendMessageResultCopyWithImpl(this._self, this._then);

  final SendMessageResult _self;
  final $Res Function(SendMessageResult) _then;

/// Create a copy of SendMessageResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}
/// Create a copy of SendMessageResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendMessageResult].
extension SendMessageResultPatterns on SendMessageResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageResult value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageResult value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Message message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageResult() when $default != null:
return $default(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Message message)  $default,) {final _that = this;
switch (_that) {
case _SendMessageResult():
return $default(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Message message)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageResult() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageResult implements SendMessageResult {
  const _SendMessageResult({required this.message});
  factory _SendMessageResult.fromJson(Map<String, dynamic> json) => _$SendMessageResultFromJson(json);

@override final  Message message;

/// Create a copy of SendMessageResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageResultCopyWith<_SendMessageResult> get copyWith => __$SendMessageResultCopyWithImpl<_SendMessageResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageResult&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendMessageResult(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SendMessageResultCopyWith<$Res> implements $SendMessageResultCopyWith<$Res> {
  factory _$SendMessageResultCopyWith(_SendMessageResult value, $Res Function(_SendMessageResult) _then) = __$SendMessageResultCopyWithImpl;
@override @useResult
$Res call({
 Message message
});


@override $MessageCopyWith<$Res> get message;

}
/// @nodoc
class __$SendMessageResultCopyWithImpl<$Res>
    implements _$SendMessageResultCopyWith<$Res> {
  __$SendMessageResultCopyWithImpl(this._self, this._then);

  final _SendMessageResult _self;
  final $Res Function(_SendMessageResult) _then;

/// Create a copy of SendMessageResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SendMessageResult(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of SendMessageResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
mixin _$MarkConversationAsReadPayload {

 String get messageId;
/// Create a copy of MarkConversationAsReadPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkConversationAsReadPayloadCopyWith<MarkConversationAsReadPayload> get copyWith => _$MarkConversationAsReadPayloadCopyWithImpl<MarkConversationAsReadPayload>(this as MarkConversationAsReadPayload, _$identity);

  /// Serializes this MarkConversationAsReadPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkConversationAsReadPayload&&(identical(other.messageId, messageId) || other.messageId == messageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'MarkConversationAsReadPayload(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $MarkConversationAsReadPayloadCopyWith<$Res>  {
  factory $MarkConversationAsReadPayloadCopyWith(MarkConversationAsReadPayload value, $Res Function(MarkConversationAsReadPayload) _then) = _$MarkConversationAsReadPayloadCopyWithImpl;
@useResult
$Res call({
 String messageId
});




}
/// @nodoc
class _$MarkConversationAsReadPayloadCopyWithImpl<$Res>
    implements $MarkConversationAsReadPayloadCopyWith<$Res> {
  _$MarkConversationAsReadPayloadCopyWithImpl(this._self, this._then);

  final MarkConversationAsReadPayload _self;
  final $Res Function(MarkConversationAsReadPayload) _then;

/// Create a copy of MarkConversationAsReadPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = null,}) {
  return _then(_self.copyWith(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkConversationAsReadPayload].
extension MarkConversationAsReadPayloadPatterns on MarkConversationAsReadPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkConversationAsReadPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkConversationAsReadPayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkConversationAsReadPayload value)  $default,){
final _that = this;
switch (_that) {
case _MarkConversationAsReadPayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkConversationAsReadPayload value)?  $default,){
final _that = this;
switch (_that) {
case _MarkConversationAsReadPayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String messageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkConversationAsReadPayload() when $default != null:
return $default(_that.messageId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String messageId)  $default,) {final _that = this;
switch (_that) {
case _MarkConversationAsReadPayload():
return $default(_that.messageId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String messageId)?  $default,) {final _that = this;
switch (_that) {
case _MarkConversationAsReadPayload() when $default != null:
return $default(_that.messageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkConversationAsReadPayload implements MarkConversationAsReadPayload {
  const _MarkConversationAsReadPayload({required this.messageId});
  factory _MarkConversationAsReadPayload.fromJson(Map<String, dynamic> json) => _$MarkConversationAsReadPayloadFromJson(json);

@override final  String messageId;

/// Create a copy of MarkConversationAsReadPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkConversationAsReadPayloadCopyWith<_MarkConversationAsReadPayload> get copyWith => __$MarkConversationAsReadPayloadCopyWithImpl<_MarkConversationAsReadPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkConversationAsReadPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkConversationAsReadPayload&&(identical(other.messageId, messageId) || other.messageId == messageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'MarkConversationAsReadPayload(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class _$MarkConversationAsReadPayloadCopyWith<$Res> implements $MarkConversationAsReadPayloadCopyWith<$Res> {
  factory _$MarkConversationAsReadPayloadCopyWith(_MarkConversationAsReadPayload value, $Res Function(_MarkConversationAsReadPayload) _then) = __$MarkConversationAsReadPayloadCopyWithImpl;
@override @useResult
$Res call({
 String messageId
});




}
/// @nodoc
class __$MarkConversationAsReadPayloadCopyWithImpl<$Res>
    implements _$MarkConversationAsReadPayloadCopyWith<$Res> {
  __$MarkConversationAsReadPayloadCopyWithImpl(this._self, this._then);

  final _MarkConversationAsReadPayload _self;
  final $Res Function(_MarkConversationAsReadPayload) _then;

/// Create a copy of MarkConversationAsReadPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(_MarkConversationAsReadPayload(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateConversationPayload {

 List<String> get participantIds;
/// Create a copy of CreateConversationPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateConversationPayloadCopyWith<CreateConversationPayload> get copyWith => _$CreateConversationPayloadCopyWithImpl<CreateConversationPayload>(this as CreateConversationPayload, _$identity);

  /// Serializes this CreateConversationPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateConversationPayload&&const DeepCollectionEquality().equals(other.participantIds, participantIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(participantIds));

@override
String toString() {
  return 'CreateConversationPayload(participantIds: $participantIds)';
}


}

/// @nodoc
abstract mixin class $CreateConversationPayloadCopyWith<$Res>  {
  factory $CreateConversationPayloadCopyWith(CreateConversationPayload value, $Res Function(CreateConversationPayload) _then) = _$CreateConversationPayloadCopyWithImpl;
@useResult
$Res call({
 List<String> participantIds
});




}
/// @nodoc
class _$CreateConversationPayloadCopyWithImpl<$Res>
    implements $CreateConversationPayloadCopyWith<$Res> {
  _$CreateConversationPayloadCopyWithImpl(this._self, this._then);

  final CreateConversationPayload _self;
  final $Res Function(CreateConversationPayload) _then;

/// Create a copy of CreateConversationPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? participantIds = null,}) {
  return _then(_self.copyWith(
participantIds: null == participantIds ? _self.participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateConversationPayload].
extension CreateConversationPayloadPatterns on CreateConversationPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateConversationPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateConversationPayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateConversationPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateConversationPayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateConversationPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateConversationPayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> participantIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateConversationPayload() when $default != null:
return $default(_that.participantIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> participantIds)  $default,) {final _that = this;
switch (_that) {
case _CreateConversationPayload():
return $default(_that.participantIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> participantIds)?  $default,) {final _that = this;
switch (_that) {
case _CreateConversationPayload() when $default != null:
return $default(_that.participantIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateConversationPayload implements CreateConversationPayload {
  const _CreateConversationPayload({required final  List<String> participantIds}): _participantIds = participantIds;
  factory _CreateConversationPayload.fromJson(Map<String, dynamic> json) => _$CreateConversationPayloadFromJson(json);

 final  List<String> _participantIds;
@override List<String> get participantIds {
  if (_participantIds is EqualUnmodifiableListView) return _participantIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participantIds);
}


/// Create a copy of CreateConversationPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateConversationPayloadCopyWith<_CreateConversationPayload> get copyWith => __$CreateConversationPayloadCopyWithImpl<_CreateConversationPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateConversationPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateConversationPayload&&const DeepCollectionEquality().equals(other._participantIds, _participantIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_participantIds));

@override
String toString() {
  return 'CreateConversationPayload(participantIds: $participantIds)';
}


}

/// @nodoc
abstract mixin class _$CreateConversationPayloadCopyWith<$Res> implements $CreateConversationPayloadCopyWith<$Res> {
  factory _$CreateConversationPayloadCopyWith(_CreateConversationPayload value, $Res Function(_CreateConversationPayload) _then) = __$CreateConversationPayloadCopyWithImpl;
@override @useResult
$Res call({
 List<String> participantIds
});




}
/// @nodoc
class __$CreateConversationPayloadCopyWithImpl<$Res>
    implements _$CreateConversationPayloadCopyWith<$Res> {
  __$CreateConversationPayloadCopyWithImpl(this._self, this._then);

  final _CreateConversationPayload _self;
  final $Res Function(_CreateConversationPayload) _then;

/// Create a copy of CreateConversationPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? participantIds = null,}) {
  return _then(_CreateConversationPayload(
participantIds: null == participantIds ? _self._participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$CreateConversationResult {

 Conversation get conversation;
/// Create a copy of CreateConversationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateConversationResultCopyWith<CreateConversationResult> get copyWith => _$CreateConversationResultCopyWithImpl<CreateConversationResult>(this as CreateConversationResult, _$identity);

  /// Serializes this CreateConversationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateConversationResult&&(identical(other.conversation, conversation) || other.conversation == conversation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversation);

@override
String toString() {
  return 'CreateConversationResult(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $CreateConversationResultCopyWith<$Res>  {
  factory $CreateConversationResultCopyWith(CreateConversationResult value, $Res Function(CreateConversationResult) _then) = _$CreateConversationResultCopyWithImpl;
@useResult
$Res call({
 Conversation conversation
});


$ConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class _$CreateConversationResultCopyWithImpl<$Res>
    implements $CreateConversationResultCopyWith<$Res> {
  _$CreateConversationResultCopyWithImpl(this._self, this._then);

  final CreateConversationResult _self;
  final $Res Function(CreateConversationResult) _then;

/// Create a copy of CreateConversationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversation = null,}) {
  return _then(_self.copyWith(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as Conversation,
  ));
}
/// Create a copy of CreateConversationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationCopyWith<$Res> get conversation {
  
  return $ConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateConversationResult].
extension CreateConversationResultPatterns on CreateConversationResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateConversationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateConversationResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateConversationResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateConversationResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateConversationResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateConversationResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Conversation conversation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateConversationResult() when $default != null:
return $default(_that.conversation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Conversation conversation)  $default,) {final _that = this;
switch (_that) {
case _CreateConversationResult():
return $default(_that.conversation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Conversation conversation)?  $default,) {final _that = this;
switch (_that) {
case _CreateConversationResult() when $default != null:
return $default(_that.conversation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateConversationResult implements CreateConversationResult {
  const _CreateConversationResult({required this.conversation});
  factory _CreateConversationResult.fromJson(Map<String, dynamic> json) => _$CreateConversationResultFromJson(json);

@override final  Conversation conversation;

/// Create a copy of CreateConversationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateConversationResultCopyWith<_CreateConversationResult> get copyWith => __$CreateConversationResultCopyWithImpl<_CreateConversationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateConversationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateConversationResult&&(identical(other.conversation, conversation) || other.conversation == conversation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversation);

@override
String toString() {
  return 'CreateConversationResult(conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class _$CreateConversationResultCopyWith<$Res> implements $CreateConversationResultCopyWith<$Res> {
  factory _$CreateConversationResultCopyWith(_CreateConversationResult value, $Res Function(_CreateConversationResult) _then) = __$CreateConversationResultCopyWithImpl;
@override @useResult
$Res call({
 Conversation conversation
});


@override $ConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class __$CreateConversationResultCopyWithImpl<$Res>
    implements _$CreateConversationResultCopyWith<$Res> {
  __$CreateConversationResultCopyWithImpl(this._self, this._then);

  final _CreateConversationResult _self;
  final $Res Function(_CreateConversationResult) _then;

/// Create a copy of CreateConversationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversation = null,}) {
  return _then(_CreateConversationResult(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as Conversation,
  ));
}

/// Create a copy of CreateConversationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationCopyWith<$Res> get conversation {
  
  return $ConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// @nodoc
mixin _$GetSchoolMembersPayload {

 String? get query; String? get role;
/// Create a copy of GetSchoolMembersPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSchoolMembersPayloadCopyWith<GetSchoolMembersPayload> get copyWith => _$GetSchoolMembersPayloadCopyWithImpl<GetSchoolMembersPayload>(this as GetSchoolMembersPayload, _$identity);

  /// Serializes this GetSchoolMembersPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSchoolMembersPayload&&(identical(other.query, query) || other.query == query)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,role);

@override
String toString() {
  return 'GetSchoolMembersPayload(query: $query, role: $role)';
}


}

/// @nodoc
abstract mixin class $GetSchoolMembersPayloadCopyWith<$Res>  {
  factory $GetSchoolMembersPayloadCopyWith(GetSchoolMembersPayload value, $Res Function(GetSchoolMembersPayload) _then) = _$GetSchoolMembersPayloadCopyWithImpl;
@useResult
$Res call({
 String? query, String? role
});




}
/// @nodoc
class _$GetSchoolMembersPayloadCopyWithImpl<$Res>
    implements $GetSchoolMembersPayloadCopyWith<$Res> {
  _$GetSchoolMembersPayloadCopyWithImpl(this._self, this._then);

  final GetSchoolMembersPayload _self;
  final $Res Function(GetSchoolMembersPayload) _then;

/// Create a copy of GetSchoolMembersPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,Object? role = freezed,}) {
  return _then(_self.copyWith(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSchoolMembersPayload].
extension GetSchoolMembersPayloadPatterns on GetSchoolMembersPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSchoolMembersPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSchoolMembersPayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSchoolMembersPayload value)  $default,){
final _that = this;
switch (_that) {
case _GetSchoolMembersPayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSchoolMembersPayload value)?  $default,){
final _that = this;
switch (_that) {
case _GetSchoolMembersPayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query,  String? role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSchoolMembersPayload() when $default != null:
return $default(_that.query,_that.role);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query,  String? role)  $default,) {final _that = this;
switch (_that) {
case _GetSchoolMembersPayload():
return $default(_that.query,_that.role);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query,  String? role)?  $default,) {final _that = this;
switch (_that) {
case _GetSchoolMembersPayload() when $default != null:
return $default(_that.query,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetSchoolMembersPayload implements GetSchoolMembersPayload {
  const _GetSchoolMembersPayload({this.query, this.role});
  factory _GetSchoolMembersPayload.fromJson(Map<String, dynamic> json) => _$GetSchoolMembersPayloadFromJson(json);

@override final  String? query;
@override final  String? role;

/// Create a copy of GetSchoolMembersPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSchoolMembersPayloadCopyWith<_GetSchoolMembersPayload> get copyWith => __$GetSchoolMembersPayloadCopyWithImpl<_GetSchoolMembersPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetSchoolMembersPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSchoolMembersPayload&&(identical(other.query, query) || other.query == query)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,role);

@override
String toString() {
  return 'GetSchoolMembersPayload(query: $query, role: $role)';
}


}

/// @nodoc
abstract mixin class _$GetSchoolMembersPayloadCopyWith<$Res> implements $GetSchoolMembersPayloadCopyWith<$Res> {
  factory _$GetSchoolMembersPayloadCopyWith(_GetSchoolMembersPayload value, $Res Function(_GetSchoolMembersPayload) _then) = __$GetSchoolMembersPayloadCopyWithImpl;
@override @useResult
$Res call({
 String? query, String? role
});




}
/// @nodoc
class __$GetSchoolMembersPayloadCopyWithImpl<$Res>
    implements _$GetSchoolMembersPayloadCopyWith<$Res> {
  __$GetSchoolMembersPayloadCopyWithImpl(this._self, this._then);

  final _GetSchoolMembersPayload _self;
  final $Res Function(_GetSchoolMembersPayload) _then;

/// Create a copy of GetSchoolMembersPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? role = freezed,}) {
  return _then(_GetSchoolMembersPayload(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GetSchoolMembersResult {

 List<Account> get members;
/// Create a copy of GetSchoolMembersResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSchoolMembersResultCopyWith<GetSchoolMembersResult> get copyWith => _$GetSchoolMembersResultCopyWithImpl<GetSchoolMembersResult>(this as GetSchoolMembersResult, _$identity);

  /// Serializes this GetSchoolMembersResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSchoolMembersResult&&const DeepCollectionEquality().equals(other.members, members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(members));

@override
String toString() {
  return 'GetSchoolMembersResult(members: $members)';
}


}

/// @nodoc
abstract mixin class $GetSchoolMembersResultCopyWith<$Res>  {
  factory $GetSchoolMembersResultCopyWith(GetSchoolMembersResult value, $Res Function(GetSchoolMembersResult) _then) = _$GetSchoolMembersResultCopyWithImpl;
@useResult
$Res call({
 List<Account> members
});




}
/// @nodoc
class _$GetSchoolMembersResultCopyWithImpl<$Res>
    implements $GetSchoolMembersResultCopyWith<$Res> {
  _$GetSchoolMembersResultCopyWithImpl(this._self, this._then);

  final GetSchoolMembersResult _self;
  final $Res Function(GetSchoolMembersResult) _then;

/// Create a copy of GetSchoolMembersResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? members = null,}) {
  return _then(_self.copyWith(
members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<Account>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSchoolMembersResult].
extension GetSchoolMembersResultPatterns on GetSchoolMembersResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSchoolMembersResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSchoolMembersResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSchoolMembersResult value)  $default,){
final _that = this;
switch (_that) {
case _GetSchoolMembersResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSchoolMembersResult value)?  $default,){
final _that = this;
switch (_that) {
case _GetSchoolMembersResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Account> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSchoolMembersResult() when $default != null:
return $default(_that.members);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Account> members)  $default,) {final _that = this;
switch (_that) {
case _GetSchoolMembersResult():
return $default(_that.members);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Account> members)?  $default,) {final _that = this;
switch (_that) {
case _GetSchoolMembersResult() when $default != null:
return $default(_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetSchoolMembersResult implements GetSchoolMembersResult {
  const _GetSchoolMembersResult({final  List<Account> members = const <Account>[]}): _members = members;
  factory _GetSchoolMembersResult.fromJson(Map<String, dynamic> json) => _$GetSchoolMembersResultFromJson(json);

 final  List<Account> _members;
@override@JsonKey() List<Account> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of GetSchoolMembersResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSchoolMembersResultCopyWith<_GetSchoolMembersResult> get copyWith => __$GetSchoolMembersResultCopyWithImpl<_GetSchoolMembersResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetSchoolMembersResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSchoolMembersResult&&const DeepCollectionEquality().equals(other._members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'GetSchoolMembersResult(members: $members)';
}


}

/// @nodoc
abstract mixin class _$GetSchoolMembersResultCopyWith<$Res> implements $GetSchoolMembersResultCopyWith<$Res> {
  factory _$GetSchoolMembersResultCopyWith(_GetSchoolMembersResult value, $Res Function(_GetSchoolMembersResult) _then) = __$GetSchoolMembersResultCopyWithImpl;
@override @useResult
$Res call({
 List<Account> members
});




}
/// @nodoc
class __$GetSchoolMembersResultCopyWithImpl<$Res>
    implements _$GetSchoolMembersResultCopyWith<$Res> {
  __$GetSchoolMembersResultCopyWithImpl(this._self, this._then);

  final _GetSchoolMembersResult _self;
  final $Res Function(_GetSchoolMembersResult) _then;

/// Create a copy of GetSchoolMembersResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? members = null,}) {
  return _then(_GetSchoolMembersResult(
members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<Account>,
  ));
}


}

// dart format on
