import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  final String message;

  VerifyOtpResponseModel({
    required this.message,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VerifyOtpResponseModelToJson(this);

  VerifyOtpEntity toDomain() {
    return VerifyOtpEntity(
      message: message,
    );
  }
}