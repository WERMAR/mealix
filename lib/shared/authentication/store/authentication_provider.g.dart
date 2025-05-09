// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerHash() => r'2b416a6632d7462ffc0925492b7196527ec7a6a8';

/// See also [register].
@ProviderFor(register)
final registerProvider = AutoDisposeFutureProvider<User>.internal(
  register,
  name: r'registerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$registerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RegisterRef = AutoDisposeFutureProviderRef<User>;
String _$authenticationStoreHash() =>
    r'0597e76e942ee6d7b0d5ac21b45507aa19bd004e';

/// See also [AuthenticationStore].
@ProviderFor(AuthenticationStore)
final authenticationStoreProvider = AutoDisposeAsyncNotifierProvider<
  AuthenticationStore,
  AuthenticationState
>.internal(
  AuthenticationStore.new,
  name: r'authenticationStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authenticationStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationStore = AutoDisposeAsyncNotifier<AuthenticationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
