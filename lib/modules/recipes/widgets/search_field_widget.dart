import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/model/recipe_model.dart';
import '../store/recipes_provider.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary, // dunkler Hintergrund
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 8),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  return TextField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    onChanged:
                        (value) => ref
                            .read(searchQueryProvider.notifier)
                            .setSearchQuery(value),
                    decoration: InputDecoration(
                      hintText:
                          '${AppLocalizations.of(context)!.searchPlaceholder}...',
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      border: InputBorder.none,
                    ),
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

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.onSelect});

  final void Function(RecipeModel recipe) onSelect;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(
          searchQueryProvider.select(
            (state) => state.valueOrNull?.recipes ?? [],
          ),
        );
        if (state.isNotEmpty) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.separated(
              separatorBuilder:
                  (context, index) =>
                      Divider(color: Theme.of(context).colorScheme.surface),
              itemCount: state.length,
              itemBuilder: (context, index) {
                final recipe = state[index];
                return ListTile(
                  title: Text(
                    '${AppLocalizations.of(context)!.recipe}: ${recipe.title}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => onSelect(recipe),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class SearchFieldWithResultWidget extends StatelessWidget {
  const SearchFieldWithResultWidget({super.key, required this.onSelect});

  final void Function(RecipeModel recipe) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchFieldWidget(),
        const SizedBox(height: 2),
        SearchResultWidget(onSelect: onSelect),
      ],
    );
  }
}
