import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static const String _colorSchemeKey = 'colorScheme';
  static const String _darkModeKey = 'colorScheme';

  static Future<bool?> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool(_darkModeKey);
    return isDarkMode;
  }

  static Future<void> setIsDarkMode(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, isDarkMode);
  }

  static Future<ColorScheme> getColorScheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? seedColorValue = prefs.getInt(_colorSchemeKey);
    Color seedColor =
        seedColorValue != null ? Color(seedColorValue) : Colors.blue;
    return ColorScheme.fromSeed(seedColor: seedColor);
  }

  static Future<void> setColorScheme(ColorScheme colorScheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_colorSchemeKey, colorScheme.primary.value);
  }
}
