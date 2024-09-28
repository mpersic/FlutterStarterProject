part of 'app_bloc.dart';

abstract class AppEvent {}

class AppInit extends AppEvent {}

class LocaleChanged extends AppEvent {
  final String localeCode;

  LocaleChanged(this.localeCode);
}

class ThemeChanged extends AppEvent {
  final bool isDarkMode;

  ThemeChanged(this.isDarkMode);
}

class OnboardingChanged extends AppEvent {
  final bool isOnboarding;

  OnboardingChanged(this.isOnboarding);
}
