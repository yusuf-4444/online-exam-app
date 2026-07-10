import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<UserEntity>> login(
    SignInRequestModel requestModel,
  ) async {
    final response = await remoteDataSource.login(requestModel);
    switch (response.runtimeType) {
      case const (SuccessResponse<SignInResponseModel>):
        final signInResponse =
            (response as SuccessResponse<SignInResponseModel>).data;
        final userEntity = UserEntity(
          id: signInResponse.user.id,
          email: signInResponse.user.email,
          username: signInResponse.user.username,
          firstName: signInResponse.user.firstName,
          lastName: signInResponse.user.lastName,
          phone: signInResponse.user.phone,
          role: signInResponse.user.role,
          isVerified: signInResponse.user.isVerified,
          createdAt: signInResponse.user.createdAt,
        );
        return SuccessResponse(userEntity);
      case const (ErrorResponse):
        final error = (response as ErrorResponse).error;
        return ErrorResponse(error: error);
      default:
        return ErrorResponse(error: Exception('Unknown response type'));
    }
  }
}
