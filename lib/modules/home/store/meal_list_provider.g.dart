// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealListStoreHash() => r'6889ce295d95b57727b34b8dea48f0cc099c479d';

/// See also [MealListStore].
@ProviderFor(MealListStore)
final mealListStoreProvider =
    AutoDisposeAsyncNotifierProvider<MealListStore, MealListState>.internal(
      MealListStore.new,
      name: r'mealListStoreProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$mealListStoreHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MealListStore = AutoDisposeAsyncNotifier<MealListState>;
String _$createMealListStoreHash() =>
    r'ac96a4c9e2996605fc905f5b949cff73950725c9';

/// See also [CreateMealListStore].
@ProviderFor(CreateMealListStore)
final createMealListStoreProvider = AutoDisposeNotifierProvider<
  CreateMealListStore,
  CreateMealListState
>.internal(
  CreateMealListStore.new,
  name: r'createMealListStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$createMealListStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateMealListStore = AutoDisposeNotifier<CreateMealListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
