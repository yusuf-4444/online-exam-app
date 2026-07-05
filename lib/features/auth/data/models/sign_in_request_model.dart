class SignInRequestModel {
  SignInRequestModel({required this.email, required this.password});
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) {
    return SignInRequestModel(email: json['email'], password: json['password']);
  }
}
