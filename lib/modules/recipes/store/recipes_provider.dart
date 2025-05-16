import 'dart:convert';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/model/ingredient_model.dart';
import 'model/spoonacular_recipe_models.dart';

part 'recipes_provider.g.dart';
part 'recipes_provider.freezed.dart';

const String spoonBaseURL =
    '/recipes/complexSearch?query=vegetarian&apiKey=66c68ca189af494ea20ed04ee3e38f76';

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

// TODO: Implement same getter for fetch last used recipes from firebase

@freezed
sealed class CreateRecipeState with _$CreateRecipeState {
  const factory CreateRecipeState({
    required String title,
    required String onlineLink,
    required String description,
    required String imageUrl,
    required bool isLoading,
    required List<String> cookingSteps,
    required List<Ingredient> ingredients,
  }) = _CreateRecipeState;

  factory CreateRecipeState.initial() => const CreateRecipeState(
    title: '',
    onlineLink: '',
    description: '',
    imageUrl: '',
    isLoading: false,
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

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
