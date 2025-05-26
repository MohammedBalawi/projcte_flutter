import 'package:projcte_flutter/Screen/controll/model/question.dart';

import 'db.dart';

class Cache {
  static List<Question> questions = [];

  static int score = 0;

  void setQuestion(Question question) {
    final dbHelper = DatabaseHelper.instance;
    dbHelper.setQuestion(Question(
        id: 1,
        title: question.title,
        answer1: question.answer1,
        answer2: question.answer2,
        answer3: question.answer3,
        answer4: question.answer4,
        correct: question.correct));
  }

  void reInitScore() {
    score = 0;
  }

  Future<List<Question>> getQuestions() {
    final dbHelper = DatabaseHelper.instance;
    return dbHelper.getQuestions();
  }

  void addMark() {
    score++;
  }

  int getScore() {
    return score;
  }

  void deleteQuestion(int id) {
    final dbHelper = DatabaseHelper.instance;
    dbHelper.deleteQuestion(id);
  }
}
