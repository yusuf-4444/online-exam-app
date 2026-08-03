import 'package:equatable/equatable.dart';

class QuestionResultEntity extends Equatable {
  final String questionId;
  final String question;
  final String? incorrectAnswer;
  final String? correctAnswer;
  final Map<String, dynamic> answers;

  const QuestionResultEntity({
    required this.questionId,
    required this.question,
    required this.incorrectAnswer,
    required this.correctAnswer,
    required this.answers,
  });

  @override
  List<Object?> get props => [
        questionId,
        question,
        incorrectAnswer,
        correctAnswer,
        answers,
      ];
}