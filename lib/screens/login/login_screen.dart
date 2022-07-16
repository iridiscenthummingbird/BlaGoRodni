import 'package:blagorodni/localization/localization.dart';
import 'package:blagorodni/repositories/user_repository.dart';
import 'package:blagorodni/screens/login/cubit/login_cubit.dart';
import 'package:blagorodni/screens/main/main_screen.dart';
import 'package:blagorodni/screens/registration/registration_screen.dart';
import 'package:blagorodni/widgets/email_field.dart';
import 'package:blagorodni/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _cubit;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final AppLocalizationsData localization;
  @override
  void initState() {
    _cubit = LoginCubit(
      userRepository: context.read<UserRepository>(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localization = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _cubit,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.network(
              'https://i.pinimg.com/736x/32/7c/74/327c74a2b9b1463771e8406d3835f31f.jpg',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 260),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            localization.loginScreen.signIn,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
                          EmailField(
                            controller: _emailController,
                          ),
                          const SizedBox(height: 10),
                          PasswordField(
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Column(
                              children: [
                                Material(
                                  child: InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState?.validate() ?? false) {
                                        _cubit.signIn(_emailController.text, _passwordController.text);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            localization.loginScreen.signIn,
                                            style: const TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(localization.loginScreen.orSignInWith),
                                const SizedBox(height: 10),
                                const CircleAvatar(
                                  radius: 35,
                                ),
                                const SizedBox(height: 20),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(localization.loginScreen.dontHaveAccount + ' '),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(context, RegistrationScreen.routeName);
                                      },
                                      child: Text(
                                        localization.loginScreen.register,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
