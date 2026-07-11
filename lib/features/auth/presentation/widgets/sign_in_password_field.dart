import 'package:flutter/widgets.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({
    super.key,
    required this._passwordController,
    this._validateForm,
  });
  final TextEditingController _passwordController;
  final void Function(String)? _validateForm;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: (_) => _validateForm?.call(_passwordController.text),
      hintText: AppStrings.enterYourPassword,
      labelText: AppStrings.password,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.passwordRequired;
        }
        if (value.length < 6) {
          return AppStrings.invalidPassword;
        }
        return null;
      },
      controller: _passwordController,
    );
  }
}
