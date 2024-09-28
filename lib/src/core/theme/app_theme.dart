import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/core/theme/theme.dart';

class MyAppThemes {
  static final ThemeData lightTheme =
      ThemeData(useMaterial3: true, colorScheme: MaterialTheme.lightScheme());

  static final ThemeData darkTheme =
      ThemeData(useMaterial3: true, colorScheme: MaterialTheme.darkScheme());
}
