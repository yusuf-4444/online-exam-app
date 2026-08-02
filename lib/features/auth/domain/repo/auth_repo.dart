import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepo {
  Future<BaseResponse<UserEntity>> login(SignInParams params);

  Future<BaseResponse<UserEntity>> signUp(SignUpParams params);
}
