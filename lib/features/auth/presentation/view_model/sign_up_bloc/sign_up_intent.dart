sealed class SignUpIntent {}

class SignUpEvent extends SignUpIntent {
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  SignUpEvent({
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });
}
