import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  String title;
  Function() onPressedCallBack;
  AppButtonWidget({super.key, required this.title, required this.onPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: AppTheme.primary,
      child: MaterialButton(
        onPressed: onPressedCallBack,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: double.infinity,
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
              color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
