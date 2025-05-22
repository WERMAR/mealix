import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helper/colors_darktheme_option.dart';
import '../../../shared/model/ingredient_model.dart';
import '../../../shared/widgets/dropdown_button.dart';
import '../store/recipes_provider.dart';

class CreateRecipe extends StatelessWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
      ),
      child: Form(
        key: _formKey,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.surface, // Dark background
          //padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Recipe Name Input
                Consumer(
                  builder: (context, ref, child) {
                    final createRecipeForm = ref.watch(
                      createRecipeStoreProvider,
                    );
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: createRecipeForm.title,
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.recipeName,
                                ),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(
                                      context,
                                    )!.recipeNameValidationError;
                                  }
                                  return null;
                                },
                                onChanged:
                                    (value) => ref
                                        .read(
                                          createRecipeStoreProvider.notifier,
                                        )
                                        .setTitle(value),
                              ),
                            ),
                            const SizedBox(width: 30),
                            // Online Link Input
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                initialValue: createRecipeForm.onlineLink,
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.onlineLink,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(
                                      context,
                                    )!.onlineLinkValidationError;
                                  }
                                  return null;
                                },
                                onChanged:
                                    (value) => ref
                                        .read(
                                          createRecipeStoreProvider.notifier,
                                        )
                                        .setOnlineLink(value),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        // Description Input
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: createRecipeForm.description,
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.description,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(
                                      context,
                                    )!.descriptionValidationError;
                                  }
                                  return null;
                                },
                                onChanged:
                                    (value) => ref
                                        .read(
                                          createRecipeStoreProvider.notifier,
                                        )
                                        .setDescription(value),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                initialValue: createRecipeForm.imageUrl,
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.imageURL,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(
                                      context,
                                    )!.imageURLValidationError;
                                  }
                                  return null;
                                },
                                onChanged:
                                    (value) => ref
                                        .read(
                                          createRecipeStoreProvider.notifier,
                                        )
                                        .setImageUrl(value),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text(
                              AppLocalizations.of(context)!.twoDayMeal,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Checkbox(
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              value: createRecipeForm.isTwoDayMeal,
                              onChanged:
                                  (value) => ref
                                      .read(createRecipeStoreProvider.notifier)
                                      .setIsTwoDayMeal(
                                        isTwoDayMeal: value ?? false,
                                      ),
                            ),
                          ],
                        ),
                        // Upload Image Button
                        const SizedBox(height: 30),
                        Divider(color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 5),

                        // Preparation Steps Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.cookingSteps,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: ThemeColors.themedWhite(context),
                              ),
                              onPressed: () {
                                ref
                                    .read(createRecipeStoreProvider.notifier)
                                    .addCookingStep();
                              },
                            ),
                          ],
                        ),
                        // Preparation Steps List
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: createRecipeForm.cookingSteps.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                key: ValueKey(
                                  createRecipeForm.cookingSteps[index].id,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        initialValue:
                                            createRecipeForm
                                                .cookingSteps[index]
                                                .description,
                                        decoration: InputDecoration(
                                          labelText: 'Schritt ${index + 1}',
                                          labelStyle:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge,
                                        ),
                                        onChanged:
                                            (newValue) => ref
                                                .read(
                                                  createRecipeStoreProvider
                                                      .notifier,
                                                )
                                                .updateDescriptionOfStep(
                                                  index,
                                                  newValue,
                                                ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter step ${index + 1}';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        initialValue:
                                            createRecipeForm
                                                .cookingSteps[index]
                                                .duration
                                                .toString(),
                                        decoration: InputDecoration(
                                          labelText: 'Dauer (in Min)',
                                          labelStyle:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge,
                                        ),
                                        onChanged:
                                            (newValue) => ref
                                                .read(
                                                  createRecipeStoreProvider
                                                      .notifier,
                                                )
                                                .updateDurationOfStep(
                                                  index,
                                                  newValue,
                                                ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter step ${index + 1}';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        ref
                                            .read(
                                              createRecipeStoreProvider
                                                  .notifier,
                                            )
                                            .removeCookingStep(index);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Divider(color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 5),
                        // Ingredients Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.ingredientForPortion,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: ThemeColors.themedWhite(context),
                              ),
                              //onPressed: _addIngredient,
                              onPressed:
                                  () =>
                                      ref
                                          .read(
                                            createRecipeStoreProvider.notifier,
                                          )
                                          .addIngredientsPerPortion(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Ingredients List
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: createRecipeForm.ingredients.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                key: ValueKey(
                                  createRecipeForm.ingredients[index].id,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        initialValue:
                                            createRecipeForm
                                                .ingredients[index]
                                                .name,
                                        decoration: InputDecoration(
                                          labelText: 'Zutat ${index + 1}',
                                        ),
                                        onChanged:
                                            (newValue) => ref
                                                .read(
                                                  createRecipeStoreProvider
                                                      .notifier,
                                                )
                                                .updateIngredientName(
                                                  index,
                                                  newValue,
                                                ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter ingredient ${index + 1}';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 240,
                                      child: CustomDropdownButton(
                                        data:
                                            GroceryListGroup.values
                                                .map<String>(
                                                  (elem) => elem.name,
                                                )
                                                .toList(),
                                        value:
                                            createRecipeForm
                                                .ingredients[index]
                                                .groceryListGroup
                                                .name,
                                        onChanged:
                                            (value) => ref
                                                .read(
                                                  createRecipeStoreProvider
                                                      .notifier,
                                                )
                                                .updateGroceryListGroup(
                                                  index,
                                                  GroceryListGroup.values
                                                      .firstWhere(
                                                        (element) =>
                                                            element.name ==
                                                            value,
                                                      ),
                                                ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed:
                                          () => ref
                                              .read(
                                                createRecipeStoreProvider
                                                    .notifier,
                                              )
                                              .removeIngredientsPerPortion(
                                                index,
                                              ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),

                Divider(color: Theme.of(context).colorScheme.primary),

                // Save Button
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed:
                            ref
                                    .watch(isCreateRecipeFormValidProvider)
                                    .where((x) => !x.isValid)
                                    .isEmpty
                                ? () => {
                                  ref
                                      .read(createRecipeStoreProvider.notifier)
                                      .createRecipe(),
                                  Navigator.pop(context),
                                }
                                : null, // Pass the context
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              AppLocalizations.of(context)!.save,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
