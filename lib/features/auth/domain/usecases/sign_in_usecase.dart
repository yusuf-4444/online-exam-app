import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class SignInUsecase {
  final AuthRepo authRepo;

  SignInUsecase(this.authRepo);
  Future<BaseResponse<UserEntity>> call(
    String email,
    String password,
    bool rememberMe,
  ) async {
    final signInRequestModel = SignInRequestModel(
      email: email,
      password: password,
    );
    final response = await authRepo.login(signInRequestModel, rememberMe);
    return response;
  }
}
