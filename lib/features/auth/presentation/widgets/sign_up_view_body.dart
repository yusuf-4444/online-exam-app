import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/shared/custom_text_button.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';

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
    // TODO: implement dispose
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
              validator: (value) => value == null || value.isEmpty
                  ? AppStrings.userNameIsNotValid
                  : null,
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
                    validator: (value) => value == null || value.isEmpty
                        ? AppStrings.firstNameIsNotValid
                        : null,
                    controller: _firstNameController,
                    hintText: AppStrings.enterYourFirstName,
                    labelText: AppStrings.firstName,
                    onChanged: (_) => _validatForm(),
                  ),
                ),
                Gap(17.w),
                Expanded(
                  child: CustomTextFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? AppStrings.lastNameIsNotValid
                        : null,
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
              validator: (value) => value == null || value.isEmpty
                  ? AppStrings.invalidEmail
                  : null,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.passwordRequired;
                      }
                      if (value.length < 6) {
                        return AppStrings.invalidPassword;
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.passwordRequired;
                      }
                      if (value.length < 6) {
                        return AppStrings.invalidPassword;
                      }
                      if (value != _passwordController.text) {
                        return AppStrings.passwordNotMatch;
                      }

                      return null;
                    },
                  ),
                ),
              ],
            ),
            Gap(24.h),
            CustomTextFormField(
              validator: (value) => value == null || value.isEmpty
                  ? AppStrings.phoneIsNotValid
                  : null,
              hintText: AppStrings.enterPhoneNumber,
              labelText: AppStrings.phoneNumber,
              controller: _phoneNumberController,
              onChanged: (_) => _validatForm(),
            ),
            Gap(48.h),
            CustomTextButton(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              rememberMe: false,
              color: _isFormValidNotifier.value
                  ? AppColors.blue
                  : AppColors.grey,
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: Padding(
                padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                child: Text(
                  AppStrings.signUp,
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.alreadyHaveAccount,
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Gap(4.w),
                InkWell(
                  onTap: () {
                    context.pushNamed(AppRoutes.signIn);
                  },
                  child: Text(
                    AppStrings.signIn,
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
