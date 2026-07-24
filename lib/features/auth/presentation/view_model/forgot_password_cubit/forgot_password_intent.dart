sealed class ForgotPasswordIntent {}

class ForgotPasswordEvent extends ForgotPasswordIntent {
  final String email;

  ForgotPasswordEvent({required this.email});
}
