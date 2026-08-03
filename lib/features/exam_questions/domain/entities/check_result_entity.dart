import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/question_result_entity.dart';

class CheckResultEntity extends Equatable {
  final int correctCount;
  final int wrongCount;
  final String totalPercentage;
  final List<QuestionResultEntity> wrongQuestions;
  final List<QuestionResultEntity> correctQuestions;

  const CheckResultEntity({
    required this.correctCount,
    required this.wrongCount,
    required this.totalPercentage,
    required this.wrongQuestions,
    required this.correctQuestions,
  });

  int get totalQuestions => correctCount + wrongCount;

  @override
  List<Object?> get props => [
    correctCount,
    wrongCount,
    totalPercentage,
    wrongQuestions,
    correctQuestions,
  ];
}
