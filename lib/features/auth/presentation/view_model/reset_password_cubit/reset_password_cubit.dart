import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_params.dart';
import 'package:online_exam_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/reset_password_cubit/reset_password_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/reset_password_cubit/reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
    : super(const ResetPasswordState.initial());

  Future<void> doEvent(ResetPasswordIntent event) async {
    switch (event) {
      case ResetPasswordEvent(:final params):
        await _resetPassword(params);
    }
  }

  Future<void> _resetPassword(ResetPasswordParams params) async {
    emit(const ResetPasswordState.loading());
    final response = await _resetPasswordUseCase.call(params);
    switch (response) {
      case SuccessResponse<ResetPasswordEntity>(:final data):
        emit(ResetPasswordState.success(data));
      case ErrorResponse<ResetPasswordEntity>(:final errMessage):
        emit(ResetPasswordState.error(errMessage));
    }
  }
}
