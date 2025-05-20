import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../recipes/pages/recipes_page.dart';
import '../../shopping_list/pages/shopping_list_page.dart';
import '../widgets/profile_badge.dart';
import '../widgets/seven_day_meal_list.dart';
import '../widgets/week_view.dart';

final selectedWeekProvider = StateProvider<DateTimeRange>((ref) {
  final start = getStartOfWeek(DateTime.now());
  return DateTimeRange(start: start, end: start.add(const Duration(days: 6)));
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static String get routeLocation => '/home';

  static String get routeName => 'home';

  Future<void> pickDate(BuildContext context, WidgetRef ref) async {
    final selectedWeek = ref.read(selectedWeekProvider);

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedWeek.start,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      final newStart = getStartOfWeek(picked);
      ref.read(selectedWeekProvider.notifier).state = DateTimeRange(
        start: newStart,
        end: newStart.add(const Duration(days: 6)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedWeek = ref.watch(selectedWeekProvider);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => pickDate(context, ref),
        backgroundColor: theme.colorScheme.secondary,
        shape: const CircleBorder(),
        child: Icon(
          Icons.calendar_month,
          color: theme.colorScheme.primary,
          size: 45,
        ),
      ),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          AppLocalizations.of(context)!.homeTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: const [ProfileBadge(initials: 'MW')],
      ),
      endDrawer: MenuWidget(),
      body: Column(
        children: [
          WeekViewCalendar(
            selectedWeek: selectedWeek,
            onPreviousWeek: () {
              ref.read(selectedWeekProvider.notifier).state = DateTimeRange(
                start: selectedWeek.start.subtract(const Duration(days: 7)),
                end: selectedWeek.end.subtract(const Duration(days: 7)),
              );
            },
            onNextWeek: () {
              ref.read(selectedWeekProvider.notifier).state = DateTimeRange(
                start: selectedWeek.start.add(const Duration(days: 7)),
                end: selectedWeek.end.add(const Duration(days: 7)),
              );
            },
          ),
          const SizedBox(height: 12),
          Expanded(child: SevenDayMealList(weekRange: selectedWeek)),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onLeftTabPressed: () => context.go(RecipesPage.routeLocation),
        onRightTabPressed: () => context.go(ShoppingListPage.routeLocation),
      ),
    );
  }
}

DateTime getStartOfWeek(DateTime date) {
  return date.subtract(Duration(days: date.weekday - 1));
}
