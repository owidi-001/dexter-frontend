import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
      prefixIcon: Icon(icon),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}

Material submitButton(String title, Function() function) {
  return Material(
    elevation: 5,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    color: AppTheme.primary,
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

// Upload
// Material upload(String title, Function() function) {
//   return Material(
//     elevation: 0,
//     borderRadius: const BorderRadius.all(Radius.circular(10)),
//     color: AppTheme.secondary,
//     child: MaterialButton(
//       onPressed: function,
//       padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//       minWidth: double.infinity,
//       child: Text(
//         textAlign: TextAlign.start,
//         title,
//         style: const TextStyle(
//             color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 18),
//       ),
//     ),
//   );
// }

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
          color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 18),
    ),
  );
}
