import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:online_exam_app/core/shared/custom_text_form_field.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login, style: AppTextStyles.medium20),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: Column(
          children: [
            Gap(24.h),
            const CustomTextFormField(
              hintText: AppStrings.enterYourEmail,
              labelText: AppStrings.email,
            ),
            Gap(16.h),
            const CustomTextFormField(
              hintText: AppStrings.enterYourPassword,
              labelText: AppStrings.password,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
