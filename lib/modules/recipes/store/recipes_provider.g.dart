// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spoonacularRecipesHash() =>
    r'fa329d9fc389018717a219d6e3ae0c81e2033a5f';

/// See also [spoonacularRecipes].
@ProviderFor(spoonacularRecipes)
final spoonacularRecipesProvider =
    AutoDisposeFutureProvider<SpoonRecipeListDto>.internal(
      spoonacularRecipes,
      name: r'spoonacularRecipesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$spoonacularRecipesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SpoonacularRecipesRef =
    AutoDisposeFutureProviderRef<SpoonRecipeListDto>;
String _$createRecipeStoreHash() => r'ec2aae3f56fd1de6e6dc9982b17b9991a4e5be2c';

/// See also [CreateRecipeStore].
@ProviderFor(CreateRecipeStore)
final createRecipeStoreProvider =
    AutoDisposeNotifierProvider<CreateRecipeStore, CreateRecipeState>.internal(
      CreateRecipeStore.new,
      name: r'createRecipeStoreProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createRecipeStoreHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateRecipeStore = AutoDisposeNotifier<CreateRecipeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
