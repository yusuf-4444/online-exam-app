import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';

part 'forgot_password_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordResponseModel {
  final String message;

  ForgotPasswordResponseModel({required this.message});

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseModelToJson(this);

  ForgotPasswordEntity toDomain() {
    return ForgotPasswordEntity(message: message);
  }
}
