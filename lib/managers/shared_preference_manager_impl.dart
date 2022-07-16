import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferenceManager {
  void setTheme(ThemeMode themeMode);

  ThemeMode getTheme();

  void setUid(String uid);

  String getUid();

  bool isAuthorized();

  void logout();
}

class SharedPreferenceManagerImpl implements SharedPreferenceManager {
  final SharedPreferences sharedPreferences;

  SharedPreferenceManagerImpl({required this.sharedPreferences});

  @override
  ThemeMode getTheme() {
    final theme = sharedPreferences.getString('theme');
    if (theme == null) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      final bool isDarkMode = brightness == Brightness.dark;
      if (isDarkMode) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    } else if (theme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  void setTheme(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      sharedPreferences.setString('theme', 'dark');
    } else {
      sharedPreferences.setString('theme', 'light');
    }
  }

  @override
  String getUid() {
    return sharedPreferences.getString('uid') ?? '';
  }

  @override
  void setUid(String uid) {
    sharedPreferences.setString('uid', uid);
  }

  @override
  bool isAuthorized() {
    final String uid = sharedPreferences.getString('uid') ?? '';
    return uid.isNotEmpty;
  }

  @override
  void logout() {
    sharedPreferences.setString('uid', '');
  }
}
