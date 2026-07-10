import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase signInUsecase;
  SignInCubit(this.signInUsecase) : super(const SignInState.initial());

  void signIn(String email, String password) async {
    emit(const SignInState.loading());

    await Future.delayed(const Duration(seconds: 2));

    final response = await signInUsecase.call(email, password);
    switch (response) {
      case SuccessResponse<UserEntity>(:final data):
        emit(SignInState.success(data));
      case ErrorResponse<UserEntity>(:final errMessage):
        emit(SignInState.error(errMessage));
    }
  }
}
