import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:online_exam_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_state.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  VerifyOtpCubit(this._verifyOtpUseCase, this._forgotPasswordUseCase)
    : super(const VerifyOtpState.initial());

  Future<void> doEvent(VerifyOtpIntent event) async {
    switch (event) {
      case VerifyOtpEvent(:final resetCode):
        _verifyOtp(resetCode);
      case ResendOtpEvent(:final email):
        _resendOtp(email);
      case ClearVerifyOtpErrorEvent():
        emit(const VerifyOtpState.initial());
    }
  }

  Future<void> _verifyOtp(String resetCode) async {
    emit(const VerifyOtpState.loading());
    final response = await _verifyOtpUseCase.call(resetCode);
    switch (response) {
      case SuccessResponse<VerifyOtpEntity>(:final data):
        emit(VerifyOtpState.success(data));
      case ErrorResponse<VerifyOtpEntity>(:final errMessage):
        emit(VerifyOtpState.error(errMessage));
    }
  }

  Future<void> _resendOtp(String email) async {
    final response = await _forgotPasswordUseCase.call(email);

    switch (response) {
      case SuccessResponse<ForgotPasswordEntity>():
        break;

      case ErrorResponse<ForgotPasswordEntity>(:final errMessage):
        emit(VerifyOtpState.error(errMessage));
    }
  }
}
