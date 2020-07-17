import 'package:flutter/material.dart';
import 'package:learn_turkich/widgets/alerts/redo_record.dart';

class RedoButton extends StatelessWidget {
  final Function() onpressed;
  const RedoButton({Key key, this.onpressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        redo_recording(context, onpressed);
      },
      child: Container(
        alignment: Alignment(0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              size: 35,
              color: Colors.white,
            ),
            Text(
              "أعد الإجابة",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
        width: size.width * 0.75,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffEA858A),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
