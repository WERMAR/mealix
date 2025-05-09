import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mealix/modules/authentication/model/register_model.dart';

class RegisterComponent extends StatelessWidget {
  RegisterComponent({super.key, required this.onRegister});

  final void Function(RegisterModel) onRegister;

  final _registerForm = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerForm,
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Register: Fullname field
          Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(8),
            shadowColor: Colors.black,
            child: TextFormField(
              controller: _fullNameController,
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? AppLocalizations.of(context)!.required
                          : null,
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
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? AppLocalizations.of(context)!.required
                          : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
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
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? AppLocalizations.of(context)!.required
                          : null,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
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
                true
                    ? () => onRegister(
                      RegisterModel(
                        name: _fullNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
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
      ),
    );
  }

  isFormValid() {
    return _registerForm.currentState?.validate() ?? false;
  }
}
