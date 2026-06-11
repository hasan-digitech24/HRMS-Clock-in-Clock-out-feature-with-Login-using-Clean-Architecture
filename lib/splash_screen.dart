import 'package:flutter/material.dart';
import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/routing_service/app_routes.dart';
import 'package:login_api/app/core/services/routing_service/named_routes.dart';
import 'package:login_api/app/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the next screen after the delay
      AuthHandler.ref.init(context);
      checkUserLoginOrNot();
    });
    super.initState();
  }

  // This widget is the root of your application.
  Future<void> checkUserLoginOrNot() async {
    if (await AuthHandler.ref.isLoggedIn) {
      AppRouterGo.pushReplacement(homeScreen);
    } else {
      AppRouterGo.pushReplacement(loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          'Welcome to the App',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
