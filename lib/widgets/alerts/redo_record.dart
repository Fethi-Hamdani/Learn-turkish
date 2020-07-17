import 'package:flutter/material.dart';

redo_recording(BuildContext context, Function() confirm) {
  AlertDialog alert = AlertDialog(
    contentPadding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(
      "هل أنت متأكد من محو الإجابة السابقة و إعادة المحاولة" + "؟",
      textDirection: TextDirection.rtl,
    ),
    actions: [
      FlatButton(
        child: Text(
          "إلغاء",
          style: TextStyle(
            fontFamily: "Yu Gothic UI",
            fontSize: 17,
            color: Color(0xffEA858A),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      FlatButton(
        child: Text(
          "موافق",
          style: TextStyle(
            fontFamily: "Yu Gothic UI",
            fontSize: 17,
            color: Color(0xff867c7c),
          ),
        ),
        onPressed: () {
          confirm();
          Navigator.pop(context);
        },
      )
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
