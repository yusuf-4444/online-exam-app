import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_validators.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_up_already_have_account.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_up_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier(false);
  void _validatForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    _isFormValidNotifier.value = isValid;
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16).r,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Gap(24.h),
            CustomTextFormField(
              validator: AppValidators.username,
              controller: _usernameController,
              hintText: AppStrings.enterYourUsername,
              labelText: AppStrings.username,
              onChanged: (_) => _validatForm(),
            ),
            Gap(24.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    validator: (value) => AppValidators.firstName(value),
                    controller: _firstNameController,
                    hintText: AppStrings.enterYourFirstName,
                    labelText: AppStrings.firstName,
                    onChanged: (_) => _validatForm(),
                  ),
                ),
                Gap(17.w),
                Expanded(
                  child: CustomTextFormField(
                    validator: (value) => AppValidators.lastName(value),
                    controller: _lastNameController,
                    hintText: AppStrings.enterYourLastName,
                    labelText: AppStrings.lastName,
                    onChanged: (_) => _validatForm(),
                  ),
                ),
              ],
            ),
            Gap(24.h),
            CustomTextFormField(
              validator: (value) => AppValidators.email(value),
              controller: _emailController,
              hintText: AppStrings.enterYourEmail,
              labelText: AppStrings.email,
              onChanged: (_) => _validatForm(),
            ),
            Gap(24.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onChanged: (_) => _validatForm(),
                    controller: _passwordController,
                    hintText: AppStrings.enterYourPassword,
                    labelText: AppStrings.password,
                    obscureText: true,
                    validator: AppValidators.password,
                  ),
                ),
                Gap(17.w),
                Expanded(
                  child: CustomTextFormField(
                    onChanged: (_) => _validatForm(),
                    controller: _confirmPasswordController,
                    hintText: AppStrings.enterYourConfirmPassword,
                    labelText: AppStrings.confirmPassword,
                    obscureText: true,
                    validator: ((value) => AppValidators.confirmPassword(
                      _confirmPasswordController.text,
                      _passwordController.text,
                    )),
                  ),
                ),
              ],
            ),
            Gap(24.h),
            CustomTextFormField(
              validator: AppValidators.phone,
              hintText: AppStrings.enterPhoneNumber,
              labelText: AppStrings.phoneNumber,
              controller: _phoneNumberController,
              onChanged: (_) => _validatForm(),
            ),
            Gap(48.h),
            SignUpButton(
              formKey: _formKey,
              usernameController: _usernameController,
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              emailController: _emailController,
              passwordController: _passwordController,
              phoneNumberController: _phoneNumberController,
              isFormValidNotifier: _isFormValidNotifier,
            ),
            const SignUpAlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
