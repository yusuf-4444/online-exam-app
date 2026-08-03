import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/repo/exam_questions_repo.dart';

@injectable
class GetExamByIdUseCase {
  final ExamQuestionsRepo _examQuestionsRepo;
  GetExamByIdUseCase(this._examQuestionsRepo);
  Future<BaseResponse<ExamEntity>> call(String examId) async {
    return await _examQuestionsRepo.getExamById(examId);
  }
}
