import 'package:blagorodni/di.dart';
import 'package:blagorodni/localization/localization.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';
import 'package:blagorodni/screens/login/login_screen.dart';
import 'package:blagorodni/screens/main/main_screen.dart';
import 'package:blagorodni/screens/note/note_screen.dart';
import 'package:blagorodni/screens/registration/registration_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

part 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return DI(
      child: Builder(
        builder: (context) {
          return MaterialApp(
            builder: BotToastInit(),
            onGenerateRoute: _generateRoute,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: localizedLabels.keys.toList(),
            home: context.read<SharedPreferenceManager>().isAuthorized() ? const MainScreen() : const LoginScreen(),
          );
        },
      ),
    );
  }
}
