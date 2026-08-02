import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

class SignUpEntity extends Equatable {
  final String? message;
  final String? token;
  final UserEntity? user;

  const SignUpEntity({
    required this.message,
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [message, token, user];
}
