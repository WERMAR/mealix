import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/authentication/store/authentication_provider.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.logout),
      tooltip: 'Logout',
      onPressed: () async {
        await ref.read(authenticationStoreProvider.notifier).logout();

        // Replace with your login route
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
    );
  }
}