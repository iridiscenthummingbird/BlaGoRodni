import 'package:blagorodni/localization/localization.dart';
import 'package:blagorodni/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.logout,
  }) : super(key: key);

  final void Function() logout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(AppLocalizations.of(context).mainScreen.darkTheme),
                  const ThemeSwitcher(),
                ],
              ),
              InkWell(
                onTap: () => logout(),
                child: Ink(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.logout),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppLocalizations.of(context).mainScreen.logout,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
