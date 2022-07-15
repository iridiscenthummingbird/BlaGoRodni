import 'package:blagorodni/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

part 'routes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _generateRoute,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
