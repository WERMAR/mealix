class RecipeModel {
  const RecipeModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.twoDayMeal,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: json['duration'] as int,
      twoDayMeal: json['twoDayMeal'] as bool,
    );
  }

  final String id;
  final String name;
  final int duration;
  final bool twoDayMeal;
}
