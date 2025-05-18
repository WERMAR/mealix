import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateHouseholdForm extends StatefulWidget {
  const CreateHouseholdForm({super.key});

  @override
  State<CreateHouseholdForm> createState() => _CreateHouseholdFormState();
}

class _CreateHouseholdFormState extends State<CreateHouseholdForm> {
  final _controller = TextEditingController();

  void _handleCreate() {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.createHouseholdEmptyError),
        ),
      );
      return;
    }

    // TODO: Call Firestore to create a new household
    print('Creating household with name: $name');
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: local.createHouseholdLabel,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _handleCreate,
          child: Text(local.createHouseholdButton),
        ),
      ],
    );
  }
}
