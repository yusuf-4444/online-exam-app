import 'package:flutter/widgets.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({
    super.key,
    required this.passwordController,
    this.validatorForm,
  });

  final TextEditingController passwordController;
  final void Function(String)? validatorForm;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      labelText: AppStrings.newPassword,
      hintText: AppStrings.enterNewPassword,
      obscureText: true,
      onChanged: (_) => validatorForm?.call(passwordController.text),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.passwordRequired;
        }

        if (value.length < 6) {
          return AppStrings.passwordMustBeAtLeast6Characters;
        }

        return null;
      },
    );
  }
}
