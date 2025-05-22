import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/authentication/store/authentication_provider.dart';

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.surface, colorScheme.secondary],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.25),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final username = ref.watch(
              authenticationStoreProvider.select(
                (state) => state.valueOrNull?.user?.name ?? 'X X',
              ),
            );
            return Text(
              '${username.split(' ')[0].substring(0, 1).toUpperCase()}${username.split(' ')[1].substring(0, 1).toUpperCase()}',
              style: theme.textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
