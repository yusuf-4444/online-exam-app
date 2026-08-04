import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';

sealed class ForgotPasswordIntent {}

class ForgotPasswordEvent extends ForgotPasswordIntent {
  ForgotPasswordParams params;

  ForgotPasswordEvent({required this.params});
}
