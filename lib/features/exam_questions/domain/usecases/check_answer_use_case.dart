import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/check_params.dart';
import 'package:online_exam_app/features/exam_questions/domain/entities/check_result_entity.dart';
import 'package:online_exam_app/features/exam_questions/domain/repo/exam_questions_repo.dart';

@injectable
class CheckAnswerUseCase {
  final ExamQuestionsRepo _repo;
  CheckAnswerUseCase(this._repo);

  Future<BaseResponse<CheckResultEntity>> call(CheckParams params) async {
    return await _repo.checkAnswers(params);
  }
}
