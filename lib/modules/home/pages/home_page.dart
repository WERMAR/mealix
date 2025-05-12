import 'package:flutter/material.dart';
import 'package:mealix/modules/authentication/components/widgets/profile_badge.dart';
import 'package:mealix/modules/authentication/components/widgets/date_range_selector.dart';
import 'package:mealix/modules/authentication/components/widgets/day_meal_card.dart';
import 'package:mealix/modules/authentication/components/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Placeholder state for date range and meal data
  DateTimeRange selectedWeek = DateTimeRange(
    start: DateTime(2025, 4, 14),
    end: DateTime(2025, 4, 21),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161C29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF242F49),
        title: const Text('Mein Zuhause (My House?)'),
        actions: const [ProfileBadge(initials: 'MW')],
      ),
      body: Column(
        children: [
          DateRangeSelector(
            startDate: selectedWeek.start,
            endDate: selectedWeek.end,
            onPrevious: () {
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
            },
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              children: const [
                DayMealCard(
                  dayName: 'Montag',
                  date: '14.04.2025',
                  mealName: 'Nudeln mit Pesto',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  dayName: 'Dienstag',
                  date: '15.04.2025',
                  mealName: 'Nudeln mit Pesto',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  dayName: 'Mittwoch',
                  date: '16.04.2025',
                  mealName: 'Schnitzel mit Pommes',
                ),
                DayMealCard(
                  dayName: 'Donnerstag',
                  date: '17.04.2025',
                  mealName: 'Pizza',
                ),
                DayMealCard(
                  dayName: 'Freitag',
                  date: '18.04.2025',
                  mealName: 'Lasagne',
                  isTwoDayMeal: true,
                ),
                DayMealCard(
                  dayName: 'Samstag',
                  date: '19.04.2025',
                  mealName: 'Lasagne',
                  isTwoDayMeal: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
