import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUsecase;
  SignUpCubit({required this._signUpUsecase})
    : super(const SignUpState.initial());

  void doEvent(SignUpIntent event) {
    switch (event) {
      case SignUpEvent(:final params):
        _signUp(params);
    }
  }

  void _signUp(SignUpParams params) async {
    emit(const SignUpState.loading());
    final response = await _signUpUsecase.call(params);
    switch (response) {
      case SuccessResponse<UserEntity>(:final data):
        emit(SignUpState.success(data));
      case ErrorResponse<UserEntity>(:final errMessage):
        emit(SignUpState.error(errMessage));
    }
  }
}
