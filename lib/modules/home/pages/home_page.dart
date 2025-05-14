import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/authentication/store/authentication_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const String routeLocation = '/home';
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticationStoreProvider).valueOrNull;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          '{$auth}',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
