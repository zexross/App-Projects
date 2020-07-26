import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore <= 9){
      resultText = 'You are open and innocent. That\'s cool!';
    } else if (resultScore <= 16){
      resultText = 'You are open but a bit practical. Good for you!';
    } else if (resultScore <= 25){
      resultText = 'You are dense and brave. People look upto you!';
    } else {
      resultText = 'You are mystery for others and possess persistence type nature, you understand that life can be unfair sometimes!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.indigoAccent,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 300, left: 15, right: 15, bottom: 125),
            child: Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          FlatButton(
            child: Text('Restart Quiz!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            onPressed: resetQuiz,
          )
        ]
      )

    );
  }
}