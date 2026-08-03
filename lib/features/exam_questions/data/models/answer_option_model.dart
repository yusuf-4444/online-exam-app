import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/answer_option_entity.dart';

part 'answer_option_model.g.dart';

@JsonSerializable()
class AnswerOptionModel {
  final String answer;
  final String key;

  AnswerOptionModel({required this.answer, required this.key});

  factory AnswerOptionModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerOptionModelToJson(this);

  AnswerOptionEntity toDomain() => AnswerOptionEntity(key: key, text: answer);
}
