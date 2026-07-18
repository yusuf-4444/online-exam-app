import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class ForgotPasswordUseCase {
  final AuthRepo authRepo;

  ForgotPasswordUseCase(this.authRepo);

  Future<BaseResponse<ForgotPasswordEntity>> call(String email) async {
    final response = await authRepo.forgotPassword(email);
    return response;
  }
}
