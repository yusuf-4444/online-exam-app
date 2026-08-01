import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class SignInUsecase {
  final AuthRepo authRepo;

  SignInUsecase(this.authRepo);
  Future<BaseResponse<UserEntity>> call(
    String email,
    String password,
    bool rememberMe,
  ) async {
    final response = await authRepo.login(
      SignInParams(email: email, password: password, rememberMe: rememberMe),
    );
    return response;
  }
}
