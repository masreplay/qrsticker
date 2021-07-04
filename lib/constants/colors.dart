import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Color grey = Color(0xFF8E9AAD);

  static const MaterialColor amber =   MaterialColor(
      _amberPrimaryValue, <int, Color>{
    50: const Color(0xFFFFFde8),
    100: const Color(0xFFFFF9c6),
    200: const Color(0xFFFFF5a0),
    300: const Color(0xFFFFF07b),
    400: const Color(0xFFFdeb5d),
    500: const Color(0xFFFbe642),
    600: const Color(0xFFFFd942),
    700: const Color(0xFFFcc13b),
    800: const Color(_amberPrimaryValue),
    900: const Color(0xFFF48226)
  });
  static const int _amberPrimaryValue = 0xFFF9AA33;

  static const MaterialColor white =   MaterialColor(
      _whitePrimaryValue, <int, Color>{
    50: const  Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(_whitePrimaryValue),
    900: const Color(0xFFFFFFFF)
  });
  static const int _whitePrimaryValue = 0xFFFFFFFF;

  static const MaterialColor blue =
      MaterialColor(_bluePrimaryValue, <int, Color>{
    50: const Color(0xFFe5F6Fb),
    100: const Color(0xFFbde7F5),
    200: const Color(0xFF97d7ee),
    300: const Color(0xFF79c6e6),
    400: const Color(0xFF6abae1),
    500: const Color(0xFF62aedb),
    600: const Color(0xFF5aa1cd),
    700: const Color(_bluePrimaryValue),
    800: const Color(0xFF4b7da5),
    900: const Color(0xFF3e5d81)
  });
  static const int _bluePrimaryValue = 0xFF518EB9;

  static const MaterialColor indigo =
      MaterialColor(_indigoPrimaryValue, <int, Color>{
    50: const Color(0xFFe6e9ee),
    100: const Color(0xFFbFc8d6),
    200: const Color(0xFF97a5ba),
    300: const Color(0xFF70829e),
    400: const Color(0xFF51698b),
    500: const Color(0xFF32507b),
    600: const Color(0xFF2c4973),
    700: const Color(0xFF244068),
    800: const Color(_indigoPrimaryValue),
    900: const Color(0xFF172642)
  });
  static const int _indigoPrimaryValue = 0xFF1E365B;

  static const MaterialColor pink =
      MaterialColor(_pinkPrimaryValue, <int, Color>{
    50: const Color(0xFFffebf0),
    100: const Color(0xFFffcdd6),
    200: const Color(0xFFf89a9f),
    300: const Color(0xFFf27179),
    400: const Color(_pinkPrimaryValue),
    500: const Color(0xFFff333c),
    600: const Color(0xFFf7283c),
    700: const Color(0xFFe51a35),
    800: const Color(0xFFd80d2e),
    900: const Color(0xFFc80021)
  });
  static const int _pinkPrimaryValue = 0XFFFF4B58;
}
