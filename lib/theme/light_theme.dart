import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 50, 50, 50),
    ),
    primarySwatch: Colors.blueGrey,
    textTheme: const TextTheme(
        labelLarge: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.white));
