// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealListStoreHash() => r'f77dc8312f0aedaf4bb08e27b6e4007584600c6a';

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
    r'a03d7de49b540833b6c74471f4f3087f9e90de3b';

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
