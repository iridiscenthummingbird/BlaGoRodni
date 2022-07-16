import 'package:blagorodni/extentions/email_validation.dart';
import 'package:blagorodni/repositories/user_repository.dart';
import 'package:blagorodni/screens/login/cubit/login_cubit.dart';
import 'package:blagorodni/screens/main/main_screen.dart';
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

  @override
  void initState() {
    _cubit = LoginCubit(
      userRepository: context.read<UserRepository>(),
    );
    super.initState();
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
                          const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: (input) {
                              if (input != null) {
                                return input.isValidEmail() ? null : 'A valid email is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            obscuringCharacter: '*',
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            validator: (input) {
                              if (input != null && input.isEmpty) {
                                return 'A password is required';
                              }
                              if (input != null && input.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
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
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            'Sign in',
                                            style: TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text('or sign in with'),
                                const SizedBox(height: 10),
                                const CircleAvatar(
                                  radius: 35,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Don\'t have an account? '),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
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
