
import 'package:dexter/providers/image_picker_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future pickImage(source) async {
  final ImagePicker _picker = ImagePicker();

  // Pick an image
  final XFile? _image = await _picker.pickImage(source: source);

  // Set state to the picked image
  if (_image != null) {
    if (kDebugMode) {
      print("Image has been picked");
    }
    ImagePickerProvider().setFile(_image); /// TODO! Find a way of doing this without instantiation
  } else {
    if (kDebugMode) {

      print("Image not picked");
    }
  }
}
