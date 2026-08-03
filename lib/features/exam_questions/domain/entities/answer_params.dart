import 'package:equatable/equatable.dart';

class AnswerParams extends Equatable {
  final String questionId;
  final String correct;

  const AnswerParams({required this.questionId, required this.correct});

  @override
  List<Object?> get props => [questionId, correct];
}
