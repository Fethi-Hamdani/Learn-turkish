import 'package:flutter/material.dart';
import 'package:learn_turkich/pages/question_detail.dart';
import 'package:learn_turkich/view_models/question_view_model.dart';

class QuestionItem extends StatefulWidget {
  final Function() onpop;
  final QuestionViewModel question;
  final int index;
  final String prepare_timing;
  final String record_timing;
  const QuestionItem(
      {Key key,
      this.question,
      this.index,
      this.onpop,
      this.prepare_timing,
      this.record_timing})
      : super(key: key);

  @override
  _QuestionITemState createState() => _QuestionITemState();
}

class _QuestionITemState extends State<QuestionItem> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            clicked = true;
            Future.delayed(Duration(milliseconds: 120), () {
              setState(() {
                clicked = false;
              });
            });
            Future.delayed(Duration(milliseconds: 200), () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => QuestionDetail(
                            recording_time: widget.record_timing,
                            prepare_timing: widget.prepare_timing,
                            question: widget.question,
                            index: widget.index,
                          ))).whenComplete(() {
                widget.onpop();
              });
            });
          });
        },
        child: !widget.question.answerd
            ? Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Center(
                            child: Text(
                          widget.question.title,
                          style: TextStyle(
                            fontFamily: "Yu Gothic UI",
                            fontSize: 18,
                            color: Color(0xff867c7c),
                          ),
                        ))),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "السؤال " + (widget.index + 1).toString() + ":",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            letterSpacing: 3,
                            fontFamily: "Yu Gothic UI",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffEA858A),
                          ),
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0xffeaebf3),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: clicked
                        ? null
                        : [
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
              )
            : Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(
                              widget.question.title,
                              style: TextStyle(
                                fontFamily: "Yu Gothic UI",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff),
                              ),
                            ))),
                        Expanded(
                            flex: 2,
                            child: Text(
                              "السؤال " + (widget.index + 1).toString() + ":",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: "Yu Gothic UI",
                                letterSpacing: 3,
                                fontSize: 18,
                                color: Color(0xff16146E),
                              ),
                            )),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffEA858A),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                          color: Color(0xffffffff).withOpacity(0.8),
                        ),
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          color: Color(0xff000000).withOpacity(0.1),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF5E3E6),
                              borderRadius: BorderRadius.circular(360)),
                          child: Icon(
                            Icons.check_circle,
                            color: Color(0xff16146E),
                          ))),
                ],
              ));
  }
}

//   #EA858A
//   #060532
