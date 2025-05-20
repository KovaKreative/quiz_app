import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = 'quiz-screen';
  //   super.initState();
  // }

  void switchScreen(Widget newScreen) {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  build(context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 61, 24, 103),
        body: screenWidget,
      ),
    );
  }
}
