import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  int pageIndex = 0;

  // @override
  // void initState() {
  //   activeScreen = 'quiz-screen';
  //   super.initState();
  // }

  void startQuiz() {
    setState(() {
      pageIndex = 1;
    });
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      pageIndex = 0;
    });
  }

  void storeAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        pageIndex = 2;
      });
    }
  }

  @override
  build(context) {
    List<Widget> screens = [
      StartScreen(startQuiz),
      QuestionsScreen(onSelectAnswer: storeAnswer),
      ResultsScreen(questions, selectedAnswers, restartQuiz),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 61, 24, 103),
        body: screens[pageIndex],
      ),
    );
  }
}
