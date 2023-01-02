import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
      prefixIcon: Icon(icon),
      hoverColor: AppTheme.secondary,
      focusColor: AppTheme.secondary,
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: hintText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppTheme.secondary)));
}

Material submitButton(String title, Function() function) {
  return Material(
    elevation: 5,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    color: AppTheme.secondary,
    child: MaterialButton(
      onPressed: function,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: double.infinity,
      child: Text(
        title,
        style: const TextStyle(
            color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}

OutlinedButton uploadButton(String title, Function() function, IconData icon) {
  return OutlinedButton.icon(
    onPressed: function,
    icon: Icon(icon, size: 18),
    label: Text(
      textAlign: TextAlign.start,
      title,
    ),
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minimumSize: const Size(double.infinity, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(
          color: AppTheme.secondary, fontWeight: FontWeight.bold, fontSize: 18),
    ),
  );
}
