class Question {
  int id;
  String title;
  String answer1;

  String answer2;
  String answer3;
  String answer4;

  String correct;

  Question(
      {required this.id,
      required this.title,
      required this.answer1,
      required this.answer2,
      required this.answer3,
      required this.answer4,
      required this.correct});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
      'correct': correct,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      title: map['title'] as String,
      answer1: map['answer1'] as String,
      answer2: map['answer2'] as String,
      answer3: map['answer3'] as String,
      answer4: map['answer4'] as String,
      correct: map['correct'] as String,
    );
  }
}
