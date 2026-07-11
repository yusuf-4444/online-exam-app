import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';

class SignInRemeberMe extends StatefulWidget {
  const SignInRemeberMe({
    super.key,
    required this.rememberMe,
    required this.onChanged,
  });

  final bool rememberMe;
  final void Function(bool?)? onChanged;

  @override
  State<SignInRemeberMe> createState() => _SignInRemeberMeState();
}

class _SignInRemeberMeState extends State<SignInRemeberMe> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(value: widget.rememberMe, onChanged: widget.onChanged),
            Text(
              AppStrings.rememberMe,
              style: AppTextStyles.regular13.copyWith(color: AppColors.black),
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
    );
  }
}
