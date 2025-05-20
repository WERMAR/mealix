import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../shared/widgets/two_tab_bar_component.dart';
import '/modules/home/widgets/create_household_form.dart';
import '/modules/home/widgets/join_household_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/../../modules/authentication/enum/tab_mode_enum.dart';

final tabModeProvider = StateProvider<TabMode>((ref) => TabMode.tab1);


class HouseholdManagerPage extends ConsumerWidget {
  const HouseholdManagerPage({super.key});

  static String get routeLocation => '/household';
  static String get routeName => 'household';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mode = ref.watch(tabModeProvider);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.householdTitle,
          style: theme.textTheme.headlineLarge,
        ),
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
              child: TwoTabBar(
                tab1Title: AppLocalizations.of(context)!.tabCreateHousehold,
                tab2Title: AppLocalizations.of(context)!.tabJoinHousehold,
                tab1Content: const CreateHouseholdForm(),
                tab2Content: const JoinHouseholdForm(),
                onTabChange: (newMode) {
                  ref.read(tabModeProvider.notifier).state = newMode;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


