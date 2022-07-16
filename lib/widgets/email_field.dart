import 'package:blagorodni/extentions/email_validation.dart';
import 'package:blagorodni/localization/localization.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).loginScreen.email,
      ),
      validator: (input) {
        if (input != null) {
          return input.isValidEmail() ? null : AppLocalizations.of(context).loginScreen.validEmailRequired;
        }
        return null;
      },
    );
  }
}
