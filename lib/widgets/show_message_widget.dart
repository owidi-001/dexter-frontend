import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

SnackBar snackMessage(bool success, String message, {int timeout = 1}) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: AppTheme.white),
    ),
    duration: Duration(seconds: timeout),
    backgroundColor: success ? AppTheme.primary : AppTheme.secondary,
    padding: const EdgeInsets.all(16.0),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
  );
}
