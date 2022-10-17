import 'package:flutter/material.dart';

class NotificationTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
         Text(
          "Dexter",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Playfair',
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ],
    );
  }
}
