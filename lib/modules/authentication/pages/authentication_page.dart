import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealix/modules/authentication/components/login_component.dart';
import 'package:mealix/modules/authentication/components/register_component.dart';
import 'package:mealix/modules/authentication/components/wave_clipper_component.dart';
import 'package:mealix/modules/authentication/model/register_model.dart';
import 'package:mealix/shared/components/two_tab_bar_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/authentication/store/authentication_provider.dart';
import '../../home/pages/home_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthenticationProvider authenticationProvider =
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Wave-shaped green background
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: size.height * 0.4,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Positioned(
              top: size.height * 0.2 - 35,
              left: size.width * 0.5 - 90,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90,
                backgroundImage: AssetImage('assets/images/login_food.png'),
              ),
            ),
            Positioned(
              top: size.height * 0.38,
              left: size.width * 0.1,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                  ),
                  width: size.width * 0.8,
                  height: size.height - size.height * 0.38 - 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      TwoTabBar(
                        tab1Title: AppLocalizations.of(context)!.loginTitle,
                        tab2Title: AppLocalizations.of(context)!.signUpTitle,
                        tab1Content: LoginComponent(onLogin: onLogin),
                        tab2Content: RegisterComponent(onRegister: onRegister),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLogin() {}

  void onRegister(RegisterModel registerObj) {
    log("State: ${registerObj.toJson()}");
  }
}
