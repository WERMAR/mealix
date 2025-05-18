import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// Shared widgets
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';

// Navigation targets
import '../../recipes/pages/recipes_page.dart';
import '../../shopping_list/pages/shopping_list_page.dart';
// Home-specific widgets
import '../widgets/profile_badge.dart';
import '../widgets/seven_day_meal_list.dart';
import '../widgets/week_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String get routeLocation => '/home';
  static String get routeName => 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTimeRange selectedWeek = DateTimeRange(
    start: getStartOfWeek(DateTime.now()),
    end: getStartOfWeek(DateTime.now()).add(const Duration(days: 6)),
  );

  void updateWeek(DateTimeRange newRange) {
    setState(() {
      selectedWeek = newRange;
    });
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedWeek.start,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      final newStart = getStartOfWeek(picked);
      setState(() {
        selectedWeek = DateTimeRange(
          start: newStart,
          end: newStart.add(const Duration(days: 6)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => pickDate(context),
        backgroundColor: theme.colorScheme.secondary,
        shape: const CircleBorder(),
        child: Icon(Icons.calendar_month, color: theme.colorScheme.primary),
      ),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          AppLocalizations.of(context)!.homeTitle,
          style: Theme.of(context).textTheme.headlineSmall, // or titleLarge
        ),
        actions: const [ProfileBadge(initials: 'MW')],
      ),

      endDrawer: MenuWidget(),
      body: Column(
        children: [
          WeekViewCalendar(
            selectedWeek: selectedWeek,
            onPreviousWeek:
                () => updateWeek(
              DateTimeRange(
                start: selectedWeek.start.subtract(const Duration(days: 7)),
                end: selectedWeek.end.subtract(const Duration(days: 7)),
              ),
            ),
            onNextWeek:
                () => updateWeek(
              DateTimeRange(
                start: selectedWeek.start.add(const Duration(days: 7)),
                end: selectedWeek.end.add(const Duration(days: 7)),
              ),
            ),
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