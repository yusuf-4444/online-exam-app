import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/features/auth/presentation/view/forget_password_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/sign_up_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.signIn,
      builder: (context, state) => const SignInView(),
    ),

    GoRoute(
      path: '/signUp',
      name: AppRoutes.signUp,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: '/forgotPassword',
      name: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
  ],
);
