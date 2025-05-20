import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

import 'package:quiz_app/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int index = 0;

  void checkAnswer() {
    if (index >= questions.length - 1) {
      return;
    }
    setState(() {
      index++;
    });
  }

  @override
  build(context) {
    final currentQuestion = questions[index];
    final answers = currentQuestion.getShuffledAnswers().map((e) {
      return AnswerButton(
        e,
        checkAnswer,
      );
    });

    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.oxanium(
                  color: Color(0xFFFFD900),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ...answers
          ],
        ),
      ),
    );
  }
}
