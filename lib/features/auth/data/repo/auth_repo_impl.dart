import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/datasource/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepoImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<BaseResponse<UserEntity>> login(
    SignInRequestModel requestModel,
    bool rememberMe,
  ) async {
    final response = await remoteDataSource.login(requestModel);
    switch (response) {
      case SuccessResponse<SignInResponseModel>(:final data):
        final userEntity = UserEntity(
          id: data.user.id,
          email: data.user.email,
          username: data.user.username,
          firstName: data.user.firstName,
          lastName: data.user.lastName,
          phone: data.user.phone,
          role: data.user.role,
          isVerified: data.user.isVerified,
          createdAt: data.user.createdAt,
        );
        if (rememberMe) {
          await localDataSource.saveToken(data.token);
        }
        return SuccessResponse(userEntity);
      case ErrorResponse<SignInResponseModel>(:final errMessage):
        return ErrorResponse(errMessage: errMessage);
    }
  }
}
