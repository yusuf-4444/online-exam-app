import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<SignInResponseModel> login(SignInRequestModel requestModel) async {
    return SignInResponseModel(
      message: 'Login successful',
      token: 'token',
      user: UserModel(
        id: '1',
        username: 'username',
        email: '  email',
        firstName: '',
        lastName: '',
        phone: '',
        role: '',
        isVerified: false,
        createdAt: '',
      ),
    );
  }
}
