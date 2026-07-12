import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase signUpUsecase;
  SignUpCubit({required this.signUpUsecase})
    : super(const SignUpState.initial());

  void signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
  ) async {
    emit(const SignUpState.loading());
    final response = await signUpUsecase.call(
      username,
      firstName,
      lastName,
      email,
      password,
      phoneNumber,
    );
    switch (response) {
      case SuccessResponse<UserEntity>(:final data):
        emit(SignUpState.success(data));
      case ErrorResponse<UserEntity>(:final errMessage):
        emit(SignUpState.error(errMessage));
    }
  }
}
