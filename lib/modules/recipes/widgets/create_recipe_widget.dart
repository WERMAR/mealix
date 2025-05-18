import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helper/colors_darktheme_option.dart';
import '../store/recipes_provider.dart';

class CreateRecipe extends ConsumerWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createRecipeForm = ref.watch(createRecipeStoreProvider);

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
                TextFormField(
                  initialValue: createRecipeForm.title,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.recipeName,
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
                          .read(createRecipeStoreProvider.notifier)
                          .setTitle(value),
                ),
                const SizedBox(height: 20),

                // Online Link Input
                TextFormField(
                  initialValue: createRecipeForm.onlineLink,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.onlineLink,
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
                          .read(createRecipeStoreProvider.notifier)
                          .setOnlineLink(value),
                ),
                const SizedBox(height: 20),

                // Online Link Input
                TextFormField(
                  initialValue: createRecipeForm.description,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.description,
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
                          .read(createRecipeStoreProvider.notifier)
                          .setDescription(value),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  initialValue: createRecipeForm.imageUrl,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.imageURL,
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
                          .read(createRecipeStoreProvider.notifier)
                          .setImageUrl(value),
                ),

                // Upload Image Button
                const SizedBox(height: 20),

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
                        //color: Colors.white,
                      ),
                      //onPressed: _addPreparationStep,
                      onPressed: () => print('Test'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Preparation Steps List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: createRecipeForm.cookingSteps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue:
                                  createRecipeForm.cookingSteps[index],
                              decoration: InputDecoration(
                                labelText: 'Schritt ${index + 1}',
                              ),
                              /*onChanged:
                                (newValue) =>
                                    _updatePreparationStep(index, newValue),*/
                              onChanged: (newValue) => () => print(newValue),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter step ${index + 1}';
                                }
                                return null;
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            //onPressed: () => _removePreparationStep(index),
                            onPressed: () => print('Test'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Ingredients Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.ingredientForPortion,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: ThemeColors.themedWhite(context),
                      ),
                      //onPressed: _addIngredient,
                      onPressed: () => print('Test'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Ingredients List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: createRecipeForm.ingredients.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue:
                                  createRecipeForm.ingredients[index].name,
                              decoration: InputDecoration(
                                labelText: 'Zutat ${index + 1}',
                              ),
                              /*onChanged:
                                (newValue) =>
                                    _updateIngredient(index, newValue),*/
                              onChanged: (newValue) => () => print(newValue),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter ingredient ${index + 1}';
                                }
                                return null;
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            //onPressed: () => _removeIngredient(index),
                            onPressed: () => print('Test'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.primary),

                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed:
                        ref
                                .watch(isCreateRecipeFormValidProvider)
                                .where((x) => !x.isValid)
                                .isEmpty
                            ? () => {print(createRecipeForm)}
                            : null, // Pass the context
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
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
