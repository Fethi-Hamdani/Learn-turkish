import 'package:flutter/material.dart';
import 'package:learn_turkich/view_models/question_list_view_model.dart';
import 'package:learn_turkich/widgets/question_list.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final int difficulty;
  final String prepare_timing;
  final String record_timing;

  const Home(this.difficulty, this.prepare_timing, this.record_timing);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  QuestionListViewModel vm;

  void load_data() {
    vm = Provider.of<QuestionListViewModel>(context);
    vm.fetch_questions(widget.difficulty);
  }

  void refresh() {
    vm = Provider.of<QuestionListViewModel>(context, listen: false);
    vm.fetch_questions(widget.difficulty);
  }

  @override
  Widget build(BuildContext context) {
    if (vm == null) load_data();
    return Scaffold(
      backgroundColor: Color(0xFFF5E3E6),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff16146E)),
        elevation: 0,
        backgroundColor: Color(0xFFF5E3E6),
        title: Text(
          "الأسئلة",
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
        padding: EdgeInsets.all(0),
        alignment: Alignment(0, 0),
        child: Column(
          children: [
            Text(
              "أجبت على " +
                  vm.answered_questions.toString() +
                  "/" +
                  vm.questions.length.toString(),
              textDirection: TextDirection.rtl,
            ),

            SizedBox(
              height: 10,
            ),
           
            QuestionList(
              questions: vm.questions,
              onpop: refresh,
              record_timing: widget.record_timing,
              prepare_timing: widget.prepare_timing,
            ),
          ],
        ),
      ),
    );
  }
}
