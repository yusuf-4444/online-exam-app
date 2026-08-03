import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam_questions/data/models/question_result_model.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/check_result_entity.dart';

part 'check_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckResultModel {
  final String? message;
  final int correct;
  final int wrong;
  final String total;
  @JsonKey(name: 'WrongQuestions')
  final List<QuestionResultModel> wrongQuestions;
  final List<QuestionResultModel> correctQuestions;

  CheckResultModel({
    required this.message,
    required this.correct,
    required this.wrong,
    required this.total,
    required this.wrongQuestions,
    required this.correctQuestions,
  });

  factory CheckResultModel.fromJson(Map<String, dynamic> json) =>
      _$CheckResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckResultModelToJson(this);

  CheckResultEntity toDomain() {
    return CheckResultEntity(
      correctCount: correct,
      wrongCount: wrong,
      totalPercentage: total,
      wrongQuestions: wrongQuestions.map((e) => e.toDomain()).toList(),
      correctQuestions: correctQuestions.map((e) => e.toDomain()).toList(),
    );
  }
}
