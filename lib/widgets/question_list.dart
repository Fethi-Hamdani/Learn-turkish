import 'package:flutter/material.dart';
import 'package:learn_turkich/view_models/question_view_model.dart';
import 'question_itrem.dart';

class QuestionList extends StatelessWidget {
  final Function() onpop;
  final String prepare_timing;
  final String record_timing;
  final List<QuestionViewModel> questions;
  QuestionList(
      {this.questions, this.onpop, this.prepare_timing, this.record_timing});

  @override
  Widget build(BuildContext context) {
    return questions == null
        ? CircularProgressIndicator()
        : Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: questions.length,
                itemBuilder: (conext, index) {
                  final question = this.questions[index];
                  return QuestionItem(
                    question: question,
                    index: index,
                    onpop: onpop,
                    record_timing: record_timing,
                    prepare_timing: prepare_timing,
                  );
                }),
          );
  }
}
