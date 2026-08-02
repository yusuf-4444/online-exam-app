import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_endpoints.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'auth_api_client.g.dart';

@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiEndpoints.signIn)
  Future<SignInResponseModel> signIn({
    @Body() required SignInRequestModel request,
  });

  @POST(ApiEndpoints.forgotPassword)
  Future<ForgotPasswordResponseModel> forgotPassword({
    @Body() required ForgotPasswordRequestModel request,
  });

  @POST(ApiEndpoints.verifyResetCode)
  Future<VerifyOtpResponseModel> verifyResetCode({
    @Body() required VerifyOtpRequestModel  request,
  });
}
