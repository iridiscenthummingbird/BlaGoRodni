import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferenceManager {
  void setTheme(ThemeMode themeMode);
  ThemeMode getTheme();
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
}
