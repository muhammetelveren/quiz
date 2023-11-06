import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

void main() {
  runApp(
    MaterialApp(
      home: QuestionScreen(),
    ),
  );
}

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionNumber = 0;

  void changeQuestion() {
    setState(() {
      questionNumber = (questionNumber + 1) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[questionNumber].question),
            ...questions[questionNumber].answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  changeQuestion();
                },
                child: Text(answer),
              );
            })
          ],
        ),
      ),
    );
  }
}
