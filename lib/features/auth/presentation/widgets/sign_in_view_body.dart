import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16).r,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gap(24.h),
              CustomTextFormField(
                hintText: AppStrings.enterYourEmail,
                labelText: AppStrings.email,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.emailRequired;
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return AppStrings.invalidEmail;
                  }
                  return null;
                },
              ),
              Gap(24.h),
              CustomTextFormField(
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
              ),

              Gap(16.5.h),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text(
                        AppStrings.rememberMe,
                        style: AppTextStyles.regular13.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.forgotPassword);
                    },
                    child: Text(
                      AppStrings.forgetPassword,
                      style: AppTextStyles.regular12.copyWith(
                        decoration: TextDecoration.underline,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(48.h),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  minimumSize: Size(double.infinity, 48.h),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    log("Form is valid. Proceed with login logic.");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12).r,
                  child: Text(
                    AppStrings.login,
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAccount,
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Gap(4.w),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      AppStrings.signUp,
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
      ),
    );
  }
}
