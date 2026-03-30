# CookBook 🍳

A Flutter recipe app built with TheMealDB API.

## Features
- Browse and search real recipes from TheMealDB
- Filter by category (Breakfast, Lunch, Dinner, Dessert, Snack)
- Save favorites with local storage
- Dark / Light theme
- Add and edit custom recipes

## Screens
- Home Screen — featured + popular recipes
- Recipe Detail — ingredients, steps, start cooking
- Favorites — saved recipes with sort options
- Settings — theme, preferences, about
- Add/Edit Recipe — custom recipe form
- Browse by Category — category-wise recipe grid

## Tech Stack
- Flutter + Dart
- TheMealDB API (free, no key required)
- shared_preferences — local storage
- cached_network_image — smooth image loading
- http — API calls

## Run the App

### Normal run (free API)
```bash
flutter run
```

### With custom API URL (future paid API)
```bash
flutter run \
  --dart-define=API_BASE_URL=https://your-api.com \
  --dart-define=API_KEY=your_key_here
```

## Build APK
```bash
flutter build apk --release
```

## Project Structure
```
lib/
├── main.dart
├── models/         # Recipe, Ingredient models
├── screens/        # All app screens
├── widgets/        # Reusable UI components
├── services/       # API + preferences services
└── utils/          # Constants, sample data
```

## Security Note
API keys are passed via `--dart-define` at build time.
They are never hardcoded in source code.