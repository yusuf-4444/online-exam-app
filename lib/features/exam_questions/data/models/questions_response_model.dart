import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam_questions/data/models/question_model.dart';

part 'questions_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionsResponseModel {
  final String? message;
  final List<QuestionModel> questions;

  QuestionsResponseModel({required this.message, required this.questions});

  factory QuestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseModelToJson(this);
}
