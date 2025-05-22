import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onLeftTabPressed,
    required this.onRightTabPressed,
  });

  final void Function() onLeftTabPressed;
  final void Function() onRightTabPressed;

  @override
  Widget build(BuildContext context) {
    const leftTabURI = '/recipes';
    const rightTabURI = '/shopping-list';
    final activeURI =
    GoRouter.of(context).routeInformationProvider.value.uri.toString();

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Material(
              color:
              isActiveURI(leftTabURI, activeURI)
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.transparent,
              child: InkWell(
                onTap: onLeftTabPressed,
                child: SizedBox(
                  child: Center(
                    child: Icon(
                      Icons.web_stories,
                      color:
                      isActiveURI(leftTabURI, activeURI)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color:
              isActiveURI(rightTabURI, activeURI)
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.transparent,
              child: InkWell(
                onTap: onRightTabPressed,
                child: SizedBox(
                  child: Align(
                    child: Icon(
                      Icons.shopping_cart,
                      color:
                      isActiveURI(rightTabURI, activeURI)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isActiveURI(String tabURI, String activeURI) {
    return activeURI.contains(tabURI);
  }
}