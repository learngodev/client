// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AIAgentSetting {

 String get id; String get schoolId;@JsonKey(fromJson: AIProvider.fromString) AIProvider get provider; String get model; String get apiKey; String get baseUrl; double get temperature; double get topP; int get maxOutputTokens; int get maxDailyRequests; int get maxConcurrentRequests; int get maxConversationMessages; String get systemPrompt; bool get visionEnabled; String get updatedBy; String get updatedByName; DateTime get updatedAt; bool get apiKeyPresent;
/// Create a copy of AIAgentSetting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AIAgentSettingCopyWith<AIAgentSetting> get copyWith => _$AIAgentSettingCopyWithImpl<AIAgentSetting>(this as AIAgentSetting, _$identity);

  /// Serializes this AIAgentSetting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AIAgentSetting&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.maxOutputTokens, maxOutputTokens) || other.maxOutputTokens == maxOutputTokens)&&(identical(other.maxDailyRequests, maxDailyRequests) || other.maxDailyRequests == maxDailyRequests)&&(identical(other.maxConcurrentRequests, maxConcurrentRequests) || other.maxConcurrentRequests == maxConcurrentRequests)&&(identical(other.maxConversationMessages, maxConversationMessages) || other.maxConversationMessages == maxConversationMessages)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.visionEnabled, visionEnabled) || other.visionEnabled == visionEnabled)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.updatedByName, updatedByName) || other.updatedByName == updatedByName)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.apiKeyPresent, apiKeyPresent) || other.apiKeyPresent == apiKeyPresent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,provider,model,apiKey,baseUrl,temperature,topP,maxOutputTokens,maxDailyRequests,maxConcurrentRequests,maxConversationMessages,systemPrompt,visionEnabled,updatedBy,updatedByName,updatedAt,apiKeyPresent);

@override
String toString() {
  return 'AIAgentSetting(id: $id, schoolId: $schoolId, provider: $provider, model: $model, apiKey: $apiKey, baseUrl: $baseUrl, temperature: $temperature, topP: $topP, maxOutputTokens: $maxOutputTokens, maxDailyRequests: $maxDailyRequests, maxConcurrentRequests: $maxConcurrentRequests, maxConversationMessages: $maxConversationMessages, systemPrompt: $systemPrompt, visionEnabled: $visionEnabled, updatedBy: $updatedBy, updatedByName: $updatedByName, updatedAt: $updatedAt, apiKeyPresent: $apiKeyPresent)';
}


}

