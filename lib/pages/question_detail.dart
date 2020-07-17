import 'package:flutter/material.dart';
import 'package:learn_turkich/services/audio.dart';
import 'package:learn_turkich/view_models/question_view_model.dart';
import 'package:learn_turkich/widgets/question_detail/question_detail.dart';

class QuestionDetail extends StatefulWidget {
  final QuestionViewModel question;
  final int index;
  final String prepare_timing;
  final String recording_time;
  const QuestionDetail(
      {Key key,
      this.question,
      this.index,
      this.recording_time,
      this.prepare_timing})
      : super(key: key);
  @override
  _QuestionDetailState createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  bool is_anwserd, preparing = false, recording = false, playing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    is_anwserd = widget.question.answerd;
  }

  void start_timer() {
    setState(() {
      preparing = true;
    });
  }

  void record_response() {
    Audio().start_recording(widget.question.title);
    setState(() {
      recording = true;
      preparing = false;
    });
  }

  void answer_submitted() {
    Audio().stop_recording();
    setState(() {
      recording = false;
      is_anwserd = true;
    });
  }

  void redo_question() {
    setState(() {
      is_anwserd = false;
    });
    Audio().delete_record(widget.question.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E3E6),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff16146E)),
        elevation: 0,
        backgroundColor: Color(0xFFF5E3E6),
        title: Text(
          widget.question.title,
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
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuestionBody(text: widget.question.body),
              !is_anwserd
                  ? Column(
                      children: [
                        preparing || recording
                            ? Container()
                            : Button(
                                onpressed: start_timer,
                              ),
                        PrepareTimer(
                          tick: preparing,
                          on_finish: record_response,
                          prepare_timing: widget.prepare_timing,
                        ),
                        AnswerRecord(
                          tick: recording,
                          on_finish: answer_submitted,
                          recording_time: widget.recording_time,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        RedoButton(
                          onpressed: redo_question,
                        ),
                        Playanswer(
                          title: widget.question.title,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
