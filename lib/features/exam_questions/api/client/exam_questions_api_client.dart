import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_endpoints.dart';
import 'package:online_exam_app/features/exam_questions/data/models/answer_request_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/check_result_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/exam_model.dart';
import 'package:online_exam_app/features/exam_questions/data/models/questions_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'exam_questions_api_client.g.dart';

@RestApi()
@singleton
abstract class ExamQuestionsApiClient {
  @factoryMethod
  factory ExamQuestionsApiClient(Dio dio) = _ExamQuestionsApiClient;

  @GET('${ApiEndpoints.exams}/{id}')
  Future<ExamModel> getExamById({
    @Path('id') required String id,
    @Header('token') String? token,
  });

  @GET(ApiEndpoints.questions)
  Future<QuestionsResponseModel> getQuestions({
    @Header('token') String? token,
    @Query('exam') String? exam,
  });

  @POST(ApiEndpoints.questionsCheck)
  Future<CheckResultModel> answerQuestion({
    @Body() required CheckAnswersRequestModel request,
    @Header('token') String? token,
  });
}
