import 'package:flutter/material.dart';

class ThemeColors {
  static const MaterialColor materialPrimaryColors = Colors.amber;

  static const primaryColor = Color.fromRGBO(31, 31, 33, 1);
  static const secondaryColor = Color.fromRGBO(79, 79, 83, 1);
  static const redGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 255, 6, 6),
      Color.fromARGB(255, 232, 56, 56),
      Color.fromARGB(171, 219, 92, 92),
    ],
  );

  static const greyColor = Color.fromRGBO(179, 179, 179, 1);
  static const primaryFontColor = Color.fromRGBO(255, 255, 255, 1);
  static const secondaryFontColor = Color.fromRGBO(141, 140, 140, 0.894);
}
