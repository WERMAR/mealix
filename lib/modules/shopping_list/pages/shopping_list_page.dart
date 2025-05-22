import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/model/ingredient_model.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../home/pages/home_page.dart';
import '../../home/widgets/profile_badge.dart';
import '../../recipes/pages/recipes_page.dart';
import '../store/shopping_list_provider.dart';

class ShoppingListPage extends ConsumerWidget {
  const ShoppingListPage({super.key});

  static String get routeLocation => '/shopping-list';
  static String get routeName => 'shopping-list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final ingredients = ref.watch(shoppingListProvider);
    final grouped = groupIngredientsByCategory(ingredients);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.secondary,
        shape: const CircleBorder(),
        elevation: 10,
        onPressed: () => context.go(HomePage.routeLocation),
        child: Icon(Icons.calendar_month, color: colorScheme.primary, size: 45),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(local.shoppingListTitle),
        actions: const [ProfileBadge()],
      ),
      endDrawer: const MenuWidget(),
      bottomNavigationBar: CustomBottomNavBar(
        onLeftTabPressed: () => context.go(RecipesPage.routeLocation),
        onRightTabPressed: () => context.go(ShoppingListPage.routeLocation),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children:
            grouped.entries.map((entry) {
              final category = entry.key;
              final items = entry.value;

              return ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  category,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children:
                    items.map((ingredient) {
                      return CheckboxListTile(
                        title: Text(ingredient.name),
                        value: false, // TODO: make this reactive
                        onChanged: (val) {
                          // TODO: implement checkbox state management
                        },
                      );
                    }).toList(),
              );
            }).toList(),
      ),
    );
  }
}
