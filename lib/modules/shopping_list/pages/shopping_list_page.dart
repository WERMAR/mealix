import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../home/pages/home_page.dart';
import '../../home/widgets/profile_badge.dart';
import '../../recipes/pages/recipes_page.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  static String get routeLocation => '/shopping-list';
  static String get routeName => 'shopping-list';

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
        title: const Text('Mein Zuhause (My House?)'),
        actions: const [ProfileBadge(initials: 'MW')],
      ),
      endDrawer: MenuWidget(),
      body: const Text('test'),
      bottomNavigationBar: CustomBottomNavBar(
        onLeftTabPressed: () => context.go(RecipesPage.routeLocation),
        onRightTabPressed: () => context.go(ShoppingListPage.routeLocation),
      ),
    );
  }
}
