import 'package:flutter/material.dart';
import 'package:learn_turkich/widgets/starter_page/button_level.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  String insta = "kolayca_turkce_dz@";
  String gmail = "Kolaycaturkce.dz@gmail.com";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5E3E6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5E3E6),
        title: Text(
          "المستويات",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "SF Pro Display",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Color(0xff16146E),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment(0, 0),
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Container(
                        width: size.width * 0.35,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(360),
                            child: Image.asset(
                              "assets/logo.png",
                              fit: BoxFit.cover,
                            ))),
                  ),
                ),
              ),
       
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonLevel(
                      color: Color(0xFF272796),
                      ar_title: "مبتدئ",
                      tur_titlr: "Temel",
                      difficulty: 1,
                      prepare_time: "00:03",
                      record_time: "01:00",
                    ),
                    ButtonLevel(
                      color: Color(0xFF00A990),
                      ar_title: "متوسط",
                      tur_titlr: "Orta",
                      difficulty: 2,
                      prepare_time: "00:30",
                      record_time: "01:30",
                    ),
                    ButtonLevel(
                      color: Color(0xFF1EC5E8),
                      ar_title: "متقدم",
                      tur_titlr: "ileri",
                      difficulty: 3,
                      prepare_time: "00:30",
                      record_time: "02:00",
                    ),
                  ],
                ),
              ),
      
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "حسابي على الإنستغرام: " + insta,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: "SF Pro Display",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.black45,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "إيمايلي: " + gmail,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: "SF Pro Display",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
