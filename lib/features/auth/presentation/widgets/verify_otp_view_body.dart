import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/verify_otp_pin_field.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/verify_otp_resend_code.dart';

class VerifyOtpViewBody extends StatelessWidget {
  const VerifyOtpViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16).r,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(40.h),
            Text(AppStrings.emailVerification, style: AppTextStyles.medium18),
            Gap(16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30).w,
              child: Text(
                AppStrings.sendOtp,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular14.copyWith(color: Colors.grey),
              ),
            ),
            Gap(32.h),
            VerifyOtpPinField(email: email),
            Gap(24.h),
            VerifyOtpResendCode(email: email),
          ],
        ),
      ),
    );
  }
}
