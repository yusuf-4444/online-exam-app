import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
    : super(const ForgotPasswordState.initial());

  Future<void> doEvent(ForgotPasswordIntent event) async {
    switch (event) {
      case ForgotPasswordEvent(:final email):
        _forgotPassword(email);
    }
  }

  Future<void> _forgotPassword(String email) async {
    emit(const ForgotPasswordState.loading());
    final response = await _forgotPasswordUseCase.call(email);
    switch (response) {
      case SuccessResponse<ForgotPasswordEntity>(:final data):
        emit(ForgotPasswordState.success(data));
      case ErrorResponse<ForgotPasswordEntity>(:final errMessage):
        emit(ForgotPasswordState.error(errMessage));
    }
  }
}
