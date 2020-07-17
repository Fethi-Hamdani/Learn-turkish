import 'package:flutter/material.dart';
import 'package:learn_turkich/pages/home.dart';
import 'package:learn_turkich/view_models/question_list_view_model.dart';
import 'package:provider/provider.dart';

class ButtonLevel extends StatelessWidget {
  final Color color;
  final String ar_title, tur_titlr;
  final int difficulty;
  final String prepare_time, record_time;
  const ButtonLevel(
      {Key key,
      this.color,
      this.ar_title,
      this.tur_titlr,
      this.difficulty,
      this.prepare_time,
      this.record_time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                      create: (context) => QuestionListViewModel(),
                      child: Home(difficulty, prepare_time, record_time),
                    )));
      },
      child: Container(
        width: size.width * 0.8,
        padding: EdgeInsets.only(top: 22, bottom: 22, left: 50, right: 50),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(-5, -5),
              blurRadius: 15,
              color: Color(0xffffffff).withOpacity(0.8),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tur_titlr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Yu Gothic UI",
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),
            Text(
              ar_title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Yu Gothic UI",
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
    );
  }
}
