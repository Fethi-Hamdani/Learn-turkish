import 'package:learn_turkich/models/question.dart';
import 'package:learn_turkich/services/data.dart';
import 'package:flutter/material.dart';
import 'question_view_model.dart';

class QuestionListViewModel extends ChangeNotifier {
  List<QuestionViewModel> questions;
  int answered_questions = 0;
  
  fetch_questions(int diff) {
    questions = new List();
    questions_data.forEach((element) {
      element.check_anwsered().then((value) {
        if (element.difficulty == diff)
          this.questions.add(QuestionViewModel(question: element));
        notifyListeners();
      });
    });
    completed_questions(diff);
  }

  String number_of_questions() {
    return this.questions.length.toString();
  }

  completed_questions(int diff) {
    answered_questions = 0;
    questions_data.forEach((element) {
      element.check_anwsered().then((value) {
        if (value && element.difficulty == diff) answered_questions++;
        print("questioned answered is " + answered_questions.toString());
      });
    });
    notifyListeners();
  }
}
