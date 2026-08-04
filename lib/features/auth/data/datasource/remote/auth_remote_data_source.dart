import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_response_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<BaseResponse<SignInResponseModel>> login(
    SignInRequestModel requestModel,
  );

  Future<BaseResponse<ForgotPasswordResponseModel>> forgotPassword(
    ForgotPasswordRequestModel requestModel,
  );

  Future<BaseResponse<VerifyOtpResponseModel>> verifyResetCode(
    VerifyOtpRequestModel requestModel,
  );

  Future<BaseResponse<ResetPasswordResponseModel>> resetPassword(
    ResetPasswordRequestModel requestModel,
  );
}
