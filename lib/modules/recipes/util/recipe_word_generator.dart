import 'dart:math';

enum WordCategory { diet, mealType, method, cuisine }

final Map<WordCategory, List<String>> wordBank = {
  WordCategory.diet: [
    'vegan',
    'vegetarian',
    'gluten-free',
    'dairy-free',
    'keto',
    'paleo',
    'low-carb',
    'low-fat',
    'high-protein',
    'sugar-free',
    'whole30',
    'halal',
    'kosher',
  ],

  WordCategory.mealType: [
    'breakfast',
    'brunch',
    'lunch',
    'dinner',
    'snack',
    'dessert',
    'appetizer',
    'side dish',
    'main course',
    'soup',
    'salad',
  ],

  WordCategory.method: [
    'baked',
    'fried',
    'grilled',
    'roasted',
    'steamed',
    'boiled',
    'slow-cooked',
    'pressure-cooked',
    'air-fried',
    'sautéed',
    'raw',
  ],

  WordCategory.cuisine: [
    'italian',
    'mexican',
    'indian',
    'chinese',
    'japanese',
    'thai',
    'greek',
    'french',
    'spanish',
    'korean',
    'mediterranean',
    'american',
    'middle eastern',
    'vietnamese',
  ],
};

sealed class RecipeWordGenerator {
  static final Random _random = Random();

  static String getRandomWord() {
    final category =
        WordCategory.values[_random.nextInt(WordCategory.values.length)];
    return _getRandomWordFromCategory(category);
  }

  static String _getRandomWordFromCategory(WordCategory category) {
    final words = wordBank[category];
    if (words == null || words.isEmpty) return '';
    return words[_random.nextInt(words.length)];
  }
}
