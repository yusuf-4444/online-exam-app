import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/shared/custom_text_button.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.isFormValidNotifier,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final ValueNotifier<bool> isFormValidNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFormValidNotifier,
      builder: (context, isFormValid, child) {
        return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (forgotPasswordEntity) {
                context.goNamed(
                  AppRoutes.verifyOtp,
                  extra: emailController.text,
                );
              },
              error: (message) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(message)));
              },
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
                        context.read<ForgotPasswordCubit>().doEvent(
                          ForgotPasswordEvent(
                            params: ForgotPasswordParams(
                              email: emailController.text,
                            ),
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
                      padding: const EdgeInsets.only(top: 12, bottom: 12).r,
                      child: Text(
                        AppStrings.continueButton,
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
