import 'package:online_exam_app/features/auth/domain/entities/sign_in_params.dart';

sealed class SignInIntent {}

class SignInEvent extends SignInIntent {
  SignInParams params;
  SignInEvent({required this.params});
}
