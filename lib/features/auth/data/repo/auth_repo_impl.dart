import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/datasource/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_response_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepoImpl({required this.remoteDataSource, required this.localDataSource});

  // @override
  // Future<BaseResponse<UserEntity>> login(
  //   String email,
  //   String password,
  //   bool rememberMe,
  // ) async {
  //   final requestModel = SignInRequestModel(email: email, password: password);
  //   final response = await remoteDataSource.login(requestModel);
  //   switch (response) {
  //     case SuccessResponse<SignInResponseModel>(:final data):
  //       final userEntity = data.user.toDomain();
  //       if (rememberMe) {
  //         await localDataSource.saveToken(data.token);
  //       }
  //       return SuccessResponse(userEntity);
  //     case ErrorResponse<SignInResponseModel>(:final errMessage):
  //       return ErrorResponse(errMessage: errMessage);
  //   }
  // }

  @override
  Future<BaseResponse<ForgotPasswordEntity>> forgotPassword(
   ForgotPasswordParams params,
  ) async {
    final requestModel = ForgotPasswordRequestModel(email: params.email);
    final response = await remoteDataSource.forgotPassword(requestModel);
    switch (response) {
      case SuccessResponse<ForgotPasswordResponseModel>(:final data):
        final forgotPasswordEntity = data.toDomain();
        return SuccessResponse(forgotPasswordEntity);
      case ErrorResponse<ForgotPasswordResponseModel>(:final errMessage):
        return ErrorResponse(errMessage: errMessage);
    }
  }

  @override
  Future<BaseResponse<VerifyOtpEntity>> verifyResetCode(
    VerifyOtpParams params,
  ) async {
    final requestModel = VerifyOtpRequestModel(resetCode: params.resetCode);
    final response = await remoteDataSource.verifyResetCode(requestModel);
    switch (response) {
      case SuccessResponse<VerifyOtpResponseModel>(:final data):
        final verifyOtpEntity = data.toDomain();
        return SuccessResponse(verifyOtpEntity);
      case ErrorResponse<VerifyOtpResponseModel>(:final errMessage):
        return ErrorResponse(errMessage: errMessage);
    }
  }

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    ResetPasswordParams params,
  ) async {
    final requestModel = ResetPasswordRequestModel(
      email: params.email,
      newPassword: params.newPassword,
    );
    final response = await remoteDataSource.resetPassword(requestModel);
    switch (response) {
      case SuccessResponse<ResetPasswordResponseModel>(:final data):
        final resetPasswordEntity = data.toDomain();
        return SuccessResponse(resetPasswordEntity);
      case ErrorResponse<ResetPasswordResponseModel>(:final errMessage):
        return ErrorResponse(errMessage: errMessage);
    }
  }
}
