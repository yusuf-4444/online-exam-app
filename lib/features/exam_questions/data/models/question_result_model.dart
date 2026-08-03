import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/question_result_entity.dart';

part 'question_result_model.g.dart';

@JsonSerializable()
class QuestionResultModel {
  @JsonKey(name: 'QID')
  final String qid;
  @JsonKey(name: 'Question')
  final String question;
  final String? inCorrectAnswer;
  final String? correctAnswer;
  final Map<String, dynamic> answers;

  QuestionResultModel({
    required this.qid,
    required this.question,
    required this.inCorrectAnswer,
    required this.correctAnswer,
    required this.answers,
  });

  factory QuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResultModelToJson(this);

  QuestionResultEntity toDomain() {
    return QuestionResultEntity(
      questionId: qid,
      question: question,
      incorrectAnswer: inCorrectAnswer,
      correctAnswer: correctAnswer,
      answers: answers,
    );
  }
}
