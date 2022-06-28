import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _hasUserLoggedIn = "HasUserLoggedIn";

  static Future<void> setHasUserLoggedIn(bool value) async {
    final _pref = await SharedPreferences.getInstance();

    await _pref.setBool(_hasUserLoggedIn, value);
  }

  static Future<bool> getUserLoggedIn() async {
    final _pref = await SharedPreferences.getInstance();
    var _isLoggedIn = _pref.getBool(_hasUserLoggedIn);

    return _isLoggedIn ?? false;
  }
}
