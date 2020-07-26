import 'package:flutter/material.dart';

class Question extends StatelessWidget{
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.only(top: 50, bottom: 25),
        child: Text(
           questionText,
           style: TextStyle(fontSize: 28, color: Colors.white),
           textAlign: TextAlign.center,
     ),
      ),
    );
  }
}