import 'package:blagorodni/managers/api_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';
import 'package:blagorodni/repositories/users_repository.dart';
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
        RepositoryProvider<ApiManager>(
          create: (context) => ApiManagerImpl(),
        ),
        RepositoryProvider<SharedPreferenceManager>(
          create: (context) => SharedPreferenceManagerImpl(),
        ),
        RepositoryProvider<UsersRepository>(
          create: (context) => UsersRepositoryImpl(
            apiManager: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
