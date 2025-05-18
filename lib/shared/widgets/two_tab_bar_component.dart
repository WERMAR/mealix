import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/authentication/enum/tab_mode_enum.dart';
import '../authentication/store/authentication_provider.dart';

class TwoTabBar extends StatefulWidget {
  const TwoTabBar({
    super.key,
    required this.tab1Title,
    required this.tab1Content,
    required this.tab2Title,
    required this.tab2Content,
    required this.onTabChange,
  });
  final String tab1Title;
  final String tab2Title;

  final Widget tab1Content;
  final Widget tab2Content;

  final void Function(TabMode) onTabChange;

  @override
  State<TwoTabBar> createState() => _TwoTabBarState();
}

class _TwoTabBarState extends State<TwoTabBar> {
  _TwoTabBarState();

  TabMode _mode = TabMode.tab1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor:
                      _mode == TabMode.tab1
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _mode = TabMode.tab1;
                    widget.onTabChange(_mode);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        _mode == TabMode.tab1
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.tab1Title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor:
                      _mode == TabMode.tab2
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _mode = TabMode.tab2;
                    widget.onTabChange(_mode);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        _mode == TabMode.tab2
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.tab2Title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        switch (_mode) {
          TabMode.tab1 => widget.tab1Content,

          TabMode.tab2 => widget.tab2Content,
        },
      ],
    );
  }
}
