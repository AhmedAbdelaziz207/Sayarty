import 'package:flutter/material.dart';

class SnackBarUtil {
  static void show({
    required BuildContext context,
    required String message,
    bool isSuccess = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    Duration duration = const Duration(seconds: 3),
  }) {
    final Color backgroundColor = isSuccess ? Colors.green : Colors.red;
    final IconData icon = isSuccess ? Icons.check_circle : Icons.error;

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: position == SnackbarPosition.top
          ? const EdgeInsets.fromLTRB(16, 40, 16, 0)
          : const EdgeInsets.fromLTRB(16, 0, 16, 20),
      duration: duration,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum SnackbarPosition { top, bottom }