/// @nodoc
abstract mixin class $AIAgentSettingCopyWith<$Res>  {
  factory $AIAgentSettingCopyWith(AIAgentSetting value, $Res Function(AIAgentSetting) _then) = _$AIAgentSettingCopyWithImpl;
@useResult
$Res call({
 String id, String schoolId,@JsonKey(fromJson: AIProvider.fromString) AIProvider provider, String model, String apiKey, String baseUrl, double temperature, double topP, int maxOutputTokens, int maxDailyRequests, int maxConcurrentRequests, int maxConversationMessages, String systemPrompt, bool visionEnabled, String updatedBy, String updatedByName, DateTime updatedAt, bool apiKeyPresent
});




}
/// @nodoc
class _$AIAgentSettingCopyWithImpl<$Res>
    implements $AIAgentSettingCopyWith<$Res> {
  _$AIAgentSettingCopyWithImpl(this._self, this._then);

  final AIAgentSetting _self;
  final $Res Function(AIAgentSetting) _then;

/// Create a copy of AIAgentSetting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? provider = null,Object? model = null,Object? apiKey = null,Object? baseUrl = null,Object? temperature = null,Object? topP = null,Object? maxOutputTokens = null,Object? maxDailyRequests = null,Object? maxConcurrentRequests = null,Object? maxConversationMessages = null,Object? systemPrompt = null,Object? visionEnabled = null,Object? updatedBy = null,Object? updatedByName = null,Object? updatedAt = null,Object? apiKeyPresent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AIProvider,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,topP: null == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double,maxOutputTokens: null == maxOutputTokens ? _self.maxOutputTokens : maxOutputTokens // ignore: cast_nullable_to_non_nullable
as int,maxDailyRequests: null == maxDailyRequests ? _self.maxDailyRequests : maxDailyRequests // ignore: cast_nullable_to_non_nullable
as int,maxConcurrentRequests: null == maxConcurrentRequests ? _self.maxConcurrentRequests : maxConcurrentRequests // ignore: cast_nullable_to_non_nullable
as int,maxConversationMessages: null == maxConversationMessages ? _self.maxConversationMessages : maxConversationMessages // ignore: cast_nullable_to_non_nullable
as int,systemPrompt: null == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String,visionEnabled: null == visionEnabled ? _self.visionEnabled : visionEnabled // ignore: cast_nullable_to_non_nullable
as bool,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,updatedByName: null == updatedByName ? _self.updatedByName : updatedByName // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,apiKeyPresent: null == apiKeyPresent ? _self.apiKeyPresent : apiKeyPresent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AIAgentSetting].
extension AIAgentSettingPatterns on AIAgentSetting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AIAgentSetting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AIAgentSetting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AIAgentSetting value)  $default,){
final _that = this;
switch (_that) {
case _AIAgentSetting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AIAgentSetting value)?  $default,){
final _that = this;
switch (_that) {
case _AIAgentSetting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schoolId, @JsonKey(fromJson: AIProvider.fromString)  AIProvider provider,  String model,  String apiKey,  String baseUrl,  double temperature,  double topP,  int maxOutputTokens,  int maxDailyRequests,  int maxConcurrentRequests,  int maxConversationMessages,  String systemPrompt,  bool visionEnabled,  String updatedBy,  String updatedByName,  DateTime updatedAt,  bool apiKeyPresent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AIAgentSetting() when $default != null:
return $default(_that.id,_that.schoolId,_that.provider,_that.model,_that.apiKey,_that.baseUrl,_that.temperature,_that.topP,_that.maxOutputTokens,_that.maxDailyRequests,_that.maxConcurrentRequests,_that.maxConversationMessages,_that.systemPrompt,_that.visionEnabled,_that.updatedBy,_that.updatedByName,_that.updatedAt,_that.apiKeyPresent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schoolId, @JsonKey(fromJson: AIProvider.fromString)  AIProvider provider,  String model,  String apiKey,  String baseUrl,  double temperature,  double topP,  int maxOutputTokens,  int maxDailyRequests,  int maxConcurrentRequests,  int maxConversationMessages,  String systemPrompt,  bool visionEnabled,  String updatedBy,  String updatedByName,  DateTime updatedAt,  bool apiKeyPresent)  $default,) {final _that = this;
switch (_that) {
case _AIAgentSetting():
return $default(_that.id,_that.schoolId,_that.provider,_that.model,_that.apiKey,_that.baseUrl,_that.temperature,_that.topP,_that.maxOutputTokens,_that.maxDailyRequests,_that.maxConcurrentRequests,_that.maxConversationMessages,_that.systemPrompt,_that.visionEnabled,_that.updatedBy,_that.updatedByName,_that.updatedAt,_that.apiKeyPresent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schoolId, @JsonKey(fromJson: AIProvider.fromString)  AIProvider provider,  String model,  String apiKey,  String baseUrl,  double temperature,  double topP,  int maxOutputTokens,  int maxDailyRequests,  int maxConcurrentRequests,  int maxConversationMessages,  String systemPrompt,  bool visionEnabled,  String updatedBy,  String updatedByName,  DateTime updatedAt,  bool apiKeyPresent)?  $default,) {final _that = this;
switch (_that) {
case _AIAgentSetting() when $default != null:
return $default(_that.id,_that.schoolId,_that.provider,_that.model,_that.apiKey,_that.baseUrl,_that.temperature,_that.topP,_that.maxOutputTokens,_that.maxDailyRequests,_that.maxConcurrentRequests,_that.maxConversationMessages,_that.systemPrompt,_that.visionEnabled,_that.updatedBy,_that.updatedByName,_that.updatedAt,_that.apiKeyPresent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AIAgentSetting extends AIAgentSetting {
  const _AIAgentSetting({this.id = '', this.schoolId = '', @JsonKey(fromJson: AIProvider.fromString) required this.provider, this.model = '', this.apiKey = '', this.baseUrl = '', this.temperature = 0.7, this.topP = 0.9, this.maxOutputTokens = 2048, this.maxDailyRequests = 1000, this.maxConcurrentRequests = 10, this.maxConversationMessages = 50, this.systemPrompt = '', this.visionEnabled = false, this.updatedBy = '', this.updatedByName = '', required this.updatedAt, this.apiKeyPresent = false}): super._();
  factory _AIAgentSetting.fromJson(Map<String, dynamic> json) => _$AIAgentSettingFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String schoolId;
@override@JsonKey(fromJson: AIProvider.fromString) final  AIProvider provider;
@override@JsonKey() final  String model;
@override@JsonKey() final  String apiKey;
@override@JsonKey() final  String baseUrl;
@override@JsonKey() final  double temperature;
@override@JsonKey() final  double topP;
@override@JsonKey() final  int maxOutputTokens;
@override@JsonKey() final  int maxDailyRequests;
@override@JsonKey() final  int maxConcurrentRequests;
@override@JsonKey() final  int maxConversationMessages;
@override@JsonKey() final  String systemPrompt;
@override@JsonKey() final  bool visionEnabled;
@override@JsonKey() final  String updatedBy;
@override@JsonKey() final  String updatedByName;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool apiKeyPresent;

/// Create a copy of AIAgentSetting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AIAgentSettingCopyWith<_AIAgentSetting> get copyWith => __$AIAgentSettingCopyWithImpl<_AIAgentSetting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AIAgentSettingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AIAgentSetting&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.maxOutputTokens, maxOutputTokens) || other.maxOutputTokens == maxOutputTokens)&&(identical(other.maxDailyRequests, maxDailyRequests) || other.maxDailyRequests == maxDailyRequests)&&(identical(other.maxConcurrentRequests, maxConcurrentRequests) || other.maxConcurrentRequests == maxConcurrentRequests)&&(identical(other.maxConversationMessages, maxConversationMessages) || other.maxConversationMessages == maxConversationMessages)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt)&&(identical(other.visionEnabled, visionEnabled) || other.visionEnabled == visionEnabled)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.updatedByName, updatedByName) || other.updatedByName == updatedByName)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.apiKeyPresent, apiKeyPresent) || other.apiKeyPresent == apiKeyPresent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,provider,model,apiKey,baseUrl,temperature,topP,maxOutputTokens,maxDailyRequests,maxConcurrentRequests,maxConversationMessages,systemPrompt,visionEnabled,updatedBy,updatedByName,updatedAt,apiKeyPresent);

@override
String toString() {
  return 'AIAgentSetting(id: $id, schoolId: $schoolId, provider: $provider, model: $model, apiKey: $apiKey, baseUrl: $baseUrl, temperature: $temperature, topP: $topP, maxOutputTokens: $maxOutputTokens, maxDailyRequests: $maxDailyRequests, maxConcurrentRequests: $maxConcurrentRequests, maxConversationMessages: $maxConversationMessages, systemPrompt: $systemPrompt, visionEnabled: $visionEnabled, updatedBy: $updatedBy, updatedByName: $updatedByName, updatedAt: $updatedAt, apiKeyPresent: $apiKeyPresent)';
}


}

/// @nodoc
abstract mixin class _$AIAgentSettingCopyWith<$Res> implements $AIAgentSettingCopyWith<$Res> {
  factory _$AIAgentSettingCopyWith(_AIAgentSetting value, $Res Function(_AIAgentSetting) _then) = __$AIAgentSettingCopyWithImpl;
@override @useResult
$Res call({
 String id, String schoolId,@JsonKey(fromJson: AIProvider.fromString) AIProvider provider, String model, String apiKey, String baseUrl, double temperature, double topP, int maxOutputTokens, int maxDailyRequests, int maxConcurrentRequests, int maxConversationMessages, String systemPrompt, bool visionEnabled, String updatedBy, String updatedByName, DateTime updatedAt, bool apiKeyPresent
});




}
/// @nodoc
class __$AIAgentSettingCopyWithImpl<$Res>
    implements _$AIAgentSettingCopyWith<$Res> {
  __$AIAgentSettingCopyWithImpl(this._self, this._then);

  final _AIAgentSetting _self;
  final $Res Function(_AIAgentSetting) _then;

/// Create a copy of AIAgentSetting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? provider = null,Object? model = null,Object? apiKey = null,Object? baseUrl = null,Object? temperature = null,Object? topP = null,Object? maxOutputTokens = null,Object? maxDailyRequests = null,Object? maxConcurrentRequests = null,Object? maxConversationMessages = null,Object? systemPrompt = null,Object? visionEnabled = null,Object? updatedBy = null,Object? updatedByName = null,Object? updatedAt = null,Object? apiKeyPresent = null,}) {
  return _then(_AIAgentSetting(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AIProvider,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,topP: null == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double,maxOutputTokens: null == maxOutputTokens ? _self.maxOutputTokens : maxOutputTokens // ignore: cast_nullable_to_non_nullable
as int,maxDailyRequests: null == maxDailyRequests ? _self.maxDailyRequests : maxDailyRequests // ignore: cast_nullable_to_non_nullable
as int,maxConcurrentRequests: null == maxConcurrentRequests ? _self.maxConcurrentRequests : maxConcurrentRequests // ignore: cast_nullable_to_non_nullable
as int,maxConversationMessages: null == maxConversationMessages ? _self.maxConversationMessages : maxConversationMessages // ignore: cast_nullable_to_non_nullable
as int,systemPrompt: null == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String,visionEnabled: null == visionEnabled ? _self.visionEnabled : visionEnabled // ignore: cast_nullable_to_non_nullable
as bool,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,updatedByName: null == updatedByName ? _self.updatedByName : updatedByName // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,apiKeyPresent: null == apiKeyPresent ? _self.apiKeyPresent : apiKeyPresent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
