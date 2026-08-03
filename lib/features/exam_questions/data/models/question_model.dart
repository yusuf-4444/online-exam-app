import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam_questions/data/models/answer_option_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/exam_model.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/question_entity.dart';

part 'question_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  @JsonKey(name: '_id')
  final String id;
  final String question;
  final List<AnswerOptionModel> answers;
  final String type;
  final String? correct;
  final ExamModel? exam;
  final String createdAt;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionEntity toDomain() {
    return QuestionEntity(
      id: id,
      question: question,
      type: type,
      answers: answers.map((e) => e.toDomain()).toList(),
      correctOption: (correct == null || correct!.isEmpty)
          ? const []
          : correct!.split(','),
      examId: exam?.id,
    );
  }
}
