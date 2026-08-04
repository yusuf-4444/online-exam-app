import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_state.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/otp_text_field.dart';

class VerifyOtpPinField extends StatefulWidget {
  const VerifyOtpPinField({super.key, required this.email});

  final String email;

  @override
  State<VerifyOtpPinField> createState() => _VerifyOtpPinFieldState();
}

class _VerifyOtpPinFieldState extends State<VerifyOtpPinField> {
  final controllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      } else {
        final otp = controllers.map((e) => e.text).join();
        context.read<VerifyOtpCubit>().doEvent(
          VerifyOtpEvent(params: VerifyOtpParams(resetCode: otp)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (verifyOtpEntity) {
            context.goNamed(AppRoutes.resetPassword, extra: widget.email);
          },
        );
      },
      builder: (context, state) {
        final hasError = state.maybeWhen(
          error: (_) => true,
          orElse: () => false,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return OtpTextField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  hasError: hasError,
                  textInputAction: index == 3
                      ? TextInputAction.done
                      : TextInputAction.next,
                  onChanged: (value) {
                    if (hasError) {
                      context.read<VerifyOtpCubit>().doEvent(
                        ClearVerifyOtpErrorEvent(),
                      );
                    }
                    _onOtpChanged(value, index);
                  },
                );
              }),
            ),
            SizedBox(height: 8.h),
            state.maybeWhen(
              error: (_) => Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 16,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      AppStrings.invalidCode,
                      style: AppTextStyles.regular14.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
