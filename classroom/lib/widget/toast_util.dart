import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static void showMessage(
    BuildContext context,
    String message, {
    bool isSuccess = true,
  }) {
    toastification.show(
      context: context,
      title: Text(
        isSuccess ? "Success" : "Error",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message, style: const TextStyle(color: Colors.white)),
      type: isSuccess ? ToastificationType.success : ToastificationType.error,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
    );
  }
}
