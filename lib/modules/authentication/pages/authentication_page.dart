import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/authentication/store/authentication_provider.dart';
import '../../../shared/widgets/two_tab_bar_component.dart';
import '../enum/tab_mode_enum.dart';
import '../widget/login_widget.dart';
import '../widget/register_widget.dart';
import '../widget/wave_clipper_widget.dart';

class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({super.key});

  static const String routeLocation = '/auth';
  static const String routeName = 'authentication';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90,
                backgroundImage: AssetImage('assets/images/login_food.png'),
              ),
            ),
            Positioned(
              top: size.height * 0.38,
              left: size.width * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(5),
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
                        tab1Content: const LoginWidget(),
                        tab2Content: const RegisterWidget(),
                        onTabChange: (mode) {
                          final notifier = ref.read(
                            authenticationFormStateProvider.notifier,
                          );
                          switch (mode) {
                            case TabMode.tab1:
                              notifier.setLoginMode();
                            case TabMode.tab2:
                              notifier.setSignUpMode();
                          }
                        },
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
}
