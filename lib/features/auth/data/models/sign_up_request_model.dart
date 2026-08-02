class SignUpRequestModel {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;

  SignUpRequestModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phoneNumber,
    };
  }

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      userName: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phone'],
    );
  }
}
