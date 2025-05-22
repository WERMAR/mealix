import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../helper/date_helper.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/menu_widget.dart';
import '../../../shared/widgets/themed_circular_spinner.dart';
import '../../recipes/pages/recipes_page.dart';
import '../../shopping_list/pages/shopping_list_page.dart';
import '../store/meal_list_provider.dart';
import '../widgets/create_meal_plan_widget.dart';
import '../widgets/no_meal_plan_exists_widget.dart';
import '../widgets/profile_badge.dart';
import '../widgets/seven_day_meal_list.dart';
import '../widgets/week_view.dart';

part 'home_page.g.dart';

@riverpod
class SelectedWeek extends _$SelectedWeek {
  @override
  DateTimeRange build() {
    final start = getStartOfWeek(DateTime.now());
    return DateTimeRange(start: start, end: start.add(const Duration(days: 6)));
  }

  // ignore: avoid_setters_without_getters
  set selectedWeek(DateTimeRange range) => state = range;
}

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
      lastDate: DateTime(2099),
    );

    if (picked != null) {
      ref
          .read(selectedWeekProvider.notifier)
          .selectedWeek = DateHelper.getRangeForDate(picked);
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
      body: Stack(
        children: [
          Column(
            children: [
              WeekViewCalendar(
                selectedWeek: selectedWeek,
                onPreviousWeek: () {
                  ref
                      .read(selectedWeekProvider.notifier)
                      .selectedWeek = DateTimeRange(
                    start: selectedWeek.start.subtract(const Duration(days: 7)),
                    end: selectedWeek.end.subtract(const Duration(days: 7)),
                  );
                },
                onNextWeek: () {
                  ref
                      .read(selectedWeekProvider.notifier)
                      .selectedWeek = DateTimeRange(
                    start: selectedWeek.start.add(const Duration(days: 7)),
                    end: selectedWeek.end.add(const Duration(days: 7)),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final mealListStore = ref.watch(mealListStoreProvider);
                  return mealListStore.when(
                    data: (data) {
                      if (data.initialList.isEmpty && !data.creationMode) {
                        return NoMealPlanExists(
                          onCreateMealPlan:
                              () =>
                                  ref
                                      .read(mealListStoreProvider.notifier)
                                      .setCreationMode(),
                        );
                      }
                      if (data.creationMode) {
                        return const CreateMealPlan();
                      }
                      return SevenDayMealList(meals: data.initialList);
                    },
                    error: (error, stackTrace) {
                      return Text('Error: $error');
                    },
                    loading: () {
                      return const Center(
                        child: Center(child: ThemedCircularSpinner()),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final mealListCreateProgress = ref.watch(
                createMealListStoreProvider.select((state) => state.progress),
              );
              if (mealListCreateProgress != 1) {
                return const SizedBox();
              }
              return Positioned(
                bottom: 5,
                right: 5,
                child: FloatingActionButton(
                  heroTag: 'saveMealListPlan',
                  shape: const CircleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  onPressed:
                      () =>
                          ref
                              .read(createMealListStoreProvider.notifier)
                              .saveMealListPlan(),
                  child: Icon(
                    Icons.save_alt_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
              );
            },
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

DateTime getStartOfWeek(DateTime date) {
  return date.subtract(Duration(days: date.weekday - 1));
}
