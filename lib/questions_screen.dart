import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

import 'package:quiz_app/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int index = 0;

  void checkAnswer(answer) {
    widget.onSelectAnswer(answer);
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
        () {
          checkAnswer(e);
        },
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
                  color: Color(0xFFFFEB79),
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
