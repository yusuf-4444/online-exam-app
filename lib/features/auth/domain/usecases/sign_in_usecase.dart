import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

class SignInUsecase {
  final AuthRepo authRepo;

  SignInUsecase(this.authRepo);
  Future<void> call(SignInRequestModel signInRequestModel) async {
    await authRepo.login(signInRequestModel);
  }
}
