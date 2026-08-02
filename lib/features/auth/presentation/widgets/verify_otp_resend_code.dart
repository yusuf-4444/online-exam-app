import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_intent.dart';

class VerifyOtpResendCode extends StatelessWidget {
  const VerifyOtpResendCode({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.didntReceiveCode,
          style: AppTextStyles.regular14,
        ),
        TextButton(
          onPressed: () {
            context.read<VerifyOtpCubit>().doEvent(
              ResendOtpEvent(email: email),
            );
          },
          child: Text(
            AppStrings.resend,
            style: AppTextStyles.regular16.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}