import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/date_range_selector.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../recipes/pages/recipes_page.dart';
import '../../shopping_list/pages/shopping_list_page.dart';
import '../widgets/day_meal_card.dart';
import '../widgets/profile_badge.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static String get routeLocation => '/home';
  static String get routeName => 'home';

  DateTimeRange selectedWeek = DateTimeRange(
    start: DateTime(2025, 4, 14),
    end: DateTime(2025, 4, 21),
  );

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
      body: Column(
        children: [
          DateRangeSelector(
            startDate: selectedWeek.start,
            endDate: selectedWeek.end,
            /*onPrevious: () {
              setState(() {
                selectedWeek = DateTimeRange(
                  start: selectedWeek.start.subtract(const Duration(days: 7)),
                  end: selectedWeek.end.subtract(const Duration(days: 7)),
                );
              });
            },
            onNext: () {
              setState(() {
                selectedWeek = DateTimeRange(
                  start: selectedWeek.start.add(const Duration(days: 7)),
                  end: selectedWeek.end.add(const Duration(days: 7)),
                );
              });
            },*/
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              children: [
                DayMealCard(
                  date: DateTime.parse('2025-04-14 00:00:00'),
                  mealName: 'Nudeln mit Pesto',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  date: DateTime.parse('2025-04-15 00:00:00'),
                  mealName: 'Nudeln mit Pesto',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  date: DateTime.parse('2025-04-16 00:00:00'),
                  mealName: 'Schnitzel mit Pommes',
                ),
                DayMealCard(
                  date: DateTime.parse('2025-04-17 00:00:00'),
                  mealName: 'Pizza',
                ),
                DayMealCard(
                  date: DateTime.parse('2025-04-18 00:00:00'),
                  mealName: 'Lasagne',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  date: DateTime.parse('2025-04-19 00:00:00'),
                  mealName: 'Lasagne',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  date: DateTime.parse('2025-04-20 00:00:00'),
                  mealName: 'Schnitzel mit Pommes',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onLeftTabPressed: () => context.go(RecipesPage.routeLocation),
        onRightTabPressed: () => context.go(ShoppingListPage.routeLocation),
      ),
    );
  }
}
