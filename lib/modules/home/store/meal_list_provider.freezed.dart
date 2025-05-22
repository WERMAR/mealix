// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealListState {

 bool get creationMode; List<Meal> get initialList; List<Meal> get adjustedList;
/// Create a copy of MealListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealListStateCopyWith<MealListState> get copyWith => _$MealListStateCopyWithImpl<MealListState>(this as MealListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealListState&&(identical(other.creationMode, creationMode) || other.creationMode == creationMode)&&const DeepCollectionEquality().equals(other.initialList, initialList)&&const DeepCollectionEquality().equals(other.adjustedList, adjustedList));
}


@override
int get hashCode => Object.hash(runtimeType,creationMode,const DeepCollectionEquality().hash(initialList),const DeepCollectionEquality().hash(adjustedList));

@override
String toString() {
  return 'MealListState(creationMode: $creationMode, initialList: $initialList, adjustedList: $adjustedList)';
}


}

/// @nodoc
abstract mixin class $MealListStateCopyWith<$Res>  {
  factory $MealListStateCopyWith(MealListState value, $Res Function(MealListState) _then) = _$MealListStateCopyWithImpl;
@useResult
$Res call({
 bool creationMode, List<Meal> initialList, List<Meal> adjustedList
});




}
/// @nodoc
class _$MealListStateCopyWithImpl<$Res>
    implements $MealListStateCopyWith<$Res> {
  _$MealListStateCopyWithImpl(this._self, this._then);

  final MealListState _self;
  final $Res Function(MealListState) _then;

/// Create a copy of MealListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creationMode = null,Object? initialList = null,Object? adjustedList = null,}) {
  return _then(_self.copyWith(
creationMode: null == creationMode ? _self.creationMode : creationMode // ignore: cast_nullable_to_non_nullable
as bool,initialList: null == initialList ? _self.initialList : initialList // ignore: cast_nullable_to_non_nullable
as List<Meal>,adjustedList: null == adjustedList ? _self.adjustedList : adjustedList // ignore: cast_nullable_to_non_nullable
as List<Meal>,
  ));
}

}


/// @nodoc


class _MealListState implements MealListState {
  const _MealListState({this.creationMode = false, final  List<Meal> initialList = const [], final  List<Meal> adjustedList = const []}): _initialList = initialList,_adjustedList = adjustedList;
  

@override@JsonKey() final  bool creationMode;
 final  List<Meal> _initialList;
@override@JsonKey() List<Meal> get initialList {
  if (_initialList is EqualUnmodifiableListView) return _initialList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_initialList);
}

 final  List<Meal> _adjustedList;
@override@JsonKey() List<Meal> get adjustedList {
  if (_adjustedList is EqualUnmodifiableListView) return _adjustedList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adjustedList);
}


/// Create a copy of MealListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealListStateCopyWith<_MealListState> get copyWith => __$MealListStateCopyWithImpl<_MealListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealListState&&(identical(other.creationMode, creationMode) || other.creationMode == creationMode)&&const DeepCollectionEquality().equals(other._initialList, _initialList)&&const DeepCollectionEquality().equals(other._adjustedList, _adjustedList));
}


@override
int get hashCode => Object.hash(runtimeType,creationMode,const DeepCollectionEquality().hash(_initialList),const DeepCollectionEquality().hash(_adjustedList));

@override
String toString() {
  return 'MealListState(creationMode: $creationMode, initialList: $initialList, adjustedList: $adjustedList)';
}


}

/// @nodoc
abstract mixin class _$MealListStateCopyWith<$Res> implements $MealListStateCopyWith<$Res> {
  factory _$MealListStateCopyWith(_MealListState value, $Res Function(_MealListState) _then) = __$MealListStateCopyWithImpl;
@override @useResult
$Res call({
 bool creationMode, List<Meal> initialList, List<Meal> adjustedList
});




}
/// @nodoc
class __$MealListStateCopyWithImpl<$Res>
    implements _$MealListStateCopyWith<$Res> {
  __$MealListStateCopyWithImpl(this._self, this._then);

  final _MealListState _self;
  final $Res Function(_MealListState) _then;

/// Create a copy of MealListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creationMode = null,Object? initialList = null,Object? adjustedList = null,}) {
  return _then(_MealListState(
creationMode: null == creationMode ? _self.creationMode : creationMode // ignore: cast_nullable_to_non_nullable
as bool,initialList: null == initialList ? _self._initialList : initialList // ignore: cast_nullable_to_non_nullable
as List<Meal>,adjustedList: null == adjustedList ? _self._adjustedList : adjustedList // ignore: cast_nullable_to_non_nullable
as List<Meal>,
  ));
}


}

/// @nodoc
mixin _$CreateMealListState {

 List<Meal> get createMealList; double get progress;
/// Create a copy of CreateMealListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMealListStateCopyWith<CreateMealListState> get copyWith => _$CreateMealListStateCopyWithImpl<CreateMealListState>(this as CreateMealListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMealListState&&const DeepCollectionEquality().equals(other.createMealList, createMealList)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createMealList),progress);

@override
String toString() {
  return 'CreateMealListState(createMealList: $createMealList, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $CreateMealListStateCopyWith<$Res>  {
  factory $CreateMealListStateCopyWith(CreateMealListState value, $Res Function(CreateMealListState) _then) = _$CreateMealListStateCopyWithImpl;
@useResult
$Res call({
 List<Meal> createMealList, double progress
});




}
/// @nodoc
class _$CreateMealListStateCopyWithImpl<$Res>
    implements $CreateMealListStateCopyWith<$Res> {
  _$CreateMealListStateCopyWithImpl(this._self, this._then);

  final CreateMealListState _self;
  final $Res Function(CreateMealListState) _then;

/// Create a copy of CreateMealListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createMealList = null,Object? progress = null,}) {
  return _then(_self.copyWith(
createMealList: null == createMealList ? _self.createMealList : createMealList // ignore: cast_nullable_to_non_nullable
as List<Meal>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _CreateMealListState implements CreateMealListState {
  const _CreateMealListState({final  List<Meal> createMealList = const [], this.progress = 0}): _createMealList = createMealList;
  

 final  List<Meal> _createMealList;
@override@JsonKey() List<Meal> get createMealList {
  if (_createMealList is EqualUnmodifiableListView) return _createMealList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_createMealList);
}

@override@JsonKey() final  double progress;

/// Create a copy of CreateMealListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMealListStateCopyWith<_CreateMealListState> get copyWith => __$CreateMealListStateCopyWithImpl<_CreateMealListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMealListState&&const DeepCollectionEquality().equals(other._createMealList, _createMealList)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_createMealList),progress);

@override
String toString() {
  return 'CreateMealListState(createMealList: $createMealList, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$CreateMealListStateCopyWith<$Res> implements $CreateMealListStateCopyWith<$Res> {
  factory _$CreateMealListStateCopyWith(_CreateMealListState value, $Res Function(_CreateMealListState) _then) = __$CreateMealListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Meal> createMealList, double progress
});




}
/// @nodoc
class __$CreateMealListStateCopyWithImpl<$Res>
    implements _$CreateMealListStateCopyWith<$Res> {
  __$CreateMealListStateCopyWithImpl(this._self, this._then);

  final _CreateMealListState _self;
  final $Res Function(_CreateMealListState) _then;

/// Create a copy of CreateMealListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createMealList = null,Object? progress = null,}) {
  return _then(_CreateMealListState(
createMealList: null == createMealList ? _self._createMealList : createMealList // ignore: cast_nullable_to_non_nullable
as List<Meal>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
