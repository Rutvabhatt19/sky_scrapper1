import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePref {
  static const Prefkey = 'pref_kry';
  setTheme(bool val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(Prefkey, val);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(Prefkey);
  }
}

class ThemeModal extends ChangeNotifier {
  bool _isDark = false;
  ThemePref _preferances = ThemePref();
  bool get isDark => _isDark;
  ThemeModal() {
    _isDark = false;
    _preferances = ThemePref();
    getPreferances();
  }
  getPreferances() async {
    _isDark = await _preferances.getTheme();
    notifyListeners();
  }

  set isDark(bool val) {
    _isDark = val;
    _preferances.setTheme(val);
    notifyListeners();
  }
}
