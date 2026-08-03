import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_questions/api/client/exam_questions_api_client.dart';
import 'package:online_exam_app/features/exam_questions/data/datasource/remote/exam_questions_remote_data_source.dart';
import 'package:online_exam_app/features/exam_questions/data/models/answer_request_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/check_result_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/exam_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/question_model.dart';

@Injectable(as: ExamQuestionsRemoteDataSource)
class ExamQuestionsRemoteDataSourceImpl
    implements ExamQuestionsRemoteDataSource {
  final ExamQuestionsApiClient _apiClient;

  ExamQuestionsRemoteDataSourceImpl(this._apiClient);
  @override
  Future<BaseResponse<CheckResultModel>> checkAnswers({
    required CheckAnswersRequestModel request,
    required String token,
  }) async {
    try {
      final response = await _apiClient.answerQuestion(
        request: request,
        token: token,
      );
      return SuccessResponse(response);
    } catch (e) {
      return ErrorResponse(error: e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<BaseResponse<ExamModel>> getExamById({
    required String id,
    required String token,
  }) async {
    try {
      final response = await _apiClient.getExamById(id: id, token: token);
      return SuccessResponse(response);
    } catch (e) {
      return ErrorResponse(error: e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<BaseResponse<List<QuestionModel>>> getQuestionsOnExam({
    required String token,
    required String exam,
  }) async {
    try {
      final response = await _apiClient.getQuestions(token: token, exam: exam);
      return SuccessResponse(response.questions);
    } catch (e) {
      return ErrorResponse(error: e is Exception ? e : Exception(e.toString()));
    }
  }
}
