import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> login(SignInRequestModel requestModel);
}
