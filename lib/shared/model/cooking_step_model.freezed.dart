// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CookingStep {

 String get id; String get description; int get duration;
/// Create a copy of CookingStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookingStepCopyWith<CookingStep> get copyWith => _$CookingStepCopyWithImpl<CookingStep>(this as CookingStep, _$identity);

  /// Serializes this CookingStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookingStep&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,duration);

@override
String toString() {
  return 'CookingStep(id: $id, description: $description, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $CookingStepCopyWith<$Res>  {
  factory $CookingStepCopyWith(CookingStep value, $Res Function(CookingStep) _then) = _$CookingStepCopyWithImpl;
@useResult
$Res call({
 String id, String description, int duration
});




}
/// @nodoc
class _$CookingStepCopyWithImpl<$Res>
    implements $CookingStepCopyWith<$Res> {
  _$CookingStepCopyWithImpl(this._self, this._then);

  final CookingStep _self;
  final $Res Function(CookingStep) _then;

/// Create a copy of CookingStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CookingStep implements CookingStep {
  const _CookingStep({required this.id, required this.description, required this.duration});
  factory _CookingStep.fromJson(Map<String, dynamic> json) => _$CookingStepFromJson(json);

@override final  String id;
@override final  String description;
@override final  int duration;

/// Create a copy of CookingStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookingStepCopyWith<_CookingStep> get copyWith => __$CookingStepCopyWithImpl<_CookingStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CookingStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookingStep&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,duration);

@override
String toString() {
  return 'CookingStep(id: $id, description: $description, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$CookingStepCopyWith<$Res> implements $CookingStepCopyWith<$Res> {
  factory _$CookingStepCopyWith(_CookingStep value, $Res Function(_CookingStep) _then) = __$CookingStepCopyWithImpl;
@override @useResult
$Res call({
 String id, String description, int duration
});




}
/// @nodoc
class __$CookingStepCopyWithImpl<$Res>
    implements _$CookingStepCopyWith<$Res> {
  __$CookingStepCopyWithImpl(this._self, this._then);

  final _CookingStep _self;
  final $Res Function(_CookingStep) _then;

/// Create a copy of CookingStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? duration = null,}) {
  return _then(_CookingStep(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
