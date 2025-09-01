import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._privateConstructor();
  static final LocalStorage _instance = LocalStorage._privateConstructor();
  static LocalStorage get instance => _instance;

  static const String onboardingCompleted = "onboarding_completed";
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setOnboardingCompleted({bool value = true}) async {
    await _prefs.setBool(onboardingCompleted, value);
  }

  Future<bool> getOnboardingCompleted() async {
    return _prefs.getBool(onboardingCompleted) ?? false;
  }
}
