import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // Ensure this is imported

import '../../../helper/input_validation.dart';
import '../../../shared/model/cooking_step_model.dart';
import '../../../shared/model/ingredient_model.dart';
import '../../../shared/model/recipe_model.dart'; // Make sure RecipeModel is correctly imported
import 'model/spoonacular_recipe_models.dart';

part 'recipes_provider.freezed.dart';
part 'recipes_provider.g.dart';

const String spoonBaseURL =
    '/recipes/complexSearch?query=vegetarian&apiKey=66c68ca189af494ea20ed04ee3e38f76';

@riverpod
Future<List<RecipeModel>> firebaseRecipes(Ref ref) async {
  final now = Timestamp.now();
  final thirtyDaysAgo = Timestamp.fromDate(
    DateTime.now().subtract(const Duration(days: 30)),
  );

  final snapshot =
  await FirebaseFirestore.instance
      .collection('recipes')
      .orderBy('createdAt', descending: true)
      .limit(10)
      .get();

  final recipes =
  snapshot.docs.map((doc) => RecipeModel.fromFirestore(doc, null)).toList();
  return recipes;
}

// NEW PROVIDER: To fetch a single recipe by its ID
@riverpod
Future<RecipeModel?> recipeDetails(Ref ref, String id) async {
  final docSnapshot = await FirebaseFirestore.instance
      .collection('recipes')
      .doc(id) // Directly fetches the document by its ID
      .get();

  if (docSnapshot.exists) {
    return RecipeModel.fromFirestore(docSnapshot, null);
  }

  // If the recipe is not found in Firebase, you could add logic here
  // to fetch it from Spoonacular's detail API if needed for other recipe types.
  // For now, based on your current setup, it primarily serves Firebase recipes.
  return null; // Return null if recipe is not found
}


@riverpod
Future<SpoonRecipeListDto> spoonacularRecipes(Ref ref) async {
  /* final response = await http.get(
    Uri.https('api.spoonacular.com', '/recipes/complexSearch', {
      'query': RecipeWordGenerator.getRandomWord(),
      'apiKey': '66c68ca189af494ea20ed04ee3e38f76',
    }),
  );*/
  await Future.delayed(const Duration(seconds: 2));
  const response = '''
{
  "results": [
   {
    "id": 651994,
    "title": "Miniature Fruit Tarts",
    "image": "https://img.spoonacular.com/recipes/651994-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 665767,
    "title": "Zucchini Pineapple Muffins",
    "image": "https://img.spoonacular.com/recipes/665767-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 653886,
    "title": "Orange Honey Madeleines",
    "image": "https://img.spoonacular.com/recipes/653886-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 636177,
    "title": "Broccoli Cheddar Soup",
    "image": "https://img.spoonacular.com/recipes/636177-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 642264,
    "title": "Eggless Ginger & Mango Bread",
    "image": "https://img.spoonacular.com/recipes/642264-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 650744,
    "title": "Mango & Goat Cheese Quesadillas",
    "image": "https://img.spoonacular.com/recipes/650744-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 644627,
    "title": "Ginger Sesame Dressing",
    "image": "https://img.spoonacular.com/recipes/644627-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 660108,
    "title": "Simple Kale Salad",
    "image": "https://img.spoonacular.com/recipes/660108-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 648715,
    "title": "Kale Bruschetta",
    "image": "https://img.spoonacular.com/recipes/648715-312x231.jpg",
    "imageType": "jpg"
   },
   {
    "id": 658522,
    "title": "Roasted Butternut Squash Bisque",
    "image": "https://img.spoonacular.com/recipes/658522-312x231.jpg",
    "imageType": "jpg"
   }
  ],
  "offset": 0,
  "number": 10,
  "totalResults": 2186
}''';

  //  if (response.statusCode == 200) {
  return SpoonRecipeListDto.fromJson(
    jsonDecode(response) as Map<String, dynamic>,
  );
  /* } else {
    throw Exception('Failed to load recipes');
  }*/
}

@freezed
sealed class RecipeSearchState with _$RecipeSearchState {
  const factory RecipeSearchState({
    required String query,
    required List<RecipeModel> recipes,
  }) = _RecipeSearchState;

  factory RecipeSearchState.initial() =>
      const RecipeSearchState(query: '', recipes: []);
}

@riverpod
class SearchQuery extends _$SearchQuery {
  Timer? _debounce;

  @override
  Future<RecipeSearchState> build() async {
    return Future.value(RecipeSearchState.initial());
  }

  Future<void> setSearchQuery(String query) async {
    state = AsyncData(
      state.valueOrNull?.copyWith(query: query) ?? RecipeSearchState.initial(),
    );
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (query.isEmpty) {
        state = AsyncData(RecipeSearchState.initial());
      } else {
        await _performSearch(state.valueOrNull?.query ?? '');
      }
    });
  }

  Future<void> _performSearch(String query) async {
    state = const AsyncLoading();
    final response =
        await FirebaseFirestore.instance
            .collection('recipes')
            .orderBy('title')
            .startAt([query])
            .endAt(['$query\uf8ff'])
            .get();

    if (response.docs.isEmpty) {
      return Future.value([]);
    }

    final currState = state.valueOrNull;
    if (currState == null) {
      return Future.value();
    }
    state = AsyncData(
      currState.copyWith(
        query: query,
        recipes:
            response.docs
                .map((doc) => RecipeModel.fromFirestore(doc, null))
                .toList(),
      ),
    );
  }
}

