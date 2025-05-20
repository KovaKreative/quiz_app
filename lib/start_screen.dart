import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const spacer = SizedBox(height: 50);

class StartScreen extends StatelessWidget {
  const StartScreen(this.buttonFunction, {super.key});

  final void Function() buttonFunction;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, ),
          spacer,
          Text('90s Kid Trivia Quiz',
              style:
                  GoogleFonts.oxanium(color: Color(0xFFFFEB79), fontSize: 24)),
          spacer,
          OutlinedButton.icon(
              onPressed: buttonFunction,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right),
              label: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
