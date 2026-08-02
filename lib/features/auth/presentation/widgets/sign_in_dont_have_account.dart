import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';

class SignInDontHaveAccount extends StatelessWidget {
  const SignInDontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: AppTextStyles.regular14.copyWith(color: AppColors.black),
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
    );
  }
}
