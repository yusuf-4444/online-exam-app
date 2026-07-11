import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/routing/app_routes.dart';
import 'package:online_exam_app/features/auth/data/datasource/local/auth_local_data_source.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    print('1- Before getToken');
    final token = await getIt<AuthLocalDataSource>().getToken().timeout(
      const Duration(seconds: 3),
      onTimeout: () => null,
    );
    print('2- After getToken, token = $token');
    if (!mounted) return;
    if (token != null) {
      context.go(AppRoutes.home);
    } else {
      context.go(AppRoutes.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
