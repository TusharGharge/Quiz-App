import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetHandler;

  Result(this.resultscore, this.resetHandler);

  String get resultphase {
    var resultText = 'hey';
    if (resultscore > 20) {
      resultText = "you did it!";
    } else if (resultscore > 16) {
      resultText = "Pretty likeable";
    } else if (resultscore > 10) {
      resultText = "your are...";
    } else {
      resultText = "are you strange?";
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultphase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
              child: Text('Restart quiz'),
              onPressed: resetHandler,
              color: Colors.blue),
        ],
      ),
    );
  }
}
