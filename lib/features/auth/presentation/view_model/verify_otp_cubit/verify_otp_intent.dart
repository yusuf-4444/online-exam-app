import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';

sealed class VerifyOtpIntent {}

class VerifyOtpEvent extends VerifyOtpIntent {
  VerifyOtpParams params;

  VerifyOtpEvent({required this.params});
}

class ResendOtpEvent extends VerifyOtpIntent {
  final String email;

  ResendOtpEvent({required this.email});
}

class ClearVerifyOtpErrorEvent extends VerifyOtpIntent {}
