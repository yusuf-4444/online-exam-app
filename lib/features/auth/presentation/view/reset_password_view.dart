import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 0,
        title: Text(AppStrings.password, style: AppTextStyles.medium20),
        centerTitle: false,
      ),
      body: ResetPasswordViewBody(email: email,),
    );
  }
}
