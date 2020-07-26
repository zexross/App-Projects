import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(DemoAppV1());
}

class DemoAppV1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoAppV1State();
  }
}

class DemoAppV1State extends State<DemoAppV1> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    setState(() {
      questionIndex += 1;
      totalScore += score;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Blue', 'score': 9},
          {'text': 'Red', 'score': 6},
          {'text': 'Green', 'score': 4},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal',
        'answers': [
          {'text': 'Rabbit', 'score': 1},
          {'text': 'Dog', 'score': 6},
          {'text': 'Horse', 'score': 4},
          {'text': 'Wolf', 'score': 9},
          {'text': 'Bat', 'score': 7}
        ]
      },
      {
        'questionText': 'Which\'s your favorite car',
        'answers': [
          {'text': 'Veyron', 'score': 10},
          {'text': 'Lamborgini', 'score': 7},
          {'text': 'Ford Mustang', 'score': 5},
          {'text': 'BMW i3', 'score': 3},
          {'text': 'Roadster', 'score': 2}
        ]
      },
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Personality Quiz'),
          ),
          body: questionIndex < questions.length
              ? Quiz(
                  answerQuestion: answerQuestion,
                  questions: questions,
                  questionIndex: questionIndex)
              : Result(totalScore, resetQuiz)),
    );
  }
}