import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 14.0,
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: const ColorScheme(
      surface: Colors.white,
      onSurface: Colors.black,
      secondaryContainer: Colors.white,
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.black,
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18, fontWeight: FontWeight.w400),
  );
}
