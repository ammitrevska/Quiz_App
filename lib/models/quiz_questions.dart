class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

 List<String> getShuffeledAnswers( ) {
  //we are copying the list and then we are shuffling the copied list
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
 }
}
