import 'package:flutter/material.dart';

class ThemedCircularSpinner extends StatelessWidget {
  const ThemedCircularSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 4,
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
