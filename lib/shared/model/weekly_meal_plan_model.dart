import 'recipe_model.dart';

class WeeklyMealPlan {
  WeeklyMealPlan({
    required this.id,
    required this.start,
    required this.end,
    required this.recipes,
  });

  final String id;
  final DateTime start;
  final DateTime end;
  final List<RecipeModel> recipes;

  WeeklyMealPlan fromJson(Map<String, dynamic> json) {
    final recipes = json['recipes'] as List<Map<String, dynamic>>;

    return WeeklyMealPlan(
      id: json['id'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      recipes: recipes.map<RecipeModel>(RecipeModel.fromJson).toList(),
    );
  }
}
