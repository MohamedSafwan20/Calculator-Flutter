import 'package:calculator/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _historyExpression = ["", "", ""];
  List<String> _typingExpression = ["", "", ""];

  void _addNumberToExpression({required String number}) {
    if (_typingExpression[1].isNotEmpty) {
      if (number != "." ||
          (number == "." && !_typingExpression[2].contains(number))) {
        setState(() {
          _typingExpression[2] = _typingExpression[2] + number;
        });
      }
    } else {
      if ((number == "." && !_typingExpression[0].contains(number)) ||
          number != ".") {
        setState(() {
          _typingExpression[0] = _typingExpression[0] + number;
        });
      }
    }
  }

  void _addOperatorToExpression({required String operator}) {
    if (_typingExpression[0].isNotEmpty) {
      if (_typingExpression[2].isNotEmpty) {
        _calculateExpression();
      } else {
        setState(() {
          _typingExpression[1] = " $operator ";
        });
      }
    }
  }

  void _popFromExpression() {
    if (_typingExpression[2].isNotEmpty) {
      setState(() {
        _typingExpression[2] =
            _typingExpression[2].substring(0, _typingExpression[2].length - 1);
      });
    } else if (_typingExpression[1].isNotEmpty) {
      setState(() {
        _typingExpression[1] = "";
      });
    } else if (_typingExpression[0].isNotEmpty) {
      setState(() {
        _typingExpression[0] =
            _typingExpression[0].substring(0, _typingExpression[0].length - 1);
      });
    }
  }

  void _clearAllExpressions() {
    setState(() {
      _historyExpression = ["", "", ""];
      _typingExpression = ["", "", ""];
    });
  }

  void _calculateExpression() {
    if (_typingExpression[1].isNotEmpty) {
      num result = Utils.calculateTwoNumbers(
          number1: num.parse(_typingExpression[0]),
          number2: num.parse(_typingExpression[2]),
          operator: _typingExpression[1]);

      setState(() {
        _historyExpression = _typingExpression;
        _typingExpression = [result.toString(), "", ""];
      });
    } else {
      num result = Utils.calculateTwoNumbers(
          number1: num.parse(_typingExpression[0]),
          number2: num.parse(_historyExpression[2]),
          operator: _historyExpression[1]);

      setState(() {
        _historyExpression[0] = _typingExpression[0];
        _typingExpression = [result.toString(), "", ""];
      });
    }
  }

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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text: _historyExpression[0],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: _isDarkTheme ? Colors.white : Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: _historyExpression[1],
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          TextSpan(text: _historyExpression[2]),
                        ],
                      ),
                    ),
                  ),
                  SelectableText.rich(
                    TextSpan(
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
                                  _clearAllExpressions();
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
                                  _popFromExpression();
                                },
                                onLongPress: () {
                                  _clearAllExpressions();
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
                                onPressed: () {
                                  _addOperatorToExpression(operator: "%");
                                },
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
                                  _addOperatorToExpression(operator: "/");
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
                                  _addNumberToExpression(number: "7");
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
                                onPressed: () {
                                  _addNumberToExpression(number: "8");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "9");
                                },
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
                                onPressed: () {
                                  _addOperatorToExpression(operator: "x");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "4");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "5");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "6");
                                },
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
                                onPressed: () {
                                  _addOperatorToExpression(operator: "-");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "1");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "2");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "3");
                                },
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
                                onPressed: () {
                                  _addOperatorToExpression(operator: "+");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: "0");
                                },
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
                                onPressed: () {
                                  _addNumberToExpression(number: ".");
                                },
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
                                onPressed: () {
                                  _calculateExpression();
                                },
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
