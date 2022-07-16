import 'package:blagorodni/app.dart';
import 'package:blagorodni/firebase_options.dart';
import 'package:blagorodni/utils/error_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc? bloc, Object? event) {
    super.onEvent(bloc!, event);
    if (kDebugMode) {
      print(event);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // print(error);
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType}, $error');
    }

    //FirebaseCrashlytics.instance.recordError(error, stackTrace);
    // if (error is UnauthorisedException) {
    //   navigatorKey.currentState?.pushReplacementNamed(LoginScreen.routeName);
    // }

    if (error is FirebaseAuthException) {
      showErrorPopup(error.message!);
    }
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const App());
    },
    blocObserver: MyBlocObserver(),
  );
}
