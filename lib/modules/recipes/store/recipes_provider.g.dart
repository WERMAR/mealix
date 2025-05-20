// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseRecipesHash() => r'80a5ba5cbb532e2b806c59b9820a0cc57efb149b';

/// See also [firebaseRecipes].
@ProviderFor(firebaseRecipes)
final firebaseRecipesProvider =
    AutoDisposeFutureProvider<List<RecipeModel>>.internal(
      firebaseRecipes,
      name: r'firebaseRecipesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$firebaseRecipesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseRecipesRef = AutoDisposeFutureProviderRef<List<RecipeModel>>;
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
String _$isCreateRecipeFormValidHash() =>
    r'9ce416fd29c780c974983e534d0d644c0561a0ad';

/// See also [isCreateRecipeFormValid].
@ProviderFor(isCreateRecipeFormValid)
final isCreateRecipeFormValidProvider =
    AutoDisposeProvider<List<FieldValidationResult>>.internal(
      isCreateRecipeFormValid,
      name: r'isCreateRecipeFormValidProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$isCreateRecipeFormValidHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsCreateRecipeFormValidRef =
    AutoDisposeProviderRef<List<FieldValidationResult>>;
String _$createRecipeStoreHash() => r'a2473f06ba30615a82f319b6a18671b75982cd4a';

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
