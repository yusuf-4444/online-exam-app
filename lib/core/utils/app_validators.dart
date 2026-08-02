import 'package:online_exam_app/core/utils/app_strings.dart';

class AppValidators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value.length < 6) {
      return AppStrings.invalidPassword;
    }
    return null;
  }

  static String? confirmPassword(String? value, String originalPassword) {
    final passwordError = password(value);
    if (passwordError != null) return passwordError;
    if (value != originalPassword) return AppStrings.passwordNotMatch;
    return null;
  }

  static String? required(String? value, String errorMessage) {
    return (value == null || value.isEmpty) ? errorMessage : null;
  }

  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.userNameIsNotValid;
    }
    return null;
  }

  static String? firstName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.firstNameIsNotValid;
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.lastNameIsNotValid;
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneIsNotValid;
    }
    return null;
  }
}
