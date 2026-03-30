// lib/services/meal_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class MealApiService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // ─── Search meals by name ──────────────────────────────
  static Future<List<Recipe>> searchMeals(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/search.php?s=$query'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final meals = data['meals'];

        // Agar koi meal nahi mila
        if (meals == null) return [];

        return (meals as List)
            .map((meal) => _mapToRecipe(meal))
            .toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Search failed: $e');
    }
  }

  // ─── Category ke hisaab se meals ──────────────────────
  static Future<List<Recipe>> getMealsByCategory(String category) async {
    try {
      // API category names alag hain, map karo
      final apiCategory = _mapCategory(category);

      final response = await http.get(
        Uri.parse('$_baseUrl/filter.php?c=$apiCategory'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final meals = data['meals'];
        if (meals == null) return [];

        // Filter endpoint sirf basic info deta hai
        // Har meal ki full detail alag se fetch karni hogi
        final List<Recipe> recipes = [];
        // Sirf pehle 8 lo — performance ke liye
        final limited = (meals as List).take(8).toList();

        for (final meal in limited) {
          final detail = await getMealById(meal['idMeal']);
          if (detail != null) recipes.add(detail);
        }
        return recipes;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Category fetch failed: $e');
    }
  }

  // ─── Single meal by ID ────────────────────────────────
  static Future<Recipe?> getMealById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/lookup.php?i=$id'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final meals = data['meals'];
        if (meals == null || meals.isEmpty) return null;
        return _mapToRecipe(meals[0]);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ─── Random meals for home screen ─────────────────────
  static Future<List<Recipe>> getRandomMeals({int count = 10}) async {
    final List<Recipe> recipes = [];
    for (int i = 0; i < count; i++) {
      try {
        final response = await http.get(
          Uri.parse('$_baseUrl/random.php'),
        );
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final meals = data['meals'];
          if (meals != null && meals.isNotEmpty) {
            recipes.add(_mapToRecipe(meals[0]));
          }
        }
      } catch (_) {
        continue;
      }
    }
    return recipes;
  }

  // ─── API category name mapper ─────────────────────────
  // Hamari app ki categories → TheMealDB categories
  static String _mapCategory(String appCategory) {
    const map = {
      'Breakfast': 'Breakfast',
      'Lunch':     'Chicken',    // TheMealDB mein Lunch nahi hai
      'Dinner':    'Beef',
      'Dessert':   'Dessert',
      'Snack':     'Miscellaneous',
      'All':       'Chicken',
    };
    return map[appCategory] ?? 'Chicken';
  }

  // ─── API response → Recipe model ──────────────────────
  static Recipe _mapToRecipe(Map<String, dynamic> meal) {
    // Ingredients extract karo (API mein 20 slots hain)
    final List<Ingredient> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final name     = meal['strIngredient$i'];
      final measure  = meal['strMeasure$i'];

      // Empty slots skip karo
      if (name != null && name.toString().trim().isNotEmpty) {
        ingredients.add(Ingredient(
          name:     name.toString().trim(),
          quantity: measure?.toString().trim() ?? '',
        ));
      }
    }

    // Instructions ko steps mein todna
    final instructions = meal['strInstructions'] ?? '';
    final List<String> steps = instructions
        .toString()
        .split('\r\n')
        .where((s) => s.trim().isNotEmpty)
        .map((s) => s.trim())
        .toList();

    // Category map karo
    final apiCategory = meal['strCategory']?.toString() ?? 'Dinner';
    final appCategory = _mapApiCategory(apiCategory);

    return Recipe(
      id:          meal['idMeal']?.toString() ?? '',
      title:       meal['strMeal']?.toString() ?? 'Unknown',
      category:    appCategory,
      imageUrl:    meal['strMealThumb']?.toString() ?? '',
      rating:      _generateRating(meal['idMeal']?.toString() ?? '0'),
      cookTime:    _estimateCookTime(steps.length),
      difficulty:  _estimateDifficulty(ingredients.length, steps.length),
      ingredients: ingredients,
      steps:       steps.isEmpty ? ['Follow the recipe instructions.'] : steps,
      isFavorite:  false,
    );
  }

  // ─── TheMealDB category → App category ───────────────
  static String _mapApiCategory(String apiCat) {
    const map = {
      'Breakfast':     'Breakfast',
      'Dessert':       'Dessert',
      'Beef':          'Dinner',
      'Chicken':       'Lunch',
      'Lamb':          'Dinner',
      'Pasta':         'Lunch',
      'Seafood':       'Lunch',
      'Vegetarian':    'Lunch',
      'Miscellaneous': 'Snack',
      'Side':          'Snack',
      'Starter':       'Breakfast',
    };
    return map[apiCat] ?? 'Dinner';
  }

  // ─── Helper: rating generate karo ID se ──────────────
  // API mein rating nahi hoti — ID se consistent random value banate hain
  static double _generateRating(String id) {
    final num = int.tryParse(id) ?? 0;
    final base = (num % 20) / 10.0; // 0.0 to 1.9
    return (3.2 + base).clamp(3.2, 5.0);
  }

  // ─── Helper: steps se cook time estimate ─────────────
  static int _estimateCookTime(int stepCount) {
    if (stepCount <= 3)  return 15;
    if (stepCount <= 6)  return 30;
    if (stepCount <= 10) return 45;
    return 60;
  }

  // ─── Helper: difficulty estimate ─────────────────────
  static String _estimateDifficulty(int ingCount, int stepCount) {
    final total = ingCount + stepCount;
    if (total <= 8)  return 'Easy';
    if (total <= 16) return 'Medium';
    return 'Hard';
  }
}