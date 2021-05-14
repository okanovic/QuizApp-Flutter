import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionAndAnswers;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({@required this.questionAndAnswers,@required this.answerQuestion, @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionAndAnswers[questionIndex]["question"]),
        ...(questionAndAnswers[questionIndex]["answers"] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
