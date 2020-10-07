import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstNumber;
  int secondNumber;
  String result;
  String textToDisplay = "";
  String displayOperation = "";
  String operatorToPerform;
  void calculate(String btnvalue) {
    if (btnvalue == "C") {
      firstNumber = 0;
      secondNumber = 0;
      result = "";
      textToDisplay = "";
      displayOperation = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "*" ||
        btnvalue == "/") {
      firstNumber = int.parse(textToDisplay);
      displayOperation = textToDisplay + btnvalue;
      result = "";
      operatorToPerform = btnvalue;
    } else if (btnvalue == "=") {
      secondNumber = int.parse(textToDisplay);
      displayOperation = displayOperation + textToDisplay;
      if (operatorToPerform == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operatorToPerform == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operatorToPerform == "*") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operatorToPerform == "/") {
        result = (firstNumber / secondNumber).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnvalue).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButton(String value) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => calculate(value),
        child: Text(
          "$value",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calculator")),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.topRight,
                child: Text(
                  "$displayOperation",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textToDisplay",
                style: TextStyle(fontSize: 40.0),
              ),
            )),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        )));
  }
}
