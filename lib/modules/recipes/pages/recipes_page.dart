import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../../shared/widgets/themed_circular_spinner.dart';
import '../../home/pages/home_page.dart';
import '../../home/widgets/profile_badge.dart';
import '../../shopping_list/pages/shopping_list_page.dart';
import '../store/recipes_provider.dart';
import '../widgets/create_recipe_widget.dart';
import '../widgets/search_field_widget.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  static String get routeLocation => '/recipes';
  static String get routeName => 'recipes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const CircleBorder(),
        elevation: 10,
        onPressed: () => context.go(HomePage.routeLocation),
        child: Icon(
          Icons.calendar_month,
          color: Theme.of(context).colorScheme.primary,
          size: 45,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          AppLocalizations.of(context)!.recipesTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: const [ProfileBadge(initials: 'MW')],
      ),
      endDrawer: MenuWidget(),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SearchFieldWidget(),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.lastRecipes,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    final data = ref.watch(firebaseRecipesProvider);
                    return data.when(
                      data: (data) {
                        return Expanded(
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 200,
                              crossAxisCount: 2,
                            ),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(
                                      data[index].imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                          ) {
                                        return Image.asset(
                                          'assets/images/placeholder.png',
                                        );
                                      },
                                    ),
                                    ColoredBox(
                                      color: Colors.black38,
                                      child: Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          data[index].title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                      error: (error, stackTrace) {
                        return Text('Error: $error');
                      },
                      loading: () {
                        return const Expanded(
                          child: Center(child: ThemedCircularSpinner()),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.recipeSuggestion,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    final data = ref.watch(spoonacularRecipesProvider);
                    return data.when(
                      data: (data) {
                        return Expanded(
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 200,
                              crossAxisCount: 2,
                            ),
                            itemCount: data.results.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(
                                      data.results[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                    ColoredBox(
                                      color: Colors.black38,
                                      child: Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          data.results[index].title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                      error: (error, stackTrace) {
                        return Text('Error: $error');
                      },
                      loading: () {
                        return const Expanded(
                          child: Center(child: ThemedCircularSpinner()),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: FloatingActionButton(
                heroTag: 'createRecipe',
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: const CircleBorder(),
                elevation: 10,
                onPressed: () => _onCreateRecipe(context),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                  size: 45,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onLeftTabPressed: () => context.go(RecipesPage.routeLocation),
        onRightTabPressed: () => context.go(ShoppingListPage.routeLocation),
      ),
    );
  }

  void _onCreateRecipe(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5),
              Text(
                AppLocalizations.of(context)!.addRecipe,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 1,
              ),
              const CreateRecipe(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}