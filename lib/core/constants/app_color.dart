import 'package:flutter/material.dart';

const Color themeyellow = Color(0xFFFFF000); // Yellow (FFF000)
const Color themered = Color(0xFFFF0000);    // Red (FF0000)
const Color themeblue = Color(0xFF0000FF);  
const Color themewhite = Color(0xFFFFFFFF); // White (FFFFFF)

const int _primaryColor = 0xFFFF0000;

const MaterialColor appPrimarySwatch = MaterialColor(
  _primaryColor,
  <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(_primaryColor),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  },
);
