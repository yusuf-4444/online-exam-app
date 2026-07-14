import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/shared/custom_text_button.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isFormValidNotifier,
    required this.rememberMe,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isFormValidNotifier;
  final bool rememberMe;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFormValidNotifier,
      builder: (context, isFormValid, child) {
        return BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (user) {
                context.goNamed(AppRoutes.home);
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
                        context.read<SignInCubit>().doEvent(
                          SignInEvent(
                            email: emailController.text,
                            password: passwordController.text,
                            rememberMe: rememberMe,
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
                        AppStrings.login,
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
