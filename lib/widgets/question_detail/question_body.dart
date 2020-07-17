import 'package:flutter/material.dart';

class QuestionBody extends StatelessWidget {
  final String text;
  const QuestionBody({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Text(text + text + text + text + text,
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      width: size.width * 0.9,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.white.withOpacity(0.40),
                offset: Offset(-3, -3)),
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.15),
                offset: Offset(3, 3))
          ]),
    );
  }
}
