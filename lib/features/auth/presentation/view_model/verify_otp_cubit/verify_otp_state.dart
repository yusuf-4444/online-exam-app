import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';

part 'verify_otp_state.freezed.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState.initial() = _Initial;

  const factory VerifyOtpState.loading() = _Loading;

  const factory VerifyOtpState.success(VerifyOtpEntity entity) = _Success;

  // const factory VerifyOtpState.codeResent(String message) = _CodeResent;

  const factory VerifyOtpState.error(String message) = _Error;
}
