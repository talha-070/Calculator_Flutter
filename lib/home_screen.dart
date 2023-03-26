import 'package:calculator/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                    ),
                    Text(
                      userInput.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                            title: 'AC',
                            onpress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+/-',
                            onpress: () {
                              userInput += '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            color: Colors.orange,
                            onpress: () {
                              userInput += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            onpress: () {
                              userInput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            title: '8',
                            onpress: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            onpress: () {
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            color: Colors.orange,
                            onpress: () {
                              userInput += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            onpress: () {
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: '5',
                            onpress: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            onpress: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            color: Colors.orange,
                            onpress: () {
                              userInput += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            onpress: () {
                              userInput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            color: Colors.orange,
                            onpress: () {
                              userInput += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: '.',
                            onpress: () {
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'DEL',
                            onpress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            color: Colors.orange,
                            onpress: () {
                              equalpress();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalpress() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression ex = p.parse(finalUserInput);
    ContextModel cd = ContextModel();
    double eval = ex.evaluate(EvaluationType.REAL, cd);
    answer = eval.toString();
  }
}
