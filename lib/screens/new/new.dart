import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        SizedBox(
          height: 64,
        ),
        Center(
          child: Text("New"),
        )
      ],
    );
  }
}