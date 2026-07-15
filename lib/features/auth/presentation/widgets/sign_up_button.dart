import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/shared/custom_text_button.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_bloc.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_state.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneNumberController,
    required this.isFormValidNotifier,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneNumberController;
  final ValueNotifier<bool> isFormValidNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFormValidNotifier,
      builder: (context, isFormValid, child) {
        return BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (user) => context.goNamed(AppRoutes.home),
              error: (message) => ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message))),
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return CustomTextButton(
              color: isFormValid ? AppColors.blue : AppColors.grey,
              onPressed: isLoading
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        context.read<SignUpBloc>().add(
                          SignUpEvent(
                            username: usernameController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phoneNumber: phoneNumberController.text,
                          ),
                        );
                      }
                    },
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                      child: Text(
                        AppStrings.signUp,
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
