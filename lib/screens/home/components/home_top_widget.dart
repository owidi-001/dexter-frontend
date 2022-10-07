import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Text(
          "Dexter",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Playfair',
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(8.0)),
            child: Image.asset(
              "assets/images/user.png",
              fit: BoxFit.fill,
            )),
      ],
    );
  }
}
