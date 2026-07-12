import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_up_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<SignInResponseModel>> login(
    SignInRequestModel requestModel,
  );

  Future<BaseResponse<SignUpResponseModel>> signUp(
    SignUpRequestModel requestModel,
  );
}
