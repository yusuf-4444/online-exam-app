import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_questions/data/models/answer_request_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/check_result_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/exam_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/question_model.dart';

abstract interface class ExamQuestionsRemoteDataSource {
  Future<BaseResponse<ExamModel>> getExamById({
    required String id,
    required String token,
  });

  Future<BaseResponse<List<QuestionModel>>> getQuestionsOnExam({
    required String token,
    required String exam,
  });

  Future<BaseResponse<CheckResultModel>> checkAnswers({
    required CheckAnswersRequestModel request,
    required String token,
  });
}
