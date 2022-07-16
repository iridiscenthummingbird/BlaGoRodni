import 'package:blagorodni/localization/localization.dart';
import 'package:blagorodni/screens/login/login_screen.dart';
import 'package:blagorodni/screens/main/cubit/main_cubit.dart';
import 'package:blagorodni/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainCubit _cubit;

  @override
  void initState() {
    _cubit = MainCubit(userRepository: context.read());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        logout: () {
          _cubit.logout();
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).mainScreen.myNotes,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(AppLocalizations.of(context).mainScreen.mainScreen),
        ),
      ),
    );
  }
}
