import 'package:calculator/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Setting status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: isDarkTheme ? Colors.black : Colors.white,
        statusBarBrightness: isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            isDarkTheme ? Brightness.light : Brightness.dark));

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              color: isDarkTheme ? Colors.black : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text("892 x 100"), Text("69655")],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              color: isDarkTheme
                  ? darkColors["disabled"]
                  : lightColors["disabled"],
              child: Text("df"),
            ),
          ),
        ],
      ),
    ));
  }
}
