import 'package:flutter/material.dart';

class Colorses {
  final Color primary = Color(0xFF0CB6F2);
  final Color info = Color(0xFF00DBDA);
  final Color background = Color(0xFF0CF2B1);
  final Color secondary = Color(0xFF2389DB);
  final Color danger = Color(0xFFDB2923);
  final Color dark = Color(0xFF00435C);
  final Color success = Color(0xFF00DB73);
  // final List<Color> gradient = [Color(0xff9C1511), Colors.red];
  static Map<int, Color> color = {
    50: Color.fromRGBO(69, 117, 107, .1),
    100: Color.fromRGBO(69, 117, 107, .2),
    200: Color.fromRGBO(69, 117, 107, .3),
    300: Color.fromRGBO(69, 117, 107, .4),
    400: Color.fromRGBO(69, 117, 107, .5),
    500: Color.fromRGBO(69, 117, 107, .6),
    600: Color.fromRGBO(69, 117, 107, .7),
    700: Color.fromRGBO(69, 117, 107, .8),
    800: Color.fromRGBO(69, 117, 107, .9),
    900: Color.fromRGBO(69, 117, 107, 1),
  };

  MaterialColor colorCustom = MaterialColor(0xFFD0EDBF, color);
}

final colores = Colorses();
