import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

TextStyle question = TextStyle(color: Color(0xFFFFD900), fontSize: 16);
TextStyle correct = TextStyle(color: Color.fromARGB(255, 138, 214, 255));
TextStyle incorrect = TextStyle(color: Color.fromARGB(255, 255, 112, 99));

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.questions, this.selectedAnswers, this.resetGame,
      {super.key});

  final List<QuizQuestion> questions;
  final List<String> selectedAnswers;
  final void Function() resetGame;

  @override
  build(context) {
    List<Widget> renderedResults = [];

    int correctAnswers = 0;

    for (int i = 0; i < questions.length; i++) {
      bool correctAnswer = selectedAnswers[i] == questions[i].answers[0];

      if (correctAnswer) {
        correctAnswers++;
      }

      renderedResults.add(Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: SizedBox(
          child: Column(
            children: [
              Text(
                '${i + 1}: ${questions[i].text}',
                style: question,
                textAlign: TextAlign.center,
              ),
              correctAnswer
                  ? Text('Correct!', style: correct)
                  : Text('Incorrect...', style: incorrect),
              if (!correctAnswer)
                Text('Correct answer: ${questions[i].answers[0]}',
                    textAlign: TextAlign.center, style: correct),
              Text('Your answer: ${selectedAnswers[i]}',
                  textAlign: TextAlign.center,
                  style: correctAnswer ? correct : incorrect),
            ],
          ),
        ),
      ));
    }

    return Container(
      margin: EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'RESULTS:\nYou\'ve answered $correctAnswers out of ${selectedAnswers.length} correctly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            ...renderedResults,
            OutlinedButton(
                onPressed: resetGame,
                child: Text(
                  'Reset Quiz',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
