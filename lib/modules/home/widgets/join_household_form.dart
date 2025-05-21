import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    return TextFormField(
      controller: JoinHouseholdForm.controller,
      decoration: InputDecoration(
        hintText: local.createHouseholdLabel,
        prefixIcon: const Icon(Icons.home_outlined),
      ),
    );
  }
}

// ✅ Static helper to read from anywhere
class JoinHouseholdFormState {
  static String? getEnteredName() {
    final name = JoinHouseholdForm.controller.text.trim();
    return name.isEmpty ? null : name;
  }
}
