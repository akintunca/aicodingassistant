import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.light().copyWith(primary: Colors.blueGrey),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: Color.fromARGB(255, 212, 212, 212)),
        labelLarge: TextStyle(
            color: Color.fromARGB(255, 212, 212, 212),
            fontSize: 25,
            fontWeight: FontWeight.w700)),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color.fromARGB(255, 50, 50, 50),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 50, 50, 50)));
