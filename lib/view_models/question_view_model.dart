import 'package:learn_turkich/models/question.dart';

class QuestionViewModel {
  Question question;

  QuestionViewModel({this.question});

  String get title {
    return this.question.title;
  }

  String get body {
    return this.question.body;
  }

  bool get answerd {
    return this.question.is_answered;
  }

  set set_answer(bool answer) {
    this.question.is_answered = answer;
  }
}
