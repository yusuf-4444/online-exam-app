import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VerifyOtpRequestModel {
  final String resetCode;

  VerifyOtpRequestModel({required this.resetCode});

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequestModel(resetCode: json['resetCode']);
  }

  Map<String, dynamic> toJson() {
    return {'resetCode': resetCode};
  }
}
