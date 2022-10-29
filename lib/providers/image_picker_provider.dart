import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier {
  late XFile _file;
  LoadingStatus pickStatus = LoadingStatus.unknown;

  XFile get file => _file;

  void setFile(XFile file) {
    if (kDebugMode) {
      print("Image pick provider has been accessed");
    }

    _file = file;

    if (kDebugMode) {
      print("Image saved to provider is ${file.path}");
    }

    pickStatus = LoadingStatus.loadingSuccess;
    notifyListeners();
  }
}
