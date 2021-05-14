import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';
import 'package:quizapp/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  bool isQuizCompleted = false;
  var questionAndAnswers = [
    {
      "question": "Which is your favorite basketball player?",
      "answers": ["Lebron", "Jordan", "Tracy McGready", "Allen Iverson"]
    },
    {
      "question": "Which is your favorite football player?",
      "answers": ["Hagi", "Ronaldinho", "C. Ronaldo", "Messi"]
    },
    {
      "question": "Which is your favorite food?",
      "answers": ["Mantı", "Kebab", "Menemen", "Dolma"]
    },
    {
      "question": "Which is your favorite soup?",
      "answers": ["Mercimek", "Kelle Paça", "Ezogelin", "Tarhana"]
    },
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questionAndAnswers.length) {
      isQuizCompleted = false;
      print("We have more questions");
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
        body: isQuizCompleted == false ? Column(
          children: <Widget>[
            Question(questionAndAnswers[_questionIndex]["question"]),
            ...(questionAndAnswers[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ) : Center(child: Text("Quiz Tamamlandı"),),
      ),
    );
  }
}
