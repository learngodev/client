// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListNotificationsPayload {

 int get page; int get size;
/// Create a copy of ListNotificationsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListNotificationsPayloadCopyWith<ListNotificationsPayload> get copyWith => _$ListNotificationsPayloadCopyWithImpl<ListNotificationsPayload>(this as ListNotificationsPayload, _$identity);

  /// Serializes this ListNotificationsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListNotificationsPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size);

@override
String toString() {
  return 'ListNotificationsPayload(page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $ListNotificationsPayloadCopyWith<$Res>  {
  factory $ListNotificationsPayloadCopyWith(ListNotificationsPayload value, $Res Function(ListNotificationsPayload) _then) = _$ListNotificationsPayloadCopyWithImpl;
@useResult
$Res call({
 int page, int size
});




}
/// @nodoc
class _$ListNotificationsPayloadCopyWithImpl<$Res>
    implements $ListNotificationsPayloadCopyWith<$Res> {
  _$ListNotificationsPayloadCopyWithImpl(this._self, this._then);

  final ListNotificationsPayload _self;
  final $Res Function(ListNotificationsPayload) _then;

/// Create a copy of ListNotificationsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListNotificationsPayload].
extension ListNotificationsPayloadPatterns on ListNotificationsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListNotificationsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListNotificationsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListNotificationsPayload value)  $default,){
final _that = this;
switch (_that) {
case _ListNotificationsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListNotificationsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ListNotificationsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListNotificationsPayload() when $default != null:
return $default(_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _ListNotificationsPayload():
return $default(_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _ListNotificationsPayload() when $default != null:
return $default(_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListNotificationsPayload implements ListNotificationsPayload {
  const _ListNotificationsPayload({this.page = 1, this.size = 20});
  factory _ListNotificationsPayload.fromJson(Map<String, dynamic> json) => _$ListNotificationsPayloadFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of ListNotificationsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListNotificationsPayloadCopyWith<_ListNotificationsPayload> get copyWith => __$ListNotificationsPayloadCopyWithImpl<_ListNotificationsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListNotificationsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListNotificationsPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size);

@override
String toString() {
  return 'ListNotificationsPayload(page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$ListNotificationsPayloadCopyWith<$Res> implements $ListNotificationsPayloadCopyWith<$Res> {
  factory _$ListNotificationsPayloadCopyWith(_ListNotificationsPayload value, $Res Function(_ListNotificationsPayload) _then) = __$ListNotificationsPayloadCopyWithImpl;
@override @useResult
$Res call({
 int page, int size
});




}
/// @nodoc
class __$ListNotificationsPayloadCopyWithImpl<$Res>
    implements _$ListNotificationsPayloadCopyWith<$Res> {
  __$ListNotificationsPayloadCopyWithImpl(this._self, this._then);

  final _ListNotificationsPayload _self;
  final $Res Function(_ListNotificationsPayload) _then;

/// Create a copy of ListNotificationsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,}) {
  return _then(_ListNotificationsPayload(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ListNotificationsResult {

 List<AppNotification> get items;
/// Create a copy of ListNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListNotificationsResultCopyWith<ListNotificationsResult> get copyWith => _$ListNotificationsResultCopyWithImpl<ListNotificationsResult>(this as ListNotificationsResult, _$identity);

  /// Serializes this ListNotificationsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListNotificationsResult&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListNotificationsResult(items: $items)';
}


}

/// @nodoc
abstract mixin class $ListNotificationsResultCopyWith<$Res>  {
  factory $ListNotificationsResultCopyWith(ListNotificationsResult value, $Res Function(ListNotificationsResult) _then) = _$ListNotificationsResultCopyWithImpl;
@useResult
$Res call({
 List<AppNotification> items
});




}
/// @nodoc
class _$ListNotificationsResultCopyWithImpl<$Res>
    implements $ListNotificationsResultCopyWith<$Res> {
  _$ListNotificationsResultCopyWithImpl(this._self, this._then);

  final ListNotificationsResult _self;
  final $Res Function(ListNotificationsResult) _then;

/// Create a copy of ListNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListNotificationsResult].
extension ListNotificationsResultPatterns on ListNotificationsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListNotificationsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListNotificationsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListNotificationsResult value)  $default,){
final _that = this;
switch (_that) {
case _ListNotificationsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListNotificationsResult value)?  $default,){
final _that = this;
switch (_that) {
case _ListNotificationsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppNotification> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListNotificationsResult() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppNotification> items)  $default,) {final _that = this;
switch (_that) {
case _ListNotificationsResult():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppNotification> items)?  $default,) {final _that = this;
switch (_that) {
case _ListNotificationsResult() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListNotificationsResult implements ListNotificationsResult {
  const _ListNotificationsResult({final  List<AppNotification> items = const <AppNotification>[]}): _items = items;
  factory _ListNotificationsResult.fromJson(Map<String, dynamic> json) => _$ListNotificationsResultFromJson(json);

 final  List<AppNotification> _items;
@override@JsonKey() List<AppNotification> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListNotificationsResultCopyWith<_ListNotificationsResult> get copyWith => __$ListNotificationsResultCopyWithImpl<_ListNotificationsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListNotificationsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListNotificationsResult&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListNotificationsResult(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListNotificationsResultCopyWith<$Res> implements $ListNotificationsResultCopyWith<$Res> {
  factory _$ListNotificationsResultCopyWith(_ListNotificationsResult value, $Res Function(_ListNotificationsResult) _then) = __$ListNotificationsResultCopyWithImpl;
@override @useResult
$Res call({
 List<AppNotification> items
});




}
/// @nodoc
class __$ListNotificationsResultCopyWithImpl<$Res>
    implements _$ListNotificationsResultCopyWith<$Res> {
  __$ListNotificationsResultCopyWithImpl(this._self, this._then);

  final _ListNotificationsResult _self;
  final $Res Function(_ListNotificationsResult) _then;

/// Create a copy of ListNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ListNotificationsResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,
  ));
}


}


/// @nodoc
mixin _$CountUnreadNotificationsResult {

 int get count;
/// Create a copy of CountUnreadNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountUnreadNotificationsResultCopyWith<CountUnreadNotificationsResult> get copyWith => _$CountUnreadNotificationsResultCopyWithImpl<CountUnreadNotificationsResult>(this as CountUnreadNotificationsResult, _$identity);

  /// Serializes this CountUnreadNotificationsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountUnreadNotificationsResult&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'CountUnreadNotificationsResult(count: $count)';
}


}

/// @nodoc
abstract mixin class $CountUnreadNotificationsResultCopyWith<$Res>  {
  factory $CountUnreadNotificationsResultCopyWith(CountUnreadNotificationsResult value, $Res Function(CountUnreadNotificationsResult) _then) = _$CountUnreadNotificationsResultCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$CountUnreadNotificationsResultCopyWithImpl<$Res>
    implements $CountUnreadNotificationsResultCopyWith<$Res> {
  _$CountUnreadNotificationsResultCopyWithImpl(this._self, this._then);

  final CountUnreadNotificationsResult _self;
  final $Res Function(CountUnreadNotificationsResult) _then;

/// Create a copy of CountUnreadNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CountUnreadNotificationsResult].
extension CountUnreadNotificationsResultPatterns on CountUnreadNotificationsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountUnreadNotificationsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountUnreadNotificationsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountUnreadNotificationsResult value)  $default,){
final _that = this;
switch (_that) {
case _CountUnreadNotificationsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountUnreadNotificationsResult value)?  $default,){
final _that = this;
switch (_that) {
case _CountUnreadNotificationsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountUnreadNotificationsResult() when $default != null:
return $default(_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _CountUnreadNotificationsResult():
return $default(_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _CountUnreadNotificationsResult() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountUnreadNotificationsResult implements CountUnreadNotificationsResult {
  const _CountUnreadNotificationsResult({required this.count});
  factory _CountUnreadNotificationsResult.fromJson(Map<String, dynamic> json) => _$CountUnreadNotificationsResultFromJson(json);

@override final  int count;

/// Create a copy of CountUnreadNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountUnreadNotificationsResultCopyWith<_CountUnreadNotificationsResult> get copyWith => __$CountUnreadNotificationsResultCopyWithImpl<_CountUnreadNotificationsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountUnreadNotificationsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountUnreadNotificationsResult&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'CountUnreadNotificationsResult(count: $count)';
}


}

/// @nodoc
abstract mixin class _$CountUnreadNotificationsResultCopyWith<$Res> implements $CountUnreadNotificationsResultCopyWith<$Res> {
  factory _$CountUnreadNotificationsResultCopyWith(_CountUnreadNotificationsResult value, $Res Function(_CountUnreadNotificationsResult) _then) = __$CountUnreadNotificationsResultCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$CountUnreadNotificationsResultCopyWithImpl<$Res>
    implements _$CountUnreadNotificationsResultCopyWith<$Res> {
  __$CountUnreadNotificationsResultCopyWithImpl(this._self, this._then);

  final _CountUnreadNotificationsResult _self;
  final $Res Function(_CountUnreadNotificationsResult) _then;

/// Create a copy of CountUnreadNotificationsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_CountUnreadNotificationsResult(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
