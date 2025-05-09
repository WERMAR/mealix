// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationState {

 bool get isAuthenticated; AuthenticationMode get activeMode; User? get user; AuthenticationFormInput get formInput;
/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationStateCopyWith<AuthenticationState> get copyWith => _$AuthenticationStateCopyWithImpl<AuthenticationState>(this as AuthenticationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationState&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.activeMode, activeMode) || other.activeMode == activeMode)&&(identical(other.user, user) || other.user == user)&&(identical(other.formInput, formInput) || other.formInput == formInput));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthenticated,activeMode,user,formInput);

@override
String toString() {
  return 'AuthenticationState(isAuthenticated: $isAuthenticated, activeMode: $activeMode, user: $user, formInput: $formInput)';
}


}

/// @nodoc
abstract mixin class $AuthenticationStateCopyWith<$Res>  {
  factory $AuthenticationStateCopyWith(AuthenticationState value, $Res Function(AuthenticationState) _then) = _$AuthenticationStateCopyWithImpl;
@useResult
$Res call({
 bool isAuthenticated, AuthenticationMode activeMode, User? user, AuthenticationFormInput formInput
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._self, this._then);

  final AuthenticationState _self;
  final $Res Function(AuthenticationState) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAuthenticated = null,Object? activeMode = null,Object? user = freezed,Object? formInput = null,}) {
  return _then(_self.copyWith(
isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,activeMode: null == activeMode ? _self.activeMode : activeMode // ignore: cast_nullable_to_non_nullable
as AuthenticationMode,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,formInput: null == formInput ? _self.formInput : formInput // ignore: cast_nullable_to_non_nullable
as AuthenticationFormInput,
  ));
}
/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc


class _AuthenticationState implements AuthenticationState {
   _AuthenticationState({required this.isAuthenticated, required this.activeMode, this.user, required this.formInput});
  

@override final  bool isAuthenticated;
@override final  AuthenticationMode activeMode;
@override final  User? user;
@override final  AuthenticationFormInput formInput;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticationStateCopyWith<_AuthenticationState> get copyWith => __$AuthenticationStateCopyWithImpl<_AuthenticationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticationState&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.activeMode, activeMode) || other.activeMode == activeMode)&&(identical(other.user, user) || other.user == user)&&(identical(other.formInput, formInput) || other.formInput == formInput));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthenticated,activeMode,user,formInput);

@override
String toString() {
  return 'AuthenticationState(isAuthenticated: $isAuthenticated, activeMode: $activeMode, user: $user, formInput: $formInput)';
}


}

/// @nodoc
abstract mixin class _$AuthenticationStateCopyWith<$Res> implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthenticationStateCopyWith(_AuthenticationState value, $Res Function(_AuthenticationState) _then) = __$AuthenticationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAuthenticated, AuthenticationMode activeMode, User? user, AuthenticationFormInput formInput
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthenticationStateCopyWithImpl<$Res>
    implements _$AuthenticationStateCopyWith<$Res> {
  __$AuthenticationStateCopyWithImpl(this._self, this._then);

  final _AuthenticationState _self;
  final $Res Function(_AuthenticationState) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAuthenticated = null,Object? activeMode = null,Object? user = freezed,Object? formInput = null,}) {
  return _then(_AuthenticationState(
isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,activeMode: null == activeMode ? _self.activeMode : activeMode // ignore: cast_nullable_to_non_nullable
as AuthenticationMode,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,formInput: null == formInput ? _self.formInput : formInput // ignore: cast_nullable_to_non_nullable
as AuthenticationFormInput,
  ));
}

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
