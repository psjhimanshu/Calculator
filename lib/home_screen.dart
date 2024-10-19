import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Allows the layout to adjust when the keyboard is shown
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        // Make the screen scrollable
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Display user input and answer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              // The rest of the buttons
              Column(
                children: [
                  _buildButtonRow(['AC', '+/-', '%', '/']),
                  _buildButtonRow(['7', '8', '9', 'x']),
                  _buildButtonRow(['4', '5', '6', '-']),
                  _buildButtonRow(['1', '2', '3', '+']),
                  _buildButtonRow(['0', '.', 'DEL', '=']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A helper method to create a row of buttons
  Widget _buildButtonRow(List<String> titles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space buttons
        children: titles.map((title) {
          return MyButton(
            title: title,
            onPress: () {
              setState(() {
                if (title == 'AC') {
                  userInput = '';
                  answer = '0';
                } else if (title == '=') {
                  equalPressed();
                } else if (title == 'DEL') {
                  if (userInput.isNotEmpty) {
                    userInput = userInput.substring(0, userInput.length - 1);
                  }
                } else {
                  userInput += title;
                }
              });
            },
            textColor: title == '=' || title == '+' || title == '-' || title == 'x' || title == '/'
                ? Color(0xffffa00a)
                : Color(0xffa5a5a5),
          );
        }).toList(),
      ),
    );
  }

  void equalPressed() {
    String finaluserinput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
