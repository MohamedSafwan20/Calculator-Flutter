import 'package:calculator/config/colors.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Light theme
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: lightColors["primary"],
              secondary: lightColors["secondary"],
              background: lightColors["disabled"],
              brightness: Brightness.light)),
      // Dark theme
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: darkColors["primary"],
              secondary: darkColors["secondary"],
              background: darkColors["disabled"],
              brightness: Brightness.dark)),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
