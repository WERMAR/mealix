import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../helper/date_helper.dart';
import '../../recipes/widgets/search_field_widget.dart';
import '../store/meal_list_provider.dart';

class CreateMealPlan extends StatelessWidget {
  const CreateMealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.67,
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(createMealListStoreProvider);
                return LinearProgressIndicator(
                  value: state.progress,
                  minHeight: 5,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  color: Theme.of(context).colorScheme.secondary,
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                return SearchFieldWithResultWidget(
                  onSelect:
                      (recipe) => ref
                          .read(createMealListStoreProvider.notifier)
                          .addRecipeToAdjustedList(recipe),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Your current meal plan',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 270,
              child: Consumer(
                builder: (context, ref, child) {
                  final mealPlan = ref.watch(
                    createMealListStoreProvider.select(
                      (state) => state.createMealList,
                    ),
                  );
                  if (mealPlan.isEmpty) {
                    return const Text('No recipes selected');
                  }
                  return ReorderableListView.builder(
                    itemCount: mealPlan.length,
                    onReorder: (oldIndex, newIndex) {
                      ref
                          .read(createMealListStoreProvider.notifier)
                          .reorderAdjustedList(oldIndex, newIndex);
                    },
                    itemBuilder: (context, index) {
                      final meal = mealPlan[index];
                      return ListTile(
                        titleTextStyle: Theme.of(context).textTheme.titleMedium,
                        subtitleTextStyle:
                            Theme.of(context).textTheme.bodyMedium,
                        tileColor: Theme.of(context).colorScheme.primary,
                        key: ValueKey(meal),
                        title: Text(
                          '${DateHelper.getFormattedDate(context, 'EEEE', meal.date)}: ${DateFormat('dd.MM.yyyy').format(meal.date)}',
                        ),
                        subtitle: Text(meal.recipe.title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed:
                              () => ref
                                  .read(createMealListStoreProvider.notifier)
                                  .removeRecipe(index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
