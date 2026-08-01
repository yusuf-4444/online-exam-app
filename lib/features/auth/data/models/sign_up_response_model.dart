import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_up_entity.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpResponseModel {
  final String? message;
  final String? token;
  final UserModel? user;

  SignUpResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);

  SignUpEntity toEntity() {
    return SignUpEntity(message: message, token: token, user: user?.toDomain());
  }
}
