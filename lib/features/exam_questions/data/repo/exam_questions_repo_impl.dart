import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/datasource/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/exam_questions/data/datasource/remote/exam_questions_remote_data_source.dart';
import 'package:online_exam_app/features/exam_questions/data/models/answer_request_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/check_result_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/exam_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/question_model.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/check_result_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/question_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/repo/exam_questions_repo.dart';

@Injectable(as: ExamQuestionsRepo)
class ExamQuestionsRepoImpl implements ExamQuestionsRepo {
  final ExamQuestionsRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  ExamQuestionsRepoImpl(this._remoteDataSource, this._authLocalDataSource);
  @override
  Future<BaseResponse<ExamEntity>> getExamById(String examId) async {
    final token = await _authLocalDataSource.getToken();
    final response = await _remoteDataSource.getExamById(
      id: examId,
      token: token!,
    );
    switch (response) {
      case SuccessResponse<ExamModel>():
        final data = response.data;
        return SuccessResponse(data.toDomain());
      case ErrorResponse<ExamModel>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<List<QuestionEntity>>> getQuestionsByExamId(
    String examId,
  ) async {
    final token = await _authLocalDataSource.getToken();
    final response = await _remoteDataSource.getQuestionsOnExam(
      token: token!,
      exam: examId,
    );
    switch (response) {
      case SuccessResponse<List<QuestionModel>>():
        final data = response.data;
        final questions = data.map((question) => question.toDomain()).toList();
        return SuccessResponse(questions);
      case ErrorResponse<List<QuestionModel>>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<CheckResultEntity>> checkAnswers(params) async {
    final token = await _authLocalDataSource.getToken();
    final requestModel = CheckAnswersRequestModel(
      answers: params.answers
          .map(
            (e) => AnswerRequestModel(
              questionId: e.questionId,
              correct: e.correct,
            ),
          )
          .toList(),
      time: params.time,
    );
    final response = await _remoteDataSource.checkAnswers(
      request: requestModel,
      token: token!,
    );
    switch (response) {
      case SuccessResponse<CheckResultModel>():
        return SuccessResponse(response.data.toDomain());
      case ErrorResponse<CheckResultModel>():
        return ErrorResponse(errMessage: response.errMessage);
    }
  }
}
