import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.success(
    ForgotPasswordEntity entity,
  ) = _Success;
  const factory ForgotPasswordState.error(String message) = _Error;
}
