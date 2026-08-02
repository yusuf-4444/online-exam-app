import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success(UserEntity user) = _Success;
  const factory SignUpState.error(String message) = _Error;
}
