import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../modules/home/store/household_repository.dart'; // adjust if needed

class JoinHouseholdForm extends StatefulWidget {
  const JoinHouseholdForm({super.key});

  static final TextEditingController controller = TextEditingController();

  @override
  State<JoinHouseholdForm> createState() => _JoinHouseholdFormState();
}

class _JoinHouseholdFormState extends State<JoinHouseholdForm> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      children: [
        TextFormField(
          controller: JoinHouseholdForm.controller,
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: local.createHouseholdLabel,
            hintStyle: theme.inputDecorationTheme.hintStyle,
            prefixIcon: Icon(
              Icons.home_outlined,
              color: theme.iconTheme.color,
            ),
            filled: true,
            fillColor: theme.inputDecorationTheme.fillColor,
            border: theme.inputDecorationTheme.border,
          ),
        ),
      ],
    );
  }
}

class JoinHouseholdFormState {
  static String? getEnteredName() {
    final name = JoinHouseholdForm.controller.text.trim();
    return name.isEmpty ? null : name;
  }
}
