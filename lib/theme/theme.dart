import 'package:dexter/utils/status.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff153564);
  static const Color gradient = Color(0xffe8f2fc);

  static const Color dark = Colors.black26;
  static const Color white = Colors.white;

  static const Color secondary = Colors.black54;

  static const Color danger = Colors.red;

  static const Map<Enum, Color> typeColor = {
    MessageTypes.success: Colors.green,
    MessageTypes.failure: Colors.red,
    MessageTypes.informative: Colors.blue,
    MessageTypes.warning: Colors.amberAccent
  };
}
