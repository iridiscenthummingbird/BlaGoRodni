import 'package:blagorodni/managers/auth_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';
import 'package:blagorodni/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DI extends StatelessWidget {
  final Widget child;

  const DI({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<SharedPreferenceManager>(
                create: (context) => SharedPreferenceManagerImpl(
                  sharedPreferences: snapshot.data!,
                ),
              ),
              RepositoryProvider<AuthManager>(
                create: (context) => AuthManagerImpl(),
              ),
              RepositoryProvider<UserRepository>(
                create: (context) => UserRepositoryImpl(
                  authManager: context.read<AuthManager>(),
                  sharedPreferenceManager: context.read<SharedPreferenceManager>(),
                ),
              ),
            ],
            child: child,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
