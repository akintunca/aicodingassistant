import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/scaffold.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool? themeModeValuePref = prefs.getBool('themeModeValuePref');
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'AI Coding Assistant',
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: themeModeValuePref == null
        ? ThemeMode.system
        : themeModeValuePref
            ? ThemeMode.light
            : ThemeMode.dark,
    home: const MyScaffold(),
  ));
}
