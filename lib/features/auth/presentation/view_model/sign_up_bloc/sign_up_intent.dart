import 'package:online_exam_app/features/auth/domain/entities/sign_up_params.dart';

sealed class SignUpIntent {}

class SignUpEvent extends SignUpIntent {
  SignUpParams params;
  SignUpEvent({required this.params});
}
