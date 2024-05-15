import 'package:flutter/material.dart';

//class used so no duplicate code is used
class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answerText, required this.onTab, super.key});

  final String answerText;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 122, 78, 199),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
        ),
        child: Text(answerText, textAlign: TextAlign.center,));
  }
}
