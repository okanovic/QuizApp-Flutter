import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get scoreTextResult {
    String scoreText;
    if (resultScore < 40) {
      scoreText = "Kötü seçimler. Sonuç: $resultScore";
    } else if (resultScore < 80) {
      scoreText = "İdare Eder. Sonuç: $resultScore";
    } else {
      scoreText = "Muazzam. Sonuç: $resultScore";
    }
    return scoreText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(scoreTextResult),
        ),
        Center(
          child: TextButton(
            child: Text("Restart Quiz"),
            onPressed: resetHandler,
          ),
        )
      ],
    );
  }
}
