import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/answer_option_entity.dart';

class QuestionEntity extends Equatable {
  final String id;
  final String question;
  final String type;
  final List<AnswerOptionEntity> answers;
  final List<String> correctOption;
  final String? examId;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.type,
    required this.answers,
    required this.correctOption,
    required this.examId,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    type,
    answers,
    correctOption,
    examId,
  ];
}
