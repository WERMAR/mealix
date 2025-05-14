import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/authentication/store/authentication_provider.dart';
import '../model/register_model.dart';

class RegisterComponent extends ConsumerWidget {
  const RegisterComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationForm = ref.watch(authenticationFormStateProvider);
    final authenticationStore = ref.watch(authenticationStoreProvider);

    final _nameController = TextEditingController(
      text: authenticationForm.name ?? '',
    );

    final _emailController = TextEditingController(
      text: authenticationForm.email ?? '',
    );

    final _passwordController = TextEditingController(
      text: authenticationForm.password ?? '',
    );

    final _nameFocusNode = FocusNode();
    final _passwordFocusNode = FocusNode();
    final _emailFocusNode = FocusNode();

    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        ref
            .read(authenticationFormStateProvider.notifier)
            .setName(_nameController.text);
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        ref
            .read(authenticationFormStateProvider.notifier)
            .setPassword(_passwordController.text);
      }
    });

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        ref
            .read(authenticationFormStateProvider.notifier)
            .setEmail(_emailController.text);
      }
    });

    return Column(
      children: [
        const SizedBox(height: 20),
        // Register: Fullname field
        Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          shadowColor: Colors.black,
          child: TextFormField(
            focusNode: _nameFocusNode,
            controller: _nameController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.fullName,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              prefixIcon: Icon(
                Icons.person_2_outlined,
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
        // Register: E-Mail field
        Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          shadowColor: Colors.black,
          child: TextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
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
        // Register: Password field
        Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          shadowColor: Colors.black,
          child: TextFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            autofillHints: const [AutofillHints.password],
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon: Icon(
                Icons.key_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              hintStyle: TextStyle(
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
              authenticationForm.isValid(AuthenticationMode.signUp)
                  ? () => ref
                      .read(authenticationStoreProvider.notifier)
                      .register(
                        RegisterModel(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text,
                        ),
                      )
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
          child: Text(AppLocalizations.of(context)!.signUpTitle),
        ),
      ],
    );
  }
}
