import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class SignInUseCase {
  final AuthRepo authRepo;

  SignInUseCase(this.authRepo);
  Future<BaseResponse<UserEntity>> call(SignInParams params) async {
    final response = await authRepo.login(params);
    return response;
  }
}
