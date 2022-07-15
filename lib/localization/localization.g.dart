// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    mainScreen: const AppLocalizationsDataMainScreen(
      mainScreen: 'Main screen',
    ),
  ),
  Locale.fromSubtags(languageCode: 'uk'): const AppLocalizationsData(
    mainScreen: const AppLocalizationsDataMainScreen(
      mainScreen: 'Головний екран',
    ),
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.mainScreen,
  });

  final AppLocalizationsDataMainScreen mainScreen;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        mainScreen: AppLocalizationsDataMainScreen.fromJson(
            map['mainScreen']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    AppLocalizationsDataMainScreen? mainScreen,
  }) =>
      AppLocalizationsData(
        mainScreen: mainScreen ?? this.mainScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData && mainScreen == other.mainScreen);
  @override
  int get hashCode => runtimeType.hashCode ^ mainScreen.hashCode;
}

class AppLocalizationsDataMainScreen {
  const AppLocalizationsDataMainScreen({
    required this.mainScreen,
  });

  final String mainScreen;
  factory AppLocalizationsDataMainScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataMainScreen(
        mainScreen: map['mainScreen']! as String,
      );

  AppLocalizationsDataMainScreen copyWith({
    String? mainScreen,
  }) =>
      AppLocalizationsDataMainScreen(
        mainScreen: mainScreen ?? this.mainScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataMainScreen &&
          mainScreen == other.mainScreen);
  @override
  int get hashCode => runtimeType.hashCode ^ mainScreen.hashCode;
}
