import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/answer_params.dart';

class CheckParams extends Equatable {
  final List<AnswerParams> answers;
  final int time;

  const CheckParams({required this.answers, required this.time});

  @override
  List<Object?> get props => [answers, time];
}
