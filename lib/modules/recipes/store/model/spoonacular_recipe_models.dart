class SpoonRecipeItemDto {
  SpoonRecipeItemDto({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory SpoonRecipeItemDto.fromJson(Map<String, dynamic> json) {
    return SpoonRecipeItemDto(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['image'] as String,
    );
  }
  final int id;
  final String title;
  final String imageUrl;
}

class SpoonRecipeListDto {
  SpoonRecipeListDto({required this.results});

  factory SpoonRecipeListDto.fromJson(Map<String, dynamic> json) {
    return SpoonRecipeListDto(
      results:
          (json['results'] as List<dynamic>)
              .map(
                (e) => SpoonRecipeItemDto.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final List<SpoonRecipeItemDto> results;
}
