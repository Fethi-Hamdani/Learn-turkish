import 'dart:io';
import 'package:path_provider/path_provider.dart';

int completed_questions = 0;

class Question {
  String title;
  String body;
  bool is_answered = false;
  int difficulty;

  Question({this.title, this.body, this.is_answered, this.difficulty});

  Future<bool> check_anwsered() async {
    Directory p = await getApplicationDocumentsDirectory();
    String path = p.path;
    File f = File(path + this.title + ".m4a");
    this.is_answered = await f.existsSync();
    if (this.is_answered) {
      completed_questions++;
      return true;
    } else
      return false;
  }
}
