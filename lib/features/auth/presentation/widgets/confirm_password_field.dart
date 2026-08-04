import 'package:flutter/widgets.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    this.validatorForm,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final void Function(String)? validatorForm;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: confirmPasswordController,
      labelText: AppStrings.confirmPassword,
      hintText: AppStrings.confirmPassword,
      obscureText: true,
      onChanged: (_) => validatorForm?.call(confirmPasswordController.text),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.confirmPasswordRequired;
        }

        if (value != passwordController.text) {
          return AppStrings.passwordNotMatched;
        }

        return null;
      },
    );
  }
}
