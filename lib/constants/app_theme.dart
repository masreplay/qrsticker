import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

TextTheme textTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 48, fontWeight: FontWeight.w600, color: Colors.black),
    headline2: TextStyle(
        fontSize: 40, fontWeight: FontWeight.w600, color: Colors.black),
    headline3: TextStyle(
        fontSize: 36, fontWeight: FontWeight.w600, color: Colors.black),
    headline4: TextStyle(
        fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
    headline5: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    headline6: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    subtitle1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    subtitle2: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    button: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
    bodyText1: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    bodyText2: TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
    caption: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
    overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        color: Color(0xFF3A3D46)));

final ThemeData themeData = new ThemeData(
    textTheme: textTheme
);

final ThemeData themeDataDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  accentColorBrightness: Brightness.dark,
);
