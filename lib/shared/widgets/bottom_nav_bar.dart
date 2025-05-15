import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onHomePressed,
    required this.onRecipePressed,
    required this.onShoppingPressed,
  });

  final void Function() onHomePressed;
  final void Function() onRecipePressed;
  final void Function() onShoppingPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      notchMargin: 6,
      child: Row(
        children: [
          Expanded(
            child: Material(
              child: InkWell(
                onTap: onRecipePressed,
                child: Align(
                  child: Icon(
                    Icons.web_stories,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onShoppingPressed,
                child: Align(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
