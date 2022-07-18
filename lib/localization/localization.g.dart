// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    noteScreen: const AppLocalizationsDataNoteScreen(
      descriptionRequired: 'Description is required',
      description: 'Description',
      title: 'Title',
      titleRequired: 'Title is required',
    ),
    mainScreen: const AppLocalizationsDataMainScreen(
      myNotes: 'My Notes',
      logout: 'Logout',
      text: 'text',
      mainScreen: 'Main screen',
    ),
    registrationScreen: const AppLocalizationsDataRegistrationScreen(
      orSignUpWith: 'or sign up with',
      doYouHaveAccount: 'Do you have an account?',
      signUp: 'Sign up',
    ),
    loginScreen: const AppLocalizationsDataLoginScreen(
      register: 'Register',
      dontHaveAccount: 'Don\'t have an account?',
      orSignInWith: 'or sign in with',
      passwordMustBe: 'Password must be at least 6 characters',
      passwordRequired: 'A password is required',
      password: 'Password',
      validEmailRequired: 'A valid email is required',
      email: 'Email',
      signIn: 'Sign in',
    ),
  ),
  Locale.fromSubtags(languageCode: 'uk'): const AppLocalizationsData(
    noteScreen: const AppLocalizationsDataNoteScreen(
      descriptionRequired: 'Потрібен опис',
      description: 'Опис',
      title: 'Титул',
      titleRequired: 'Назва потрібна',
    ),
    mainScreen: const AppLocalizationsDataMainScreen(
      myNotes: 'Мої Нотатки',
      logout: 'Вийти',
      text: 'текст',
      mainScreen: 'Головний екран',
    ),
    registrationScreen: const AppLocalizationsDataRegistrationScreen(
      orSignUpWith: 'або зареєструватися з',
      doYouHaveAccount: 'У вас є аккаунт?',
      signUp: 'Зареєструватися',
    ),
    loginScreen: const AppLocalizationsDataLoginScreen(
      register: 'Реєстрація',
      dontHaveAccount: 'Не маєте облікового запису?',
      orSignInWith: 'або увійдіть із',
      passwordMustBe: 'Пароль повинен бути щонайменше 6 символів',
      passwordRequired: 'Потрібен пароль',
      password: 'Пароль',
      validEmailRequired: 'Потрібна дійсна електронна пошта',
      email: 'Електронна пошта',
      signIn: 'Увійти',
    ),
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.noteScreen,
    required this.mainScreen,
    required this.registrationScreen,
    required this.loginScreen,
  });

  final AppLocalizationsDataNoteScreen noteScreen;
  final AppLocalizationsDataMainScreen mainScreen;
  final AppLocalizationsDataRegistrationScreen registrationScreen;
  final AppLocalizationsDataLoginScreen loginScreen;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        noteScreen: AppLocalizationsDataNoteScreen.fromJson(
            map['noteScreen']! as Map<String, Object?>),
        mainScreen: AppLocalizationsDataMainScreen.fromJson(
            map['mainScreen']! as Map<String, Object?>),
        registrationScreen: AppLocalizationsDataRegistrationScreen.fromJson(
            map['registrationScreen']! as Map<String, Object?>),
        loginScreen: AppLocalizationsDataLoginScreen.fromJson(
            map['loginScreen']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    AppLocalizationsDataNoteScreen? noteScreen,
    AppLocalizationsDataMainScreen? mainScreen,
    AppLocalizationsDataRegistrationScreen? registrationScreen,
    AppLocalizationsDataLoginScreen? loginScreen,
  }) =>
      AppLocalizationsData(
        noteScreen: noteScreen ?? this.noteScreen,
        mainScreen: mainScreen ?? this.mainScreen,
        registrationScreen: registrationScreen ?? this.registrationScreen,
        loginScreen: loginScreen ?? this.loginScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          noteScreen == other.noteScreen &&
          mainScreen == other.mainScreen &&
          registrationScreen == other.registrationScreen &&
          loginScreen == other.loginScreen);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      noteScreen.hashCode ^
      mainScreen.hashCode ^
      registrationScreen.hashCode ^
      loginScreen.hashCode;
}

class AppLocalizationsDataNoteScreen {
  const AppLocalizationsDataNoteScreen({
    required this.descriptionRequired,
    required this.description,
    required this.title,
    required this.titleRequired,
  });

  final String descriptionRequired;
  final String description;
  final String title;
  final String titleRequired;
  factory AppLocalizationsDataNoteScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataNoteScreen(
        descriptionRequired: map['descriptionRequired']! as String,
        description: map['description']! as String,
        title: map['title']! as String,
        titleRequired: map['titleRequired']! as String,
      );

  AppLocalizationsDataNoteScreen copyWith({
    String? descriptionRequired,
    String? description,
    String? title,
    String? titleRequired,
  }) =>
      AppLocalizationsDataNoteScreen(
        descriptionRequired: descriptionRequired ?? this.descriptionRequired,
        description: description ?? this.description,
        title: title ?? this.title,
        titleRequired: titleRequired ?? this.titleRequired,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataNoteScreen &&
          descriptionRequired == other.descriptionRequired &&
          description == other.description &&
          title == other.title &&
          titleRequired == other.titleRequired);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      descriptionRequired.hashCode ^
      description.hashCode ^
      title.hashCode ^
      titleRequired.hashCode;
}

