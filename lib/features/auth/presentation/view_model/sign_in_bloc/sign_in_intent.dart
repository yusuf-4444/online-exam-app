sealed class SignInIntent {}

class SignInEvent extends SignInIntent {
  final String email;
  final String password;
  final bool rememberMe;
  SignInEvent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}
