import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipesDetailsPage extends ConsumerWidget {
  final String id;

  const RecipesDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Details')),
      body: Center(child: Text('Recipe ID: $id')),
    );
  }
}
