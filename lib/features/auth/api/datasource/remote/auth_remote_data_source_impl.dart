import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/api/client/auth_api_client.dart';
import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient authApiClient;

  AuthRemoteDataSourceImpl(this.authApiClient);
  @override
  Future<BaseResponse<SignInResponseModel>> login(
    SignInRequestModel requestModel,
  ) async {
    try {
      final response = await authApiClient.signIn(request: requestModel);
      return SuccessResponse(response);
    } catch (e) {
      return ErrorResponse(error: e as Exception);
    }
  }
}
