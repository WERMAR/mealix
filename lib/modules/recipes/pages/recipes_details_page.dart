import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RecipesDetailsPage extends ConsumerWidget {
  final String id;

  const RecipesDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recipeDetailsTitle),
      ),

      body: Center(child: Text('Recipe ID: $id')),
    );
  }
}
