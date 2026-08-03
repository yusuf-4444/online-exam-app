class AnswerRequestModel {
  final String questionId;
  final String correct;

  AnswerRequestModel({required this.questionId, required this.correct});

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'correct': correct,
  };
}

class CheckAnswersRequestModel {
  final List<AnswerRequestModel> answers;
  final int time;

  CheckAnswersRequestModel({required this.answers, required this.time});

  Map<String, dynamic> toJson() => {
    'answers': answers.map((e) => e.toJson()).toList(),
    'time': time,
  };
}
