import 'package:flutter/material.dart';

final ThemeData mainThemData = ThemeData(
  primarySwatch: Colors.indigo,
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    elevation: 5,
  ),
  appBarTheme: AppBarTheme(
    elevation: 5,
  ),
);

final double spaceSize = 15;