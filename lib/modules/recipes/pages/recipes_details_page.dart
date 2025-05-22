import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:mealix/shared/model/recipe_model.dart';
import 'package:mealix/modules/recipes/pages/recipes_page.dart';
import 'package:mealix/modules/shopping_list/pages/shopping_list_page.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../home/widgets/profile_badge.dart';

class RecipesDetailsPage extends ConsumerWidget {
  final RecipeModel recipe;

  const RecipesDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          local.recipeDetailsTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: const [ProfileBadge()],
      ),
      endDrawer: const MenuWidget(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Placeholder(fallbackHeight: 200),
            ),
            const SizedBox(height: 16),

            Text(
              recipe.title ?? 'Rezept',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            Text(
              'Zubereitungszeit: 20 Minuten',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                local.cookingSteps,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              children: recipe.cookingSteps.map((step) {
                return ListTile(
                  dense: true,
                  title: Text('${step.description} (${step.duration} min)'),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                local.ingredientsList,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              children: recipe.ingredients.map((i) {
                return ListTile(
                  dense: true,
                  title: Text(i.name ?? 'Unnamed Ingredient'),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            if (recipe.isTwoDayMeal)
              Chip(
                label: Text(local.twoDayMeal),
                backgroundColor: Colors.amber.shade100,
              ),

            const SizedBox(height: 16),


          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/home');
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const CircleBorder(),
        child: Icon(
          Icons.calendar_month,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        onLeftTabPressed: () => context.go(RecipesPage.routeLocation),
        onRightTabPressed: () => context.go(ShoppingListPage.routeLocation),
      ),
    );
  }
}