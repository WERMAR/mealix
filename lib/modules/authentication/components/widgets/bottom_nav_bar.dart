import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      child: SizedBox(
        height: 60,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Left and Right nav icons
            Row(
              children: const [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.menu, color: Color(0xFF4C0082)),
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.shopping_cart, color: Color(0xFF4C0082)),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFFDAFF08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Button Pressed'),
                              content: const Text(
                                'You clicked the calendar button.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    },
                    child: const Icon(
                      Icons.calendar_month,
                      color: Color(0xFF161C29),
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
