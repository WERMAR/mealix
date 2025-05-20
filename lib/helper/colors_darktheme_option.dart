// TODO: This class is just a workaround - there are better ways to do this

import 'package:flutter/material.dart';

class ThemeColors {
  static Color themedWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  static Color themedBlack(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
  }
}
