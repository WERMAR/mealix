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
String _$recipeDetailsHash() => r'51195d936f17ab89a73bf5d40b2e00078c3df335';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [recipeDetails].
@ProviderFor(recipeDetails)
const recipeDetailsProvider = RecipeDetailsFamily();

/// See also [recipeDetails].
class RecipeDetailsFamily extends Family<AsyncValue<RecipeModel?>> {
  /// See also [recipeDetails].
  const RecipeDetailsFamily();

  /// See also [recipeDetails].
  RecipeDetailsProvider call(String id) {
    return RecipeDetailsProvider(id);
  }

  @override
  RecipeDetailsProvider getProviderOverride(
    covariant RecipeDetailsProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeDetailsProvider';
}

/// See also [recipeDetails].
class RecipeDetailsProvider extends AutoDisposeFutureProvider<RecipeModel?> {
  /// See also [recipeDetails].
  RecipeDetailsProvider(String id)
    : this._internal(
        (ref) => recipeDetails(ref as RecipeDetailsRef, id),
        from: recipeDetailsProvider,
        name: r'recipeDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$recipeDetailsHash,
        dependencies: RecipeDetailsFamily._dependencies,
        allTransitiveDependencies:
            RecipeDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  RecipeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<RecipeModel?> Function(RecipeDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeDetailsProvider._internal(
        (ref) => create(ref as RecipeDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RecipeModel?> createElement() {
    return _RecipeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDetailsRef on AutoDisposeFutureProviderRef<RecipeModel?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _RecipeDetailsProviderElement
    extends AutoDisposeFutureProviderElement<RecipeModel?>
    with RecipeDetailsRef {
  _RecipeDetailsProviderElement(super.provider);

  @override
  String get id => (origin as RecipeDetailsProvider).id;
}

String _$spoonacularRecipesHash() =>
    r'2b27593ac6aab4f135db332bc3edf6ecd6f6c200';

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
String _$searchQueryHash() => r'b4da5d0b4bb6155a81160a7e6677aaf67478fcd5';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeAsyncNotifierProvider<SearchQuery, RecipeSearchState>.internal(
      SearchQuery.new,
      name: r'searchQueryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$searchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchQuery = AutoDisposeAsyncNotifier<RecipeSearchState>;
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
