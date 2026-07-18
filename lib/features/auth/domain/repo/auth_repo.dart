import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<BaseResponse<UserEntity>> login(
      String email,
      String password,
      bool rememberMe,
      );

  Future<BaseResponse<ForgotPasswordEntity>> forgotPassword(
      String email,
      );
}
