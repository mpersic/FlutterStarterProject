import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/src/core/core.dart';
import 'package:flutter_starter_project/src/ui/ui.dart';

part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<AppInit>((event, emit) async {
      var localeCode = await LocalizationManager.getLocale();
      var isDarkMode = await ThemeManager.isDarkMode() ?? false;
      var isOnboarding = await OnboardingService.getIsOnboarding();
      emit(AppState(
          locale: localeCode,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          isOnboarding: isOnboarding));
    });

    on<LocaleChanged>((event, emit) async {
      emit(state.copyWith(locale: Locale(event.localeCode)));
      await LocalizationManager.setLocale(Locale(event.localeCode));
    });

    on<ThemeChanged>((event, emit) async {
      emit(state.copyWith(
          themeMode: event.isDarkMode ? ThemeMode.dark : ThemeMode.light));
      await ThemeManager.setIsDarkMode(event.isDarkMode);
    });

    on<OnboardingChanged>((event, emit) async {
      emit(state.copyWith(isOnboarding: event.isOnboarding));
      await OnboardingService.setIsOnboarding(event.isOnboarding);
    });
  }
}
