import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class LocalStorage {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  LocalStorage(this._prefs, this._secureStorage);

  /// Delare key
  static const String onboardingCompleted = "onboarding_completed";
  static const String accessTokenKey = 'access-token';

  /// Function

  Future<void> setOnboardingCompleted({bool value = true}) async {
    await _prefs.setBool(onboardingCompleted, value);
  }

  Future<bool> getOnboardingCompleted() async {
    return _prefs.getBool(onboardingCompleted) ?? false;
  }

  Future<void> setAccessToken(String accessToken) async {
    await _secureStorage.write(key: accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: accessTokenKey);
  }
}
