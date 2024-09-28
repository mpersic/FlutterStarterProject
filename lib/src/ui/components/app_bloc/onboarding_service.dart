import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static Future<bool> getIsOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOnboardingComplete') ?? true;
  }

  static Future<void> setIsOnboarding(bool isComplete) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingComplete', isComplete);
  }
}
