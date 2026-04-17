// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListTeacherResourcesPayload {

 int get page; int get size; String? get departmentId; String? get gradeLevel; bool get favoritedOnly;
/// Create a copy of ListTeacherResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListTeacherResourcesPayloadCopyWith<ListTeacherResourcesPayload> get copyWith => _$ListTeacherResourcesPayloadCopyWithImpl<ListTeacherResourcesPayload>(this as ListTeacherResourcesPayload, _$identity);

  /// Serializes this ListTeacherResourcesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListTeacherResourcesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.favoritedOnly, favoritedOnly) || other.favoritedOnly == favoritedOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,departmentId,gradeLevel,favoritedOnly);

@override
String toString() {
  return 'ListTeacherResourcesPayload(page: $page, size: $size, departmentId: $departmentId, gradeLevel: $gradeLevel, favoritedOnly: $favoritedOnly)';
}


}

/// @nodoc
abstract mixin class $ListTeacherResourcesPayloadCopyWith<$Res>  {
  factory $ListTeacherResourcesPayloadCopyWith(ListTeacherResourcesPayload value, $Res Function(ListTeacherResourcesPayload) _then) = _$ListTeacherResourcesPayloadCopyWithImpl;
@useResult
$Res call({
 int page, int size, String? departmentId, String? gradeLevel, bool favoritedOnly
});




}
/// @nodoc
class _$ListTeacherResourcesPayloadCopyWithImpl<$Res>
    implements $ListTeacherResourcesPayloadCopyWith<$Res> {
  _$ListTeacherResourcesPayloadCopyWithImpl(this._self, this._then);

  final ListTeacherResourcesPayload _self;
  final $Res Function(ListTeacherResourcesPayload) _then;

/// Create a copy of ListTeacherResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? size = null,Object? departmentId = freezed,Object? gradeLevel = freezed,Object? favoritedOnly = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: freezed == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String?,favoritedOnly: null == favoritedOnly ? _self.favoritedOnly : favoritedOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListTeacherResourcesPayload].
extension ListTeacherResourcesPayloadPatterns on ListTeacherResourcesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListTeacherResourcesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListTeacherResourcesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListTeacherResourcesPayload value)  $default,){
final _that = this;
switch (_that) {
case _ListTeacherResourcesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListTeacherResourcesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ListTeacherResourcesPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int size,  String? departmentId,  String? gradeLevel,  bool favoritedOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListTeacherResourcesPayload() when $default != null:
return $default(_that.page,_that.size,_that.departmentId,_that.gradeLevel,_that.favoritedOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int size,  String? departmentId,  String? gradeLevel,  bool favoritedOnly)  $default,) {final _that = this;
switch (_that) {
case _ListTeacherResourcesPayload():
return $default(_that.page,_that.size,_that.departmentId,_that.gradeLevel,_that.favoritedOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int size,  String? departmentId,  String? gradeLevel,  bool favoritedOnly)?  $default,) {final _that = this;
switch (_that) {
case _ListTeacherResourcesPayload() when $default != null:
return $default(_that.page,_that.size,_that.departmentId,_that.gradeLevel,_that.favoritedOnly);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ListTeacherResourcesPayload implements ListTeacherResourcesPayload {
  const _ListTeacherResourcesPayload({this.page = 1, this.size = 20, this.departmentId, this.gradeLevel, this.favoritedOnly = false});
  factory _ListTeacherResourcesPayload.fromJson(Map<String, dynamic> json) => _$ListTeacherResourcesPayloadFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override final  String? departmentId;
@override final  String? gradeLevel;
@override@JsonKey() final  bool favoritedOnly;

/// Create a copy of ListTeacherResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListTeacherResourcesPayloadCopyWith<_ListTeacherResourcesPayload> get copyWith => __$ListTeacherResourcesPayloadCopyWithImpl<_ListTeacherResourcesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListTeacherResourcesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListTeacherResourcesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.favoritedOnly, favoritedOnly) || other.favoritedOnly == favoritedOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,departmentId,gradeLevel,favoritedOnly);

@override
String toString() {
  return 'ListTeacherResourcesPayload(page: $page, size: $size, departmentId: $departmentId, gradeLevel: $gradeLevel, favoritedOnly: $favoritedOnly)';
}


}

/// @nodoc
abstract mixin class _$ListTeacherResourcesPayloadCopyWith<$Res> implements $ListTeacherResourcesPayloadCopyWith<$Res> {
  factory _$ListTeacherResourcesPayloadCopyWith(_ListTeacherResourcesPayload value, $Res Function(_ListTeacherResourcesPayload) _then) = __$ListTeacherResourcesPayloadCopyWithImpl;
@override @useResult
$Res call({
 int page, int size, String? departmentId, String? gradeLevel, bool favoritedOnly
});




}
/// @nodoc
class __$ListTeacherResourcesPayloadCopyWithImpl<$Res>
    implements _$ListTeacherResourcesPayloadCopyWith<$Res> {
  __$ListTeacherResourcesPayloadCopyWithImpl(this._self, this._then);

  final _ListTeacherResourcesPayload _self;
  final $Res Function(_ListTeacherResourcesPayload) _then;

/// Create a copy of ListTeacherResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,Object? departmentId = freezed,Object? gradeLevel = freezed,Object? favoritedOnly = null,}) {
  return _then(_ListTeacherResourcesPayload(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: freezed == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String?,favoritedOnly: null == favoritedOnly ? _self.favoritedOnly : favoritedOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BrowseResourcesPayload {

 int get page; int get size; String? get query; String? get departmentId; String? get gradeLevel; String? get fileType; String get sort; bool get favoritedOnly; bool get myResourcesOnly;
/// Create a copy of BrowseResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseResourcesPayloadCopyWith<BrowseResourcesPayload> get copyWith => _$BrowseResourcesPayloadCopyWithImpl<BrowseResourcesPayload>(this as BrowseResourcesPayload, _$identity);

  /// Serializes this BrowseResourcesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseResourcesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.query, query) || other.query == query)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.favoritedOnly, favoritedOnly) || other.favoritedOnly == favoritedOnly)&&(identical(other.myResourcesOnly, myResourcesOnly) || other.myResourcesOnly == myResourcesOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,query,departmentId,gradeLevel,fileType,sort,favoritedOnly,myResourcesOnly);

@override
String toString() {
  return 'BrowseResourcesPayload(page: $page, size: $size, query: $query, departmentId: $departmentId, gradeLevel: $gradeLevel, fileType: $fileType, sort: $sort, favoritedOnly: $favoritedOnly, myResourcesOnly: $myResourcesOnly)';
}


}

/// @nodoc
abstract mixin class $BrowseResourcesPayloadCopyWith<$Res>  {
  factory $BrowseResourcesPayloadCopyWith(BrowseResourcesPayload value, $Res Function(BrowseResourcesPayload) _then) = _$BrowseResourcesPayloadCopyWithImpl;
@useResult
$Res call({
 int page, int size, String? query, String? departmentId, String? gradeLevel, String? fileType, String sort, bool favoritedOnly, bool myResourcesOnly
});




}
/// @nodoc
class _$BrowseResourcesPayloadCopyWithImpl<$Res>
    implements $BrowseResourcesPayloadCopyWith<$Res> {
  _$BrowseResourcesPayloadCopyWithImpl(this._self, this._then);

  final BrowseResourcesPayload _self;
  final $Res Function(BrowseResourcesPayload) _then;

/// Create a copy of BrowseResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? size = null,Object? query = freezed,Object? departmentId = freezed,Object? gradeLevel = freezed,Object? fileType = freezed,Object? sort = null,Object? favoritedOnly = null,Object? myResourcesOnly = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: freezed == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,favoritedOnly: null == favoritedOnly ? _self.favoritedOnly : favoritedOnly // ignore: cast_nullable_to_non_nullable
as bool,myResourcesOnly: null == myResourcesOnly ? _self.myResourcesOnly : myResourcesOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BrowseResourcesPayload].
extension BrowseResourcesPayloadPatterns on BrowseResourcesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrowseResourcesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrowseResourcesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrowseResourcesPayload value)  $default,){
final _that = this;
switch (_that) {
case _BrowseResourcesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrowseResourcesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _BrowseResourcesPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int size,  String? query,  String? departmentId,  String? gradeLevel,  String? fileType,  String sort,  bool favoritedOnly,  bool myResourcesOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrowseResourcesPayload() when $default != null:
return $default(_that.page,_that.size,_that.query,_that.departmentId,_that.gradeLevel,_that.fileType,_that.sort,_that.favoritedOnly,_that.myResourcesOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int size,  String? query,  String? departmentId,  String? gradeLevel,  String? fileType,  String sort,  bool favoritedOnly,  bool myResourcesOnly)  $default,) {final _that = this;
switch (_that) {
case _BrowseResourcesPayload():
return $default(_that.page,_that.size,_that.query,_that.departmentId,_that.gradeLevel,_that.fileType,_that.sort,_that.favoritedOnly,_that.myResourcesOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int size,  String? query,  String? departmentId,  String? gradeLevel,  String? fileType,  String sort,  bool favoritedOnly,  bool myResourcesOnly)?  $default,) {final _that = this;
switch (_that) {
case _BrowseResourcesPayload() when $default != null:
return $default(_that.page,_that.size,_that.query,_that.departmentId,_that.gradeLevel,_that.fileType,_that.sort,_that.favoritedOnly,_that.myResourcesOnly);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _BrowseResourcesPayload implements BrowseResourcesPayload {
  const _BrowseResourcesPayload({this.page = 1, this.size = 20, this.query, this.departmentId, this.gradeLevel, this.fileType, this.sort = 'latest', this.favoritedOnly = false, this.myResourcesOnly = false});
  factory _BrowseResourcesPayload.fromJson(Map<String, dynamic> json) => _$BrowseResourcesPayloadFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override final  String? query;
@override final  String? departmentId;
@override final  String? gradeLevel;
@override final  String? fileType;
@override@JsonKey() final  String sort;
@override@JsonKey() final  bool favoritedOnly;
@override@JsonKey() final  bool myResourcesOnly;

/// Create a copy of BrowseResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrowseResourcesPayloadCopyWith<_BrowseResourcesPayload> get copyWith => __$BrowseResourcesPayloadCopyWithImpl<_BrowseResourcesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrowseResourcesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrowseResourcesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.query, query) || other.query == query)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.favoritedOnly, favoritedOnly) || other.favoritedOnly == favoritedOnly)&&(identical(other.myResourcesOnly, myResourcesOnly) || other.myResourcesOnly == myResourcesOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,query,departmentId,gradeLevel,fileType,sort,favoritedOnly,myResourcesOnly);

@override
String toString() {
  return 'BrowseResourcesPayload(page: $page, size: $size, query: $query, departmentId: $departmentId, gradeLevel: $gradeLevel, fileType: $fileType, sort: $sort, favoritedOnly: $favoritedOnly, myResourcesOnly: $myResourcesOnly)';
}


}

/// @nodoc
abstract mixin class _$BrowseResourcesPayloadCopyWith<$Res> implements $BrowseResourcesPayloadCopyWith<$Res> {
  factory _$BrowseResourcesPayloadCopyWith(_BrowseResourcesPayload value, $Res Function(_BrowseResourcesPayload) _then) = __$BrowseResourcesPayloadCopyWithImpl;
@override @useResult
$Res call({
 int page, int size, String? query, String? departmentId, String? gradeLevel, String? fileType, String sort, bool favoritedOnly, bool myResourcesOnly
});




}
/// @nodoc
class __$BrowseResourcesPayloadCopyWithImpl<$Res>
    implements _$BrowseResourcesPayloadCopyWith<$Res> {
  __$BrowseResourcesPayloadCopyWithImpl(this._self, this._then);

  final _BrowseResourcesPayload _self;
  final $Res Function(_BrowseResourcesPayload) _then;

/// Create a copy of BrowseResourcesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,Object? query = freezed,Object? departmentId = freezed,Object? gradeLevel = freezed,Object? fileType = freezed,Object? sort = null,Object? favoritedOnly = null,Object? myResourcesOnly = null,}) {
  return _then(_BrowseResourcesPayload(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: freezed == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,favoritedOnly: null == favoritedOnly ? _self.favoritedOnly : favoritedOnly // ignore: cast_nullable_to_non_nullable
as bool,myResourcesOnly: null == myResourcesOnly ? _self.myResourcesOnly : myResourcesOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ListFavoritesPayload {

 int get page; int get size;
/// Create a copy of ListFavoritesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListFavoritesPayloadCopyWith<ListFavoritesPayload> get copyWith => _$ListFavoritesPayloadCopyWithImpl<ListFavoritesPayload>(this as ListFavoritesPayload, _$identity);

  /// Serializes this ListFavoritesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListFavoritesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size);

@override
String toString() {
  return 'ListFavoritesPayload(page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $ListFavoritesPayloadCopyWith<$Res>  {
  factory $ListFavoritesPayloadCopyWith(ListFavoritesPayload value, $Res Function(ListFavoritesPayload) _then) = _$ListFavoritesPayloadCopyWithImpl;
@useResult
$Res call({
 int page, int size
});




}
/// @nodoc
class _$ListFavoritesPayloadCopyWithImpl<$Res>
    implements $ListFavoritesPayloadCopyWith<$Res> {
  _$ListFavoritesPayloadCopyWithImpl(this._self, this._then);

  final ListFavoritesPayload _self;
  final $Res Function(ListFavoritesPayload) _then;

/// Create a copy of ListFavoritesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListFavoritesPayload].
extension ListFavoritesPayloadPatterns on ListFavoritesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListFavoritesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListFavoritesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListFavoritesPayload value)  $default,){
final _that = this;
switch (_that) {
case _ListFavoritesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListFavoritesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ListFavoritesPayload() when $default != null:
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
case _ListFavoritesPayload() when $default != null:
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
case _ListFavoritesPayload():
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
case _ListFavoritesPayload() when $default != null:
return $default(_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ListFavoritesPayload implements ListFavoritesPayload {
  const _ListFavoritesPayload({this.page = 1, this.size = 20});
  factory _ListFavoritesPayload.fromJson(Map<String, dynamic> json) => _$ListFavoritesPayloadFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of ListFavoritesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListFavoritesPayloadCopyWith<_ListFavoritesPayload> get copyWith => __$ListFavoritesPayloadCopyWithImpl<_ListFavoritesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListFavoritesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListFavoritesPayload&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size);

@override
String toString() {
  return 'ListFavoritesPayload(page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$ListFavoritesPayloadCopyWith<$Res> implements $ListFavoritesPayloadCopyWith<$Res> {
  factory _$ListFavoritesPayloadCopyWith(_ListFavoritesPayload value, $Res Function(_ListFavoritesPayload) _then) = __$ListFavoritesPayloadCopyWithImpl;
@override @useResult
$Res call({
 int page, int size
});




}
/// @nodoc
class __$ListFavoritesPayloadCopyWithImpl<$Res>
    implements _$ListFavoritesPayloadCopyWith<$Res> {
  __$ListFavoritesPayloadCopyWithImpl(this._self, this._then);

  final _ListFavoritesPayload _self;
  final $Res Function(_ListFavoritesPayload) _then;

/// Create a copy of ListFavoritesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,}) {
  return _then(_ListFavoritesPayload(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AddFileToResourcePayload {

 String get fileId;
/// Create a copy of AddFileToResourcePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFileToResourcePayloadCopyWith<AddFileToResourcePayload> get copyWith => _$AddFileToResourcePayloadCopyWithImpl<AddFileToResourcePayload>(this as AddFileToResourcePayload, _$identity);

  /// Serializes this AddFileToResourcePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFileToResourcePayload&&(identical(other.fileId, fileId) || other.fileId == fileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'AddFileToResourcePayload(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class $AddFileToResourcePayloadCopyWith<$Res>  {
  factory $AddFileToResourcePayloadCopyWith(AddFileToResourcePayload value, $Res Function(AddFileToResourcePayload) _then) = _$AddFileToResourcePayloadCopyWithImpl;
@useResult
$Res call({
 String fileId
});




}
/// @nodoc
class _$AddFileToResourcePayloadCopyWithImpl<$Res>
    implements $AddFileToResourcePayloadCopyWith<$Res> {
  _$AddFileToResourcePayloadCopyWithImpl(this._self, this._then);

  final AddFileToResourcePayload _self;
  final $Res Function(AddFileToResourcePayload) _then;

/// Create a copy of AddFileToResourcePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = null,}) {
  return _then(_self.copyWith(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddFileToResourcePayload].
extension AddFileToResourcePayloadPatterns on AddFileToResourcePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddFileToResourcePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddFileToResourcePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddFileToResourcePayload value)  $default,){
final _that = this;
switch (_that) {
case _AddFileToResourcePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddFileToResourcePayload value)?  $default,){
final _that = this;
switch (_that) {
case _AddFileToResourcePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddFileToResourcePayload() when $default != null:
return $default(_that.fileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileId)  $default,) {final _that = this;
switch (_that) {
case _AddFileToResourcePayload():
return $default(_that.fileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileId)?  $default,) {final _that = this;
switch (_that) {
case _AddFileToResourcePayload() when $default != null:
return $default(_that.fileId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AddFileToResourcePayload implements AddFileToResourcePayload {
  const _AddFileToResourcePayload({required this.fileId});
  factory _AddFileToResourcePayload.fromJson(Map<String, dynamic> json) => _$AddFileToResourcePayloadFromJson(json);

@override final  String fileId;

/// Create a copy of AddFileToResourcePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddFileToResourcePayloadCopyWith<_AddFileToResourcePayload> get copyWith => __$AddFileToResourcePayloadCopyWithImpl<_AddFileToResourcePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddFileToResourcePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddFileToResourcePayload&&(identical(other.fileId, fileId) || other.fileId == fileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'AddFileToResourcePayload(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class _$AddFileToResourcePayloadCopyWith<$Res> implements $AddFileToResourcePayloadCopyWith<$Res> {
  factory _$AddFileToResourcePayloadCopyWith(_AddFileToResourcePayload value, $Res Function(_AddFileToResourcePayload) _then) = __$AddFileToResourcePayloadCopyWithImpl;
@override @useResult
$Res call({
 String fileId
});




}
/// @nodoc
class __$AddFileToResourcePayloadCopyWithImpl<$Res>
    implements _$AddFileToResourcePayloadCopyWith<$Res> {
  __$AddFileToResourcePayloadCopyWithImpl(this._self, this._then);

  final _AddFileToResourcePayload _self;
  final $Res Function(_AddFileToResourcePayload) _then;

/// Create a copy of AddFileToResourcePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileId = null,}) {
  return _then(_AddFileToResourcePayload(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
