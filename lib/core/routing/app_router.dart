import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/features/auth/presentation/view/forget_password_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:online_exam_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:online_exam_app/features/splash/presentation/view/splash_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/signIn',
      name: AppRoutes.signIn,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SignInCubit>(),
        child: const SignInView(),
      ),
    ),

    GoRoute(
      path: '/signUp',
      name: AppRoutes.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SignUpCubit>(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: '/forgotPassword',
      name: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
  ],
);
