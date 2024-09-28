import 'package:flutter/material.dart';

class AppState {
  final Locale locale;
  final ThemeMode themeMode;
  final bool isOnboarding;

  AppState(
      {required this.locale,
      required this.themeMode,
      required this.isOnboarding});

  AppState.initial()
      : locale = const Locale('en'),
        themeMode = ThemeMode.light,
        isOnboarding = true;

  AppState copyWith(
      {Locale? locale, ThemeMode? themeMode, bool? isOnboarding}) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      isOnboarding: isOnboarding ?? this.isOnboarding,
    );
  }
}
