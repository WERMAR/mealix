import 'package:flutter/material.dart';
import 'package:mealix/modules/authentication/enum/tab_mode_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealix/shared/authentication/store/authentication_provider.dart';

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

  TabMode _mode = TabMode.tab1;

  @override
  void initState() {
    super.initState();
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
          TabMode.tab1 => Column(
            children: [
              widget.tab1Content,
              const SizedBox(height: 16),
              Consumer(
                builder: (context, ref, _) {
                  return TextButton(
                    onPressed: () {
                      final notifier = ref.read(
                        authenticationStoreProvider.notifier,
                      );
                      notifier.logInWithEmailAndPassword(
                        'gceorge@gmail.com',
                        '123456',
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text("Log in as George (Test)"),
                  );
                },
              ),
            ],
          ),
          TabMode.tab2 => widget.tab2Content,
        },
      ],
    );
  }
}
