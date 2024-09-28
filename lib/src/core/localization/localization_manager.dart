import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager {
  static const String _localeKey = 'locale_key';

  static Future<Locale> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeCode = prefs.getString(_localeKey);

    if (localeCode != null) {
      final parts = localeCode.split('_');
      if (parts.length == 2) {
        return Locale(parts[0], parts[1]);
      }
    }

    // Default locale if none is saved
    return const Locale('en');
  }

  static Future<void> setLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String localeCode = '${locale.languageCode}_${locale.countryCode}';
    await prefs.setString(_localeKey, localeCode);

    // Notify app of the locale change
    // This is typically done using a callback or state management
  }
}
