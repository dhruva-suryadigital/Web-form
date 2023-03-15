import 'package:flutter/material.dart';

class Constants {
  static MaterialColor primaryColor = MaterialColor(0xff6A39F1, swatch);
  static Map<int, Color> get swatch => {
    50: const Color.fromRGBO(106, 57, 241, .1),
    100: const Color.fromRGBO(106, 57, 241, .2),
    200: const Color.fromRGBO(106, 57, 241, .3),
    300: const Color.fromRGBO(106, 57, 241, .4),
    400: const Color.fromRGBO(106, 57, 241, .5),
    500: const Color.fromRGBO(106, 57, 241, .6),
    600: const Color.fromRGBO(106, 57, 241, .7),
    700: const Color.fromRGBO(106, 57, 241, .8),
    800: const Color.fromRGBO(106, 57, 241, .9),
    900: const Color.fromRGBO(106, 57, 241, 1),
  };
  static const Color secondaryColor = Color(0xffC4C4C4);
  static const Color transparentColor = Colors.transparent;
}