@freezed
sealed class CreateRecipeState with _$CreateRecipeState {
  const factory CreateRecipeState({
    required String title,
    required String onlineLink,
    required String description,
    required String imageUrl,
    required bool isTwoDayMeal,
    required List<CookingStep> cookingSteps,
    required List<Ingredient> ingredients,
  }) = _CreateRecipeState;

  factory CreateRecipeState.initial() => const CreateRecipeState(
    title: '',
    onlineLink: '',
    description: '',
    imageUrl: '',
    isTwoDayMeal: false,
    cookingSteps: [],
    ingredients: [],
  );
}

@riverpod
class CreateRecipeStore extends _$CreateRecipeStore {
  @override
  CreateRecipeState build() {
    return CreateRecipeState.initial();
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setOnlineLink(String onlineLink) {
    state = state.copyWith(onlineLink: onlineLink);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setImageUrl(String imageUrl) {
    state = state.copyWith(imageUrl: imageUrl);
  }

  void setIsTwoDayMeal({required bool isTwoDayMeal}) {
    state = state.copyWith(isTwoDayMeal: isTwoDayMeal);
  }

  void addCookingStep() {
    state = state.copyWith(
      cookingSteps: [...state.cookingSteps, CookingStep.initial()],
    );
  }

  void removeCookingStep(int index) {
    state = state.copyWith(
      cookingSteps: [
        ...state.cookingSteps.sublist(0, index),
        ...state.cookingSteps.sublist(index + 1),
      ],
    );
  }

  void addIngredientsPerPortion() {
    state = state.copyWith(
      ingredients: [...state.ingredients, Ingredient.initial()],
    );
  }

  void removeIngredientsPerPortion(int index) {
    state = state.copyWith(
      ingredients: [
        ...state.ingredients.sublist(0, index),
        ...state.ingredients.sublist(index + 1),
      ],
    );
  }

  void updateDescriptionOfStep(int index, String newDescription) {
    final updated = state.cookingSteps[index].copyWith(
      description: newDescription,
    );
    final updatedList = List.of(state.cookingSteps)..[index] = updated;

    state = state.copyWith(cookingSteps: updatedList);
  }

  void updateDurationOfStep(int index, String newDuration) {
    final updated = state.cookingSteps[index].copyWith(
      duration: int.tryParse(newDuration) ?? 0,
    );
    final updatedList = List.of(state.cookingSteps)..[index] = updated;

    state = state.copyWith(cookingSteps: updatedList);
  }

  void updateGroceryListGroup(int index, GroceryListGroup firstWhere) {
    final updated = state.ingredients[index].copyWith(
      groceryListGroup: firstWhere,
    );
    final updatedList = List.of(state.ingredients)..[index] = updated;

    state = state.copyWith(ingredients: updatedList);
  }

  void updateIngredientName(int index, String name) {
    final updated = state.ingredients[index].copyWith(name: name);
    final updatedList = List.of(state.ingredients)..[index] = updated;

    state = state.copyWith(ingredients: updatedList);
  }

  createRecipe() async {
    final db = FirebaseFirestore.instance;
    await db
        .collection('recipes')
        .doc(state.title)
        .withConverter(
      fromFirestore: RecipeModel.fromFirestore,
      toFirestore: (recipe, options) => recipe.toFirestore(),
    )
        .set(RecipeModel.fromState(state))
        .onError((e, _) => print('Error writing document: $e'));
  }
}

@riverpod
List<FieldValidationResult> isCreateRecipeFormValid(Ref ref) {
  final createRecipeState = ref.watch(createRecipeStoreProvider);

  final validationResults = <FieldValidationResult>[];

  validationResults.add(
    FieldValidationResult.fromString(
      'title',
      InputValidation.validateRequired(createRecipeState.title),
    ),
  );

  validationResults.add(
    FieldValidationResult.fromString(
      'onlineLink',
      InputValidation.validateInternetLink(createRecipeState.onlineLink),
    ),
  );

  validationResults.add(
    FieldValidationResult.fromString(
      'imageUrl',
      InputValidation.validateInternetLink(createRecipeState.imageUrl),
    ),
  );

  validationResults.add(
    FieldValidationResult.fromString(
      'description',
      InputValidation.validateRequired(createRecipeState.description),
    ),
  );
  return validationResults;
}

@freezed
sealed class FieldValidationResult with _$FieldValidationResult {
  const factory FieldValidationResult({
    required String fieldName,
    required bool isValid,
    required String errorMessage,
  }) = _FieldValidationResult;

  factory FieldValidationResult.valid(String fieldName) {
    return FieldValidationResult(
      fieldName: fieldName,
      isValid: true,
      errorMessage: '',
    );
  }

  factory FieldValidationResult.invalid(String fieldName, String errorMessage) {
    return FieldValidationResult(
      fieldName: fieldName,
      isValid: false,
      errorMessage: errorMessage,
    );
  }

  factory FieldValidationResult.fromString(
      String fieldName,
      String? validationResult,
      ) {
    return validationResult == null
        ? FieldValidationResult.valid(fieldName)
        : FieldValidationResult.invalid(fieldName, validationResult);
  }
}