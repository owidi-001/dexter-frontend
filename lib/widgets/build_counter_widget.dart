import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

SizedBox buildOutlineButton(
      {required IconData icon, required Function() press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: AppTheme.primary,
        ),
      ),
    );
  }