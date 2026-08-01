import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignInResponseModel {
  final String? message;
  final String? token;
  final UserModel? user;

  SignInResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);

  SignInEntity toEntity() {
    return SignInEntity(message: message, token: token, user: user?.toDomain());
  }
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final String createdAt;

  UserModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toDomain() {
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
    );
  }
}
