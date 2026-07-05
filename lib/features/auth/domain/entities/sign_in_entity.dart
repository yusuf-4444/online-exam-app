import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

class SignInEntity {
  final String message;
  final String token;
  final UserEntity user;

  SignInEntity({
    required this.message,
    required this.token,
    required this.user,
  });
}
