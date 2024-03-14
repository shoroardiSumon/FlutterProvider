
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.indigo,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade100
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: Colors.blue.shade300
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: Colors.grey.shade900
  )
);