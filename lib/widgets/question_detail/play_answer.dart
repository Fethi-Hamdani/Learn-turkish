import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Playanswer extends StatefulWidget {
  final String title;

  const Playanswer({Key key, this.title}) : super(key: key);
  @override
  _PlayanswerState createState() => _PlayanswerState();
}

class _PlayanswerState extends State<Playanswer>
    with SingleTickerProviderStateMixin {
  AnimationController play_pause;
  bool isPlaying = false, start_playing = false;
  Timer t;
  double max = 1;
  String duration = "", current_duration = "00:00";
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    play_pause =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    load_duration();
  }

  load_duration() async {
    Directory p = await getApplicationDocumentsDirectory();
    String pth = p.path + widget.title + ".m4a";
    player.setUrl(pth).then((value) {
      player.onDurationChanged.listen((Duration d) {
        setState(() {
          duration = d.toString().substring(2, 7);
          max = get_double(duration);
        });
      });
    });
  }

  void play_audio(String path) async {
    Directory p = await getApplicationDocumentsDirectory();
    String pth = p.path + path + ".m4a";
    player.play(pth);
  }

  void pause_audio() async {
    player.pause();
  }

  double get_double(String time) {
    int mnts = int.parse(time[0] + time[1]);
    int scnds = int.parse(time[3] + time[4]);
    return mnts * 60 + scnds + 0.0;
  }

  String get_time(double va) {
    int val = va.round();
    val = val < 0 ? val * -1 : val;
    String mnts = val > 60 ? (val / 60.0).toString() : val.toString();
    mnts = int.parse(mnts) < 10 ? "0" + mnts : mnts;
    String scnds = (int.parse(mnts) - val).toString();
    scnds = int.parse(scnds) < 10 ? "0" + scnds : scnds;
    return mnts + ":" + scnds;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pause_audio();
  }

  @override
  Widget build(BuildContext context) {
    player.onAudioPositionChanged.listen((Duration p) => {
          setState(() {
            current_duration = p.toString().substring(2, 7);
            if (current_duration == duration && start_playing && isPlaying) {
              play_pause.reverse();
              isPlaying = false;
              start_playing = false;
            }
            if (current_duration == "00:01") start_playing = true;
          })
        });
    Size size = MediaQuery.of(context).size;
    return Container(
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
      child: Column(
        children: [
          Align(
            alignment: Alignment(1, 0),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text("إستمع لإجابتك",
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
          GestureDetector(
              onTap: () {
                setState(() {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    play_pause.forward();
                    play_audio(widget.title);
                  } else {
                    play_pause.reverse();
                    pause_audio();
                  }
                });
              },
              child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color(0xff16146E),
                      borderRadius: BorderRadius.circular(360)),
                  child: AnimatedIcon(
                      size: 45,
                      color: Colors.white,
                      icon: AnimatedIcons.play_pause,
                      progress: play_pause))),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(current_duration), Text(duration)],
            ),
          ),
          Container(
              child: duration == null || current_duration == null
                  ? Container()
                  : Slider(
                      activeColor: Color(0xffEA858A),
                      inactiveColor: Colors.black12,
                      min: 0.0,
                      max: max,
                      value: get_double(current_duration) ?? 0.0,
                      onChanged: (value) {
                        player.seek(Duration(seconds: value.round()));
                      }))
        ],
      ),
    );
  }
}
