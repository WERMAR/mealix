import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealix/shared/authentication/store/authentication_provider.dart';

class LoginComponent extends ConsumerWidget {
  const LoginComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationNotifier = ref.read(
      authenticationStoreProvider.notifier,
    );
    final authenticationFormState = ref.watch(authenticationFormStateProvider);

    // Use TextEditingControllers to manage the text field values.
    final emailController = TextEditingController(
      text: authenticationFormState.email ?? '',
    );
    final passwordController = TextEditingController(
      text: authenticationFormState.password ?? '',
    );

    final _emailFocusNode = FocusNode();
    final _passwordFocusNode = FocusNode();

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        ref
            .read(authenticationFormStateProvider.notifier)
            .setEmail(emailController.text);
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        ref
            .read(authenticationFormStateProvider.notifier)
            .setPassword(passwordController.text);
      }
    });

    // Dispose the controllers to prevent memory leaks
    return AutofillGroup(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Login: E-Mail field
          Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(8),
            shadowColor: Colors.black,
            child: TextFormField(
              controller: emailController,
              keyboardType:
                  TextInputType.emailAddress, // Use the controller here.
              focusNode: _emailFocusNode,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email],
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.email,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Login: Password field
          Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(8),
            shadowColor: Colors.black,
            child: TextFormField(
              controller: passwordController,
              focusNode: _passwordFocusNode,
              onFieldSubmitted: (value) {
                TextInput.finishAutofillContext(); // <-- this
                final isValid = authenticationFormState.isValid(
                  authenticationFormState.activeMode,
                );
                if (isValid) {
                  authenticationNotifier.logInWithEmailAndPassword(
                    authenticationFormState.email!,
                    authenticationFormState.password!,
                  );
                }
              },
              autofillHints: const [AutofillHints.password],
              obscureText: true,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                prefixIcon: Icon(
                  Icons.key_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed:
                authenticationFormState.isValid(
                      authenticationFormState.activeMode,
                    )
                    ? () {
                      // FIXME: This finishAutofillContext is not working on iOS caused by missing domain configuration see: https://github.com/flutter/flutter/issues/69111#issuecomment-722711868
                      TextInput.finishAutofillContext(); // <-- this
                      authenticationNotifier.logInWithEmailAndPassword(
                        authenticationFormState.email!,
                        authenticationFormState.password!,
                      );
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
              shadowColor: Colors.black,
              elevation: 9,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(AppLocalizations.of(context)!.loginTitle),
          ),
        ],
      ),
    );
  }
}
