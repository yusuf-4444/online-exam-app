import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/check_params.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/check_result_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/question_entity.dart';

abstract interface class ExamQuestionsRepo {
  Future<BaseResponse<ExamEntity>> getExamById(String examId);

  Future<BaseResponse<List<QuestionEntity>>> getQuestionsByExamId(
    String examId,
  );

  Future<BaseResponse<CheckResultEntity>> checkAnswers(CheckParams params);
}
