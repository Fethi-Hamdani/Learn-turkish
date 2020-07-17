import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onpressed;

  const Button({Key key, this.onpressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment(0, 0),
        child: Text(
          "إبدأ الإجابة",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: "SF Pro Display",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        width: size.width * 0.9,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffEA858A),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
