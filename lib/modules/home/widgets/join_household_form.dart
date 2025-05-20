import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JoinHouseholdForm extends StatefulWidget {
  const JoinHouseholdForm({super.key});

  @override
  State<JoinHouseholdForm> createState() => _JoinHouseholdFormState();
}

class _JoinHouseholdFormState extends State<JoinHouseholdForm> {
  final _controller = TextEditingController();

  void _handleJoin() {
    final code = _controller.text.trim().toUpperCase();
    if (code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.joinHouseholdEmptyError),
        ),
      );
      return;
    }

    // TODO: Call Firestore to look up household by invite_code
    print('Joining household with invite code: $code');
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: local.joinHouseholdLabel),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _handleJoin,
          child: Text(local.joinHouseholdButton),
        ),
      ],
    );
  }
}
