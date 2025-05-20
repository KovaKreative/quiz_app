import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(backgroundColor: const Color.fromARGB(255, 40, 32, 128), body: Quiz()),
    ),
  );
}
