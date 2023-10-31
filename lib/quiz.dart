import 'package:flutter/material.dart';
import 'package:quizapp/data/quiz_data.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // making a Page handle switching th states in the app
  var activeScreen = 'start-screen';

  // We call the init method to initlaize the StateScreen before render the screen
  // It will execute after the variable and function were declared in the app or screen
  // @override
  // void initState() {
  //   activeScreen = ;
  //   super.initState();
  // }

  // This process is known as lifted up states
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // create a variable to store the value of answers
  List<String> answers = [];

  // making a function to accept the values answered by user
  void chooseAnswer(String ans) {
    answers.add(ans);

    if (answers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartGame() {
    setState(() {
      answers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget displayScreen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      displayScreen = Questions(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      displayScreen =
          ResultScreen(choosenAnswer: answers, resetGame: restartGame);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.deepOrangeAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: displayScreen),
      ),
    );
  }
}
