sealed class VerifyOtpIntent {}

class VerifyOtpEvent extends VerifyOtpIntent{
  final String resetCode;

  VerifyOtpEvent({required this.resetCode});
}
class ResendOtpEvent extends VerifyOtpIntent {
  final String email;

  ResendOtpEvent({required this.email});
}
class ClearVerifyOtpErrorEvent extends VerifyOtpIntent {}