import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../store/recipes_provider.dart';

class CreateRecipe extends ConsumerWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createRecipeForm = ref.watch(createRecipeStoreProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
      ),
      child: Container(
        color: Theme.of(context).colorScheme.surface, // Dark background
        //padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Recipe Name Input
              TextFormField(
                initialValue: createRecipeForm.title,
                decoration: const InputDecoration(labelText: 'Rezeptname'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipe name';
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
                decoration: const InputDecoration(labelText: 'Online-Link'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter online link';
                  }
                  return null;
                },
                onChanged:
                    (value) => ref
                        .read(createRecipeStoreProvider.notifier)
                        .setOnlineLink(value),
              ),
              const SizedBox(height: 20),

              // Preparation Steps Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Zubereitungsschritte',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: createRecipeForm.cookingSteps[index],
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
                    'Zutaten für eine Portion',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
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
              const SizedBox(height: 20),

              // Upload Image Button
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => print('Test'), // Pass the context
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF343a40),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.upload_file, color: Colors.green),
                          const SizedBox(width: 10),
                          Text(
                            'Bild hochladen',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Display the selected image
                    if (createRecipeForm.imageUrl.isNotEmpty)
                      Image.network(createRecipeForm.imageUrl, height: 100),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () => print('Test'), // Pass the context
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.save,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
