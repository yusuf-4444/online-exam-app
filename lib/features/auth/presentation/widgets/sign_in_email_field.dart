import 'package:flutter/widgets.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_validators.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({
    super.key,
    this.validatorForm,
    required this.emailController,
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
      validator: (value) => AppValidators.email(value),
    );
  }
}
