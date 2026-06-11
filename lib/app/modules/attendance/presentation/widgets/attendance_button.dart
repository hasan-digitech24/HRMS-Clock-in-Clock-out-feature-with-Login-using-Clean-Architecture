import 'package:flutter/material.dart';

class AttendanceButton extends StatelessWidget {
  final String labelText;
  final Color backgroundColor;
  final bool? isClockedIn;
  final VoidCallback? onPress;
  final bool isloading;
  final bool buttonenable;
  const AttendanceButton({
    super.key,
    required this.labelText,
    required this.backgroundColor,
    required this.isClockedIn,
    required this.onPress,
    this.isloading = false,
    required this.buttonenable,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton.icon(
        onPressed: (isloading || isClockedIn == false || buttonenable == false) ? null : onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: isloading ? null : const Icon(Icons.login, color: Colors.white),
        label: isloading
            ? SizedBox(
                height: 20,
                width: 20,
                child: const CircularProgressIndicator(
                  color: Color(0xff25B885),
                ),
              )
            : Text(
                labelText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
