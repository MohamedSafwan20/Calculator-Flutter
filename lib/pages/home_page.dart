import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> arithmeticExpression = [];
  final List<String> _typingExpression = ["", "", ""];
  bool _isTypingSecondExpression = false;

  @override
  Widget build(BuildContext context) {
    bool _isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Setting status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: _isDarkTheme ? Colors.black : Colors.white,
        statusBarBrightness: _isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            _isDarkTheme ? Brightness.light : Brightness.dark));

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              color: _isDarkTheme ? Colors.black : Colors.white,
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
                            color: _isDarkTheme ? Colors.white : Colors.black),
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
                  RichText(
                    text: TextSpan(
                      text: _typingExpression[0],
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                          color: _isDarkTheme ? Colors.white : Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: _typingExpression[1],
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        TextSpan(text: _typingExpression[2]),
                      ],
                    ),
                  ),
                  // Text(
                  //   _typingExpression,
                  //   style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                  // )
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
                                onPressed: () {
                                  setState(() {
                                    arithmeticExpression = [];
                                    // _typingExpression = "";
                                  });
                                },
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
                                onPressed: () {
                                  if (_typingExpression[2].isNotEmpty) {
                                    setState(() {
                                      _typingExpression[2] =
                                          _typingExpression[2].substring(0,
                                              _typingExpression[2].length - 1);
                                    });
                                  } else if (_typingExpression[1].isNotEmpty) {
                                    setState(() {
                                      _typingExpression[1] = "";
                                    });
                                  } else {
                                    setState(() {
                                      _typingExpression[0] =
                                          _typingExpression[0].substring(0,
                                              _typingExpression[0].length - 1);
                                    });
                                  }
                                },
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
                                onPressed: () {
                                  setState(() {
                                    arithmeticExpression = [];
                                    _typingExpression[1] = " / ";
                                    _isTypingSecondExpression = true;
                                    // _typingExpression = _typingExpression + "  /  ";
                                  });
                                },
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
                                onPressed: () {
                                  setState(() {
                                    if (_isTypingSecondExpression) {
                                      _typingExpression[2] =
                                          _typingExpression[2] + "7";
                                    } else {
                                      _typingExpression[0] =
                                          _typingExpression[0] + "7";
                                    }
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
                                            color: _isDarkTheme
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