class AppLocalizationsDataMainScreen {
  const AppLocalizationsDataMainScreen({
    required this.myNotes,
    required this.logout,
    required this.text,
    required this.mainScreen,
  });

  final String myNotes;
  final String logout;
  final String text;
  final String mainScreen;
  factory AppLocalizationsDataMainScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataMainScreen(
        myNotes: map['myNotes']! as String,
        logout: map['logout']! as String,
        text: map['text']! as String,
        mainScreen: map['mainScreen']! as String,
      );

  AppLocalizationsDataMainScreen copyWith({
    String? myNotes,
    String? logout,
    String? text,
    String? mainScreen,
  }) =>
      AppLocalizationsDataMainScreen(
        myNotes: myNotes ?? this.myNotes,
        logout: logout ?? this.logout,
        text: text ?? this.text,
        mainScreen: mainScreen ?? this.mainScreen,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataMainScreen &&
          myNotes == other.myNotes &&
          logout == other.logout &&
          text == other.text &&
          mainScreen == other.mainScreen);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      myNotes.hashCode ^
      logout.hashCode ^
      text.hashCode ^
      mainScreen.hashCode;
}

class AppLocalizationsDataRegistrationScreen {
  const AppLocalizationsDataRegistrationScreen({
    required this.orSignUpWith,
    required this.doYouHaveAccount,
    required this.signUp,
  });

  final String orSignUpWith;
  final String doYouHaveAccount;
  final String signUp;
  factory AppLocalizationsDataRegistrationScreen.fromJson(
          Map<String, Object?> map) =>
      AppLocalizationsDataRegistrationScreen(
        orSignUpWith: map['orSignUpWith']! as String,
        doYouHaveAccount: map['doYouHaveAccount']! as String,
        signUp: map['signUp']! as String,
      );

  AppLocalizationsDataRegistrationScreen copyWith({
    String? orSignUpWith,
    String? doYouHaveAccount,
    String? signUp,
  }) =>
      AppLocalizationsDataRegistrationScreen(
        orSignUpWith: orSignUpWith ?? this.orSignUpWith,
        doYouHaveAccount: doYouHaveAccount ?? this.doYouHaveAccount,
        signUp: signUp ?? this.signUp,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataRegistrationScreen &&
          orSignUpWith == other.orSignUpWith &&
          doYouHaveAccount == other.doYouHaveAccount &&
          signUp == other.signUp);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      orSignUpWith.hashCode ^
      doYouHaveAccount.hashCode ^
      signUp.hashCode;
}

class AppLocalizationsDataLoginScreen {
  const AppLocalizationsDataLoginScreen({
    required this.register,
    required this.dontHaveAccount,
    required this.orSignInWith,
    required this.passwordMustBe,
    required this.passwordRequired,
    required this.password,
    required this.validEmailRequired,
    required this.email,
    required this.signIn,
  });

  final String register;
  final String dontHaveAccount;
  final String orSignInWith;
  final String passwordMustBe;
  final String passwordRequired;
  final String password;
  final String validEmailRequired;
  final String email;
  final String signIn;
  factory AppLocalizationsDataLoginScreen.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataLoginScreen(
        register: map['register']! as String,
        dontHaveAccount: map['dontHaveAccount']! as String,
        orSignInWith: map['orSignInWith']! as String,
        passwordMustBe: map['passwordMustBe']! as String,
        passwordRequired: map['passwordRequired']! as String,
        password: map['password']! as String,
        validEmailRequired: map['validEmailRequired']! as String,
        email: map['email']! as String,
        signIn: map['signIn']! as String,
      );

  AppLocalizationsDataLoginScreen copyWith({
    String? register,
    String? dontHaveAccount,
    String? orSignInWith,
    String? passwordMustBe,
    String? passwordRequired,
    String? password,
    String? validEmailRequired,
    String? email,
    String? signIn,
  }) =>
      AppLocalizationsDataLoginScreen(
        register: register ?? this.register,
        dontHaveAccount: dontHaveAccount ?? this.dontHaveAccount,
        orSignInWith: orSignInWith ?? this.orSignInWith,
        passwordMustBe: passwordMustBe ?? this.passwordMustBe,
        passwordRequired: passwordRequired ?? this.passwordRequired,
        password: password ?? this.password,
        validEmailRequired: validEmailRequired ?? this.validEmailRequired,
        email: email ?? this.email,
        signIn: signIn ?? this.signIn,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataLoginScreen &&
          register == other.register &&
          dontHaveAccount == other.dontHaveAccount &&
          orSignInWith == other.orSignInWith &&
          passwordMustBe == other.passwordMustBe &&
          passwordRequired == other.passwordRequired &&
          password == other.password &&
          validEmailRequired == other.validEmailRequired &&
          email == other.email &&
          signIn == other.signIn);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      register.hashCode ^
      dontHaveAccount.hashCode ^
      orSignInWith.hashCode ^
      passwordMustBe.hashCode ^
      passwordRequired.hashCode ^
      password.hashCode ^
      validEmailRequired.hashCode ^
      email.hashCode ^
      signIn.hashCode;
}
