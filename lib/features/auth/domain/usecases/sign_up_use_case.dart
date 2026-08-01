import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class SignUpUsecase {
  final AuthRepo authRepo;

  SignUpUsecase(this.authRepo);

  Future<BaseResponse<UserEntity>> call(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
  ) async {
    final response = await authRepo.signUp(
      SignUpParams(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      ),
    );
    return response;
  }
}
