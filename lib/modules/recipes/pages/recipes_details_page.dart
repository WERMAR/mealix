import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipesDetailsPage extends ConsumerWidget {
  const RecipesDetailsPage({super.key});
  static const String routeName = '/recipes-details';
  static const String routeLocation = '/recipes-details/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? id = ModalRoute.of(context)?.settings.arguments as String?;
    if (id == null) {
      return const Center(child: Text('No ID provided'));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Details')),
      body: Center(child: Text('Recipe ID: $id')),
    );
  }
}
