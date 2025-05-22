// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListStoreHash() => r'01dbb2d6f0c14ccac495a1ece90d19cfd53d53df';

/// Provider that flattens and deduplicates ingredients from the meal list
///
/// Copied from [ShoppingListStore].
@ProviderFor(ShoppingListStore)
final shoppingListStoreProvider =
    AutoDisposeAsyncNotifierProvider<ShoppingListStore, ShoppingList>.internal(
      ShoppingListStore.new,
      name: r'shoppingListStoreProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$shoppingListStoreHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ShoppingListStore = AutoDisposeAsyncNotifier<ShoppingList>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
