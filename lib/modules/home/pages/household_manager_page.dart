import 'package:flutter/material.dart';
import '/../shared/widgets/two_tab_bar_component.dart';
import '/modules/home/widgets/create_household_form.dart';
import '/modules/home/widgets/join_household_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/../../modules/authentication/enum/tab_mode_enum.dart';

class HouseholdManagerPage extends StatelessWidget {
  const HouseholdManagerPage({super.key});

  static String get routeLocation => '/household';

  static String get routeName => 'household';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.householdTitle,
            style: Theme.of(context).textTheme.headlineLarge),

    backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/household.png',
                width: double.infinity,
                height: 400,
                fit: BoxFit.contain,
              ),
            ),


            const SizedBox(height: 24),
            Expanded(
              // FIXME: cannot change names of tabs, think its because sharing state when used at login page

            child: TwoTabBar(
                tab1Title: AppLocalizations.of(context)!.tabCreateHousehold,
                tab2Title: AppLocalizations.of(context)!.tabJoinHousehold,
                tab1Content: const CreateHouseholdForm(),
                tab2Content: const JoinHouseholdForm(),
                onTabChange: (mode) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
