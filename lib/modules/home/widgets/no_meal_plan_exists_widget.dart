import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../helper/colors_darktheme_option.dart';

class NoMealPlanExists extends StatelessWidget {
  const NoMealPlanExists({super.key, required this.onCreateMealPlan});

  final VoidCallback onCreateMealPlan;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.noMealPlanExisting,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: ThemeColors.themedWhite(context),
          ),
          onPressed: onCreateMealPlan,
          child: Text(
            AppLocalizations.of(context)!.createMealPlan,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
