import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_entity.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;

  const factory ResetPasswordState.loading() = _Loading;

  const factory ResetPasswordState.success(ResetPasswordEntity entity) =
      _Success;

  const factory ResetPasswordState.error(String message) = _Error;
}
