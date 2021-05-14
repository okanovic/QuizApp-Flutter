import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';
import 'package:quizapp/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isQuizCompleted = false;
  var _questionAndAnswers = [
    {
      "question": "Which is your favorite basketball player?",
      "answers": [
        {'text': 'Lebron', 'score': 10},
        {'text': 'Jordan', 'score': 40},
        {'text': 'Tracy McGready', 'score': 15},
        {'text': 'Allen Iverson', 'score': 25}
      ]
    },
    {
      "question": "Which is your favorite football player?",
      "answers": [
        {'text': 'Hagi', 'score': 30},
        {'text': 'Ronaldinho', 'score': 40},
        {'text': 'C. Ronaldo', 'score': 20},
        {'text': 'Messi', 'score': 10}
      ]
    },
    {
      "question": "Which is your favorite food?",
      "answers": [
        {'text': 'Mantı', 'score': 30},
        {'text': 'Kebab', 'score': 20},
        {'text': 'Menemen', 'score': 10},
        {'text': 'Dolma', 'score': 5}
      ]
    },
    {
      "question": "Which is your favorite soup?",
      "answers": [
        {'text': 'Mercimek', 'score': 30},
        {'text': 'Kelle Paça', 'score': 20},
        {'text': 'Ezogelin', 'score': 10},
        {'text': 'Tarhana', 'score': 5}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      isQuizCompleted = false;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questionAndAnswers.length) {
      isQuizCompleted = false;
    } else {
      isQuizCompleted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Quizz"),
          ),
          body: isQuizCompleted == false
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionAndAnswers: _questionAndAnswers,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
