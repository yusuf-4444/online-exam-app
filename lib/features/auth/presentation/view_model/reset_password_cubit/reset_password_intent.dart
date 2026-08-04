import 'package:online_exam_app/features/auth/domain/entities/reset_password_params.dart';

sealed class ResetPasswordIntent {}

class ResetPasswordEvent extends ResetPasswordIntent {
  ResetPasswordParams params;

  ResetPasswordEvent({required this.params});
}
