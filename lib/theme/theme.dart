import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade100,
        secondary: Colors.grey,
        inversePrimary: Colors.black,
        inverseSurface: Colors.grey[900],
        tertiary: Colors.grey.shade600,
        onPrimary: Colors.white,
        onInverseSurface: Colors.black));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade600,
        inversePrimary: Colors.grey.shade100,
        inverseSurface: Colors.grey.shade300,
        tertiary: Colors.grey.shade200,
        onPrimary: Colors.black,
        onInverseSurface: Colors.white));
