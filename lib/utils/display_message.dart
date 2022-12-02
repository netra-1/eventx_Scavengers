import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void displaySuccessMessage(BuildContext context, String message) {
  MotionToast.success(
    description: Text(message),
    enableAnimation: true,
    toastDuration: const Duration(seconds: 1),
  ).show(context);
}

void displayErrorMessage(BuildContext context, String message) {
  MotionToast.error(
    description: Text(message),
    enableAnimation: true,
    toastDuration: const Duration(seconds: 1),
  ).show(context);
}
