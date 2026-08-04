import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/features/auth/presentation/view/forgot_password_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/reset_password_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/verify_otp_view.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/widgets/verify_otp_view_body.dart';

// import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
// import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
// import 'package:online_exam_app/features/splash/presentation/view/splash_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/forgotPassword',
  routes: [
    // GoRoute(
    //   path: '/',
    //   name: AppRoutes.splash,
    //   builder: (context, state) => const SplashView(),
    // ),
    // GoRoute(
    //   path: '/signIn',
    //   name: AppRoutes.signIn,
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => getIt<SignInCubit>(),
    //     child: const SignInView(),
    //   ),
    // ),
    //
    // GoRoute(
    //   path: '/signUp',
    //   name: AppRoutes.signUp,
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => getIt<SignUpCubit>(),
    //     child: const SignUpView(),
    //   ),
    // ),
    GoRoute(
      path: '/forgotPassword',
      name: AppRoutes.forgotPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ForgotPasswordCubit>(),
        child: const ForgetPasswordView(),
      ),
    ),
    GoRoute(
      path: '/verifyOtp',
      name: AppRoutes.verifyOtp,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<VerifyOtpCubit>(),
        child: VerifyOtpView(email: state.extra as String),
      ),
    ),

    GoRoute(
      path: '/resetPassword',
      name: AppRoutes.resetPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ResetPasswordCubit>(),
        child: ResetPasswordView(email: state.extra as String),
      ),
    ),
  ],
);
