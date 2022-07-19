import 'package:blagorodni/managers/auth_manager.dart';
import 'package:blagorodni/managers/firestore_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';
import 'package:blagorodni/repositories/notes_repository.dart';
import 'package:blagorodni/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DI extends StatelessWidget {
  final Widget child;

  const DI({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SharedPreferenceManager>(
          create: (context) => SharedPreferenceManagerImpl(),
        ),
        RepositoryProvider<AuthManager>(
          create: (context) => AuthManagerImpl(),
        ),
        RepositoryProvider<FireStoreManager>(
          create: (context) => FireStoreManagerImpl(),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            authManager: context.read<AuthManager>(),
            sharedPreferenceManager: context.read<SharedPreferenceManager>(),
          ),
        ),
        RepositoryProvider<NotesRepository>(
          create: (context) => NotesRepositoryImpl(
            fireStoreManager: context.read<FireStoreManager>(),
            sharedPreferenceManager: context.read<SharedPreferenceManager>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
