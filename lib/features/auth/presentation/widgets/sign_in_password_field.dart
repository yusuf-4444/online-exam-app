import 'package:flutter/widgets.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_validators.dart';

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
      validator: (value) => AppValidators.password(value),
      controller: _passwordController,
    );
  }
}
