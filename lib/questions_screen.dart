import 'package:flutter/material.dart';
import 'package:quiz_app/answerButton.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  answerQuestion(String selectedAnswer) {
    //widget class gives us acces to the questionScreen class and its methods
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // because using map we create another list, list in list, and children doesnt allow that
            // we are using ... (spreading) the list, now we are not getting a list of answerButtons,
            // we are only getting answerButtons separated by a comma
            ...currentQuestion.getShuffeledAnswers().map((answer) {
              //onTab we are forwarding an anonymus function because it doesnt take a function with args
              //so insted we are passing only a function but in the function we have a pointer to another function with
              // a parametar
              return AnswerButton(answerText: answer, onTab: () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
