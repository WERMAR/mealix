import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    final shoppingList = ref.watch(shoppingListStoreProvider);
    final items = shoppingList.valueOrNull?.items ?? [];
    final groupedItems = groupBy(items, (item) => item.groceryListGroup);
    //final grouped = groupIngredientsByCategory(ingredients);

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children:
            shoppingList.hasValue && groupedItems.isNotEmpty
                ? groupedItems.entries.map((entry) {
                  final items = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          entry.key.name, // use displayName if needed
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children:
                              items.map((ingredient) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 12,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                      color:
                                                          colorScheme.onSurface,
                                                    ),
                                                children: [
                                                  TextSpan(
                                                    text: ingredient.name,
                                                  ),
                                                  if (ingredient.quantity > 0)
                                                    TextSpan(
                                                      text:
                                                          '  ${ingredient.quantity} ${ingredient.unit.name}',
                                                      style: TextStyle(
                                                        color:
                                                            colorScheme
                                                                .secondary,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Checkbox(
                                          value: ingredient.isChecked,
                                          onChanged: (val) {
                                            ref
                                                .read(
                                                  shoppingListStoreProvider
                                                      .notifier,
                                                )
                                                .updateItem(
                                                  ingredient.copyWith(
                                                    isChecked: val ?? false,
                                                  ),
                                                );
                                          },
                                          activeColor: colorScheme.primary,
                                        ),
                                      ],
                                    ),
                                    const Divider(height: 1, thickness: 0.5),
                                  ],
                                );
                              }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList()
                : [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.noShoppingList,
                          style: textTheme.bodyLarge!.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => context.go(HomePage.routeLocation),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.surface,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(local.goToWeeklyPlan),
                        ),
                      ],
                    ),
                  ),
                ],
      ),
    );
  }
}
