import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/forgot_password_button.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/forgot_password_email_field.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailController.dispose();
    _isFormValidNotifier.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    _isFormValidNotifier.value = isValid;
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
              Gap(40.h),
              Text(AppStrings.forgotPassword, style: AppTextStyles.medium18),
              Gap(16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: Text(
                  AppStrings.pleaseEnterYourEmailAssociatedToYourAccount,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular14.copyWith(color: Colors.grey),
                ),
              ),
              Gap(32.h),
              ForgotPasswordEmailField(
                emailController: _emailController,
                validatorForm: (_) => _validateForm(),
              ),
              Gap(48.h),

              ForgotPasswordButton(
                formKey: _formKey,
                emailController: _emailController,
                isFormValidNotifier: _isFormValidNotifier,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
