class Ingredient {
  final String name;
  final String quantity;
  bool isChecked;

  Ingredient({
    required this.name,
    required this.quantity,
    this.isChecked = false,
  });
}

class Recipe {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final double rating;
  final int cookTime;        // minutes mein
  final String difficulty;   // 'Easy', 'Medium', 'Hard'
  final List<Ingredient> ingredients;
  final List<String> steps;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.cookTime,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
    this.isFavorite = false,
  });
}