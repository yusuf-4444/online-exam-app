import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_in_button.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_in_dont_have_account.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_in_email_field.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_in_password_field.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/sign_in_remeber_me.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier<bool>(false);
  bool _rememberMe = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
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
              Gap(24.h),
              SignInEmailField(
                emailController: _emailController,
                validatorForm: (_) => _validateForm(),
              ),
              Gap(24.h),

              SignInPasswordField(
                passwordController: _passwordController,
                validateForm: (_) => _validateForm(),
              ),

              Gap(16.5.h),

              SignInRemeberMe(
                rememberMe: _rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),

              Gap(48.h),

              SignInButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                isFormValidNotifier: _isFormValidNotifier,
                rememberMe: _rememberMe,
              ),

              Gap(16.h),
              const SignInDontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
