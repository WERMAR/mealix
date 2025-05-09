import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealix/shared/authentication/store/authentication_provider.dart';

class LoginComponent extends ConsumerWidget {
  LoginComponent({super.key, required this.onLogin});

  final VoidCallback onLogin;

  late Timer? _debounce;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authenticationStoreProvider.notifier);
    final state = ref.watch(authenticationStoreProvider);

    _debounce = Timer(const Duration(milliseconds: 700), () {
      //notifier.setEMail(value);
    });

    // Use TextEditingControllers to manage the text field values.
    final emailController = TextEditingController(
      text: state.value?.formInput.email ?? '',
    );
    final passwordController = TextEditingController(
      text: state.value?.formInput.password ?? '',
    );

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
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 700), () {
                  notifier.setEMail(value);
                });
              },
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
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 700), () {
                  notifier.setPassword(value);
                });
              },
              onFieldSubmitted: (value) {
                TextInput.finishAutofillContext(); // <-- this
                final isValid =
                    state.value?.formInput.isValid(
                      state.value?.activeMode ?? AuthenticationMode.signIn,
                    ) ??
                    false;
                if (isValid) {
                  notifier.logInWithEmailAndPassword(
                    state.value!.formInput.email!,
                    state.value!.formInput.password!,
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
                state.value?.formInput.isValid(
                          state.value?.activeMode ?? AuthenticationMode.signIn,
                        ) ??
                        false
                    ? () {
                      // FIXME: This finishAutofillContext is not working on iOS caused by missing domain configuration see: https://github.com/flutter/flutter/issues/69111#issuecomment-722711868
                      TextInput.finishAutofillContext(); // <-- this
                      notifier.logInWithEmailAndPassword(
                        state.value!.formInput.email!,
                        state.value!.formInput.password!,
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
