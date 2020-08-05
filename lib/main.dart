import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(Test());
}

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestState();
  }
}

class _TestState extends State<Test> {
  static const _questions = [
    {
      'questionText': 'what\'s  your favorite color?',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'black', 'score': 7},
        {'text': 'yellow', 'score': 5},
        {'text': 'white', 'score': 2},
      ],
    },
    {
      'questionText': 'what\'s your favorite game?',
      'answers': [
        {'text': 'pubg', 'score': 10},
        {'text': 'cricket', 'score': 7},
        {'text': 'ludo', 'score': 5},
        {'text': 'football', 'score': 3},
      ],
    },
    {
      'questionText': 'who is your favourite billionaire?',
      'answers': [
        {'text': 'Elon', 'score': 10},
        {'text': 'jeff bezos', 'score': 10},
        {'text': 'mark zuckerberg', 'score': 10},
        {'text': 'ritiesh agarwal', 'score': 10}, //i can't score them.
      ],
    },
  ];

  var _questionindex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionindex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionindex = _questionindex + 1;
    });

    print(_questionindex);
    if (_questionindex < _questions.length) {
      print("we have more questions");
    } else {
      print("no more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz app"),
        ),
        body: _questionindex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionindex: _questionindex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ), //Scaffold use for backround page
    );
  }
}
