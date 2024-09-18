import 'package:avir_app/core/enums/pref_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class AppPreference {
  AppPreference(this._prefs);

  final SharedPreferences _prefs;

  String? get accessToken => _prefs.getString(PrefKeys.accessToken.key);

  bool get hasToken => _prefs.containsKey(PrefKeys.accessToken.key);

  Future setAccessToken(String token) async {
    try {
      await _prefs.setString(PrefKeys.accessToken.key, token);
    } catch (e) {
      rethrow;
    }
  }

  String? get refreshToken => _prefs.getString(PrefKeys.refreshToken.key);

  Future setRefreshToken(String? token) async {
    if (token == null) {
      return await _prefs.remove(PrefKeys.refreshToken.key);
    }

    return await _prefs.setString(PrefKeys.refreshToken.key, token);
  }

  Future deleteToken() async {
    await _prefs.remove(PrefKeys.accessToken.key);
    await _prefs.remove(PrefKeys.refreshToken.key);
  }

  Future languageSelected(bool isSelected) async =>
      _prefs.setBool(PrefKeys.languageSelected.key, isSelected);

  bool get isSelectedLang => _prefs.containsKey(PrefKeys.languageSelected.key);
}
