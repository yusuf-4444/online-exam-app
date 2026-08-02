import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.success(UserEntity user) = _Success;
  const factory SignInState.error(String message) = _Error;
}
