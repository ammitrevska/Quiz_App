import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

//we are lifting the state up with this class
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

//private class
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = MyHomePage(startQuiz: switchScreen);
    super.initState();
  }

  // we lift this state again so we can menage the answered questions
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen =  ResultsScreen(answers: selectedAnswers, onRestart: restartQuiz,);
      });
    }
  }

//rendering content conditionaly
  switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  //we lift the state up for restarting the quiz
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  //in order to have the same background in every screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 116, 32, 168),
              Color.fromARGB(255, 102, 5, 143),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
