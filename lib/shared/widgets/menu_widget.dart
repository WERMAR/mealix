import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../shared/model/recipe_model.dart';
import '../../shared/model/cooking_step_model.dart';
import '../../shared/model/ingredient_model.dart';
import '../../modules/home/pages/household_manager_page.dart';
import '../../shared/authentication/store/authentication_provider.dart';

class MenuWidget extends ConsumerWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final local = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  title: Text(local.menuHouseholdManager),
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(HouseholdManagerPage.routeLocation);
                  },
                ),

                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  title: Text(
                    local.menuSettings,
                    style: theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Settings pressed')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  title: Text(
                    local.menuAbout,
                    style: theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('About pressed')),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Test Recipe Page'),
            onTap: () {
              Navigator.of(context).pop();

//temp recipe
              final recipe = RecipeModel(
                id: 'test-recipe-123',
                title: 'Test1',
                description: 'Test2',
                imageUrl: 'https://www.google.com',
                onlineLink: 'https://www.google.com',
                isTwoDayMeal: true,
                createdAt: DateTime.parse('2025-05-22T15:06:40Z'),
                updatedAt: DateTime.parse('2025-05-22T15:06:40Z'),
                ingredients: [

                ],
                cookingSteps: [
                  CookingStep(
                    id: 'db2c3d56-99b8-42c1-83ad-6c3ecc71481c',
                    description: '22',
                    duration: 44,
                  ),
                ],
              );
              context.go('/recipe-details', extra: recipe);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              Navigator.of(context).pop();
              await ref.read(authenticationStoreProvider.notifier).logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
