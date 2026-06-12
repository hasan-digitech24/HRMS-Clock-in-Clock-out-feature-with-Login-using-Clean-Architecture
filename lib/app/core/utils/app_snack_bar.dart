import 'package:flutter/material.dart';
import 'package:login_api/app/core/services/routing_service/named_routes.dart';
import 'package:login_api/app/core/theme/app_colors.dart';
import 'package:login_api/app/core/utils/app_extensions.dart';


class Prompt {
  static final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static void showErrorDialog(
    String message, {
    String? title,
    String? buttonTitle,
    Function()? onTap,
  }) {
    final context = AppRouterGo.context;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Text(title ?? 'Error'),
          content: Text(message.capitalizeSentence),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onTap != null) {
                  onTap();
                }
              },
              child: Text(buttonTitle ?? 'OK'),
            ),
          ],
        ),
      );
  
  }

  static void show(String message, {Color? backgroundColor}) {
    // final messenger = _messengerKey.currentState;

      ScaffoldMessenger.of(AppRouterGo.context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Close',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(AppRouterGo.context).hideCurrentSnackBar();
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(milliseconds: 500),
          content: Text(message.capitalizeSentence),
          backgroundColor: backgroundColor ?? AppColors.black,
          behavior: SnackBarBehavior.floating,
        ),
      );
    
  }

  static void showSuccess(String message) {
    show(message, backgroundColor: AppColors.lightGreen);
  }

  static void showError(String message) {
    show(message, backgroundColor: AppColors.utahCrimson);
  }
}

class TopSnackBar {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context,
    String message, {
    Color color = Colors.black,
  }) {
    final overlay = Overlay.of(context);

    _overlayEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 8),
              ],
            ),
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }
}

/////
