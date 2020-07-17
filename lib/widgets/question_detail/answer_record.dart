import 'dart:async';

import 'package:flutter/material.dart';

class AnswerRecord extends StatefulWidget {
  final bool tick;
  final Function() on_finish;
  final String recording_time;
  const AnswerRecord({Key key, this.tick, this.on_finish, this.recording_time})
      : super(key: key);
  @override
  _AnswerRecordState createState() => _AnswerRecordState();
}

class _AnswerRecordState extends State<AnswerRecord> {
  String time; //60
  Timer t;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      time = widget.recording_time;
    });
  }

  void ticking() {
    String mnts = time[0] + time[1];
    String scnds = time[3] + time[4];
    t = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (scnds == "00") {
          if (int.parse(mnts) > 0) {
            scnds = "59";
            mnts = "0" + (int.parse(mnts) - 1).toString();
          } else {
            timer.cancel();
            widget.on_finish();
          }
        } else
          scnds = (int.parse(scnds) - 1).toString();
        if (scnds.length == 1) scnds = "0" + scnds;
        time = mnts + ":" + scnds;
      });
    });
  }

  @override
  void dispose() {
    if (t != null) {
      t.cancel();
      widget.on_finish();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tick && time == widget.recording_time) ticking();

    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment(1, 0),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text("سجل إجابتك",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff828282),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            time,
            style: TextStyle(
              fontFamily: "SF Pro Display",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff595959),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.mic,
            size: 45,
          ),
          AnimatedContainer(
              duration: Duration(milliseconds: 250),
              // margin:widget.tick? EdgeInsets.only(top:10) : null,
              width: size.width * 0.9,
              height: widget.tick ? 20 : 10,
              decoration: BoxDecoration(
                color: widget.tick ? Color(0xffEA858A) : null,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ))
        ],
      ),
      width: size.width * 0.9,
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.all(10),
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
