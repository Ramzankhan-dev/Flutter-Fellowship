// lib/utils/constants.dart
import 'package:flutter/material.dart';

// ─── Colors ───────────────────────────────────────────────
const kPrimaryColor = Color(0xFF6C63FF);  // Main purple color
const kAccentOrange = Color(0xFFFF9500);  // Time badge color
const kDarkBg       = Color(0xFF0F1117);  // Main dark background
const kCardDark     = Color(0xFF1A1D2E);  // Card background
const kCardDark2    = Color(0xFF13151F);  // Slightly darker card

// ─── Categories ───────────────────────────────────────────
const kCategories = ['All', 'Breakfast', 'Lunch', 'Dinner', 'Dessert', 'Snack'];

// ─── API Configuration ────────────────────────────────────
// These values come from --dart-define at build/run time
// If not provided, free TheMealDB URL is used as default
const kApiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://www.themealdb.com/api/json/v1/1',
);

// Reserved for future paid API key (empty by default)
const kApiKey = String.fromEnvironment(
  'API_KEY',
  defaultValue: '',
);