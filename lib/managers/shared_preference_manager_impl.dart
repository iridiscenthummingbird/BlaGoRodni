import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

// - Switch key

const userLang = 'USER_LANG';

abstract class SharedPreferenceManager {
  void saveUserLanguage(String language);

  Future<String> getUserLanguage();

  Stream<String> watchUserLanguage();

  static SharedPreferenceManager of(BuildContext context) => RepositoryProvider.of(context);
}

class SharedPreferenceManagerImpl implements SharedPreferenceManager {
  late RxSharedPreferences _prefs;

  static SharedPreferenceManagerImpl? _instance;

  factory SharedPreferenceManagerImpl() => _instance ??= SharedPreferenceManagerImpl._();

  SharedPreferenceManagerImpl._();

  Future<void> init(SharedPreferences prefs) async {
    _prefs = RxSharedPreferences(prefs);
  }

  @override
  Future<String> getUserLanguage() async {
    return (await _prefs.getString(userLang)) ?? '';
  }

  @override
  void saveUserLanguage(String language) {
    _prefs.setString(userLang, language);
  }

  @override
  Stream<String> watchUserLanguage() {
    return _prefs.getStringStream(userLang).map((event) => event ?? '');
  }
}
