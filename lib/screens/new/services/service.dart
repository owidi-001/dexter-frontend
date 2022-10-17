
import 'package:http/http.dart' as http;

import 'package:dexter/utils/constants.dart';

class ImageUploadService {
  // Uploads image to the server
  Future<bool> upload(Map<String, String> body, String filepath) async {
    String url = '$baseUrl/upload'; // path to upload

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      "Authorization": "Token " // auth token if nay
    };

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));

    var response = await request.send();

    if (response.statusCode == 201) {
      // Created successfully
      return true;
    } else {
      // Failed to save
      return false;
    }
  }
}
