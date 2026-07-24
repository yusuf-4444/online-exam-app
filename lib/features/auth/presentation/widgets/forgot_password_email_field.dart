import 'package:flutter/widgets.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';

class ForgotPasswordEmailField extends StatelessWidget {
  const ForgotPasswordEmailField({
    super.key,
    required this.emailController,
    this.validatorForm,
  });

  final TextEditingController emailController;
  final void Function(String)? validatorForm;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: (_) => validatorForm?.call(emailController.text),
      hintText: AppStrings.enterYourEmail,
      labelText: AppStrings.email,
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.emailRequired;
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return AppStrings.invalidEmail;
        }
        return null;
      },
    );
  }
}