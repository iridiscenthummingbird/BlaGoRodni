import 'package:blagorodni/localization/localization.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscuringCharacter: '*',
      obscureText: true,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).loginScreen.password,
      ),
      validator: (input) {
        if (input != null && input.isEmpty) {
          return AppLocalizations.of(context).loginScreen.passwordRequired;
        }
        if (input != null && input.length < 6) {
          return AppLocalizations.of(context).loginScreen.passwordMustBe;
        }
        return null;
      },
    );
  }
}
