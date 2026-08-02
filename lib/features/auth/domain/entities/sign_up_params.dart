import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;

  const SignUpParams({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    username,
    firstName,
    lastName,
    email,
    password,
    phoneNumber,
  ];
}
