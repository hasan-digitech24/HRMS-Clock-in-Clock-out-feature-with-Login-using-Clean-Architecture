import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_api/app/core/services/routing_service/app_routes.dart';
import 'package:login_api/app/modules/authentication/presentation/screens/login_screen.dart';
import 'package:login_api/app/modules/attendance/presentation/screens/home_screen.dart';
import 'package:login_api/splash_screen.dart';

// import 'package:pakistan_cables_mobile/src/core/services/routing_service/app_routes.dart';

class AppRouterGo {
  static BuildContext get context =>
      appRouter.routerDelegate.navigatorKey.currentContext!;

  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );

  static void back() {
    if (context.canPop()) {
      context.pop();
    }
  }

  static void push(
    location, {
    Map<String, dynamic>? extra,
    Future<void> Function()? onThen,
  }) {
    context.push(location, extra: extra).then((value) {
      onThen?.call();
    });
  }

  static void pushRemoveUntil(location) {
    context.go(location);
  }

  static void pushReplacement(location) {
    context.replace(location);
  }
  
}