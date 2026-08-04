import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/confirm_password_field.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/new_password_field.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/update_button.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _isFormValidNotifier.dispose();
    super.dispose();
  }

  void _validateForm() {
    _isFormValidNotifier.value = _formKey.currentState?.validate() ?? false;
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
              Text(
                AppStrings.resetPasswordTitle,
                style: AppTextStyles.medium18,
              ),
              Gap(16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26).w,
                child: Text(
                  AppStrings.resetPasswordDescription,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular14.copyWith(color: Colors.grey),
                ),
              ),
              Gap(32.h),
              NewPasswordField(
                passwordController: _passwordController,
                validatorForm: (_) => _validateForm(),
              ),

              Gap(24.h),

              ConfirmPasswordField(
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
                validatorForm: (_) => _validateForm(),
              ),

              Gap(48.h),

              UpdateButton(
                formKey: _formKey,
                passwordController: _passwordController,
                email: widget.email,
                isFormValidNotifier: _isFormValidNotifier,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
