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
  static const TextStyle responseStyle = TextStyle(color: secondaryColor);
  static BorderRadius buttonRadius = BorderRadius.circular(10);
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size(122, 40),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  static ShapeBorder alertShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
  static final List<String> country = ['India', 'America', 'Australia'];
  static const TextStyle responsePageStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle mainStyle = TextStyle(fontSize: 16);
  static const TextStyle alertContentStyle = TextStyle(fontSize: 14);
  static ButtonStyle actionStyle = OutlinedButton.styleFrom(
    elevation: 1,
    side: const BorderSide(
      color: Color(0xffD1D1D6),
    ),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static const TextStyle alertStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const EdgeInsets formPadding =
      EdgeInsets.symmetric(vertical: 16, horizontal: 32);
  static const TextStyle appBarStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Color(0xff6A39F1),
  );
}
