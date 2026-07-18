class ForgotPasswordRequestModel {
  final String email;

  ForgotPasswordRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordRequestModel(email: json['email']);
  }
}
