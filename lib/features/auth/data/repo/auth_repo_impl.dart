import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> login(SignInRequestModel requestModel) async {
    final response = await remoteDataSource.login(requestModel);
    final SignInEntity signInEntity = response.toEntity();
    final UserEntity userEntity = signInEntity.user;
    return userEntity;
  }
}
