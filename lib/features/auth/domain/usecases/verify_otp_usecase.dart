import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class VerifyOtpUseCase {
  final AuthRepo authRepo;

  VerifyOtpUseCase(this.authRepo);

  Future<BaseResponse<VerifyOtpEntity>> call(VerifyOtpParams params) async {
    final response = await authRepo.verifyResetCode(params);
    return response;
  }
}
