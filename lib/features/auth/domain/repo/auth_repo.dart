import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';

abstract class AuthRepo {
  Future<SignInResponseModel> login(SignInRequestModel requestModel);
}
