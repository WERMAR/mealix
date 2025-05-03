import 'package:flutter/material.dart';
import 'package:mealix/modules/authentication/enum/authentication_mode_enum.dart';

class TwoTabBar extends StatefulWidget {
  const TwoTabBar({
    super.key,
    required this.tab1Title,
    required this.tab1Content,
    required this.tab2Title,
    required this.tab2Content,
  });
  final String tab1Title;
  final String tab2Title;

  final Widget tab1Content;
  final Widget tab2Content;

  @override
  State<TwoTabBar> createState() => _TwoTabBarState();
}

class _TwoTabBarState extends State<TwoTabBar> {
  _TwoTabBarState();

  late String tab1Title;
  late String tab2Title;
  TabMode _mode = TabMode.tab1;

  late Widget tab1Content;
  late Widget tab2Content;

  @override
  void initState() {
    super.initState();
    tab1Title = widget.tab1Title;
    tab2Title = widget.tab2Title;

    tab1Content = widget.tab1Content;
    tab2Content = widget.tab2Content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _mode == TabMode.tab1
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _mode = TabMode.tab1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color:
                        _mode == TabMode.tab1
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tab1Title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          _mode == TabMode.tab1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _mode == TabMode.tab2
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _mode = TabMode.tab2;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color:
                        _mode == TabMode.tab2
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tab2Title,
                    style: TextStyle(
                      color:
                          _mode == TabMode.tab2
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        switch (_mode) {
          TabMode.tab1 => tab1Content,
          TabMode.tab2 => tab2Content,
        },
      ],
    );
  }
}
