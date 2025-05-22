import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helper/colors_darktheme_option.dart';
import '../store/household_provider.dart';

class CreateHouseholdForm extends ConsumerStatefulWidget {
  const CreateHouseholdForm({super.key});

  @override
  ConsumerState<CreateHouseholdForm> createState() => _CreateHouseholdFormState();
}

class _CreateHouseholdFormState extends ConsumerState<CreateHouseholdForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initial sync to provider
    _controller.addListener(() {
      final trimmedName = _controller.text.trim();
      ref.read(householdNameProvider.notifier).setName(trimmedName);
    });
  }

  String? get householdName => _controller.text.trim();

  void showEmptyError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.createHouseholdEmptyError),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _controller,
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
