import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

class SignUpEntity {
  final String message;
  final String token;
  final UserEntity user;

  SignUpEntity({
    required this.message,
    required this.token,
    required this.user,
  });
}
