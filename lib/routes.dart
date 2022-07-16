part of 'app.dart';

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case MainScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => const MainScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => const LoginScreen(),
      );
    case NoteScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => const NoteScreen(),
      );
    case RegistrationScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => const RegistrationScreen(),
      );
    default:
      throw ArgumentError.value(settings.name, 'settings.name', 'Unsupported route');
  }
}
