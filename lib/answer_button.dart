import 'package:flutter/material.dart';

ButtonStyle buttonsStyle = ElevatedButton.styleFrom(
  foregroundColor: Color.fromARGB(255, 255, 200, 50),
  backgroundColor: Color.fromARGB(221, 0, 28, 77),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  
);

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;

  @override
  build(context) {
    return ElevatedButton(
      style: buttonsStyle,
      onPressed: onTap,
      child: Text(text, textAlign: TextAlign.center,),
    );
  }
}
