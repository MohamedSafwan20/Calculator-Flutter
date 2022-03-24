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
              padding: const EdgeInsets.only(right: 30, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text: '892  ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: isDarkTheme ? Colors.white : Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'x',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          const TextSpan(text: '  100'),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "69655",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "C",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.backspace_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.percent,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.close_outlined,
                                    size: 30,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.remove_outlined,
                                    size: 30,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add_outlined,
                                    size: 30,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: TextButton(
                                onPressed: null,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ".",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                        Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "=",
                                    style: TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
