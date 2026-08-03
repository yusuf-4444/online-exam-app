import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/question_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/repo/exam_questions_repo.dart';

@injectable
class GetQuestionsOnExamUseCase {
  final ExamQuestionsRepo _repo;
  GetQuestionsOnExamUseCase(this._repo);
  Future<BaseResponse<List<QuestionEntity>>> call(String examId) async {
    return await _repo.getQuestionsByExamId(examId);
  }
}
