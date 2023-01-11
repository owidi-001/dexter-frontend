import 'package:dexter/models/exception.dart';
import 'package:dexter/models/notification_model.dart';
import 'package:dexter/models/products_model.dart';
import 'package:dexter/models/user_model.dart';
import 'package:dexter/services/api_client_service.dart';
import 'package:dexter/utils/constants.dart';
import 'package:dexter/utils/prefs.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class AppService {
  /// NOTIFICATIONS SERVICE
  // fetch notifications
  Future<HttpResult<List<AppNotification>>> fetchNotifications() =>
      HttpClient.get2<List<AppNotification>>(APIRoutes.notifications,
          der: (data) => data
              .map<AppNotification>((json) => AppNotification.fromJson(json))
              .toList());

  // read notification
  Future<HttpResult<AppNotification>> readNotification(
          {required Map<String, dynamic> data}) =>
      HttpClient.patch2<AppNotification>(
        APIRoutes.notifications,
        data: data,
        der: (data) => AppNotification.fromJson(data),
      );

  // delete notification
  Future<HttpResult<AppNotification>> deleteNotification(
          {required Map<String, dynamic> data}) =>
      HttpClient.delete2<AppNotification>(
        APIRoutes.notifications,
        data: data,
        der: (data) => AppNotification.fromJson(data),
      );

  /// PRODUCTS SERVICE
  // fetch products services
  Future<HttpResult<List<Product>>> fetchProducts() =>
      HttpClient.get2<List<Product>>(APIRoutes.products,
          der: (data) =>
              data.map<Product>((json) => Product.fromJson(json)).toList());

  // Create a product item
  Future<http.StreamedResponse> productCreate(
      String filePath, Map<String, String> data) async {
    // Fetch auth token
    String token = await UserPreferences().getToken();

    var headers = {
      'Authorization': "Token $token",
    };

    // Endpoint and request method
    var request = http.MultipartRequest('POST', Uri.parse(APIRoutes.products));

    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromPath('image', filePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
    return response;
  }

  // Update existing product
  // Future<HttpResult<Product>> productUpdate(
  //         {required Map<String, dynamic> data}) =>
  //     HttpClient.patch2<Product>(
  //       APIRoutes.products,
  //       data: data,
  //       der: (data) => Product.fromJson(data),
  //     );
  Future<http.StreamedResponse> productUpdate(
      String? filePath, Map<String, String> data) async {
    // Fetch auth token
    String token = await UserPreferences().getToken();

    var headers = {
      'Authorization': "Token $token",
    };

    // Endpoint and request method
    var request = http.MultipartRequest('PATCH', Uri.parse(APIRoutes.products));

    request.fields.addAll(data);
    if (filePath != null) {
      request.files.add(await http.MultipartFile.fromPath('image', filePath));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
    return response;
  }

  // Delete product
  Future<HttpResult<Product>> productDelete(
          {required Map<String, dynamic> data}) =>
      HttpClient.delete2<Product>(
        APIRoutes.products,
        data: data,
        der: (data) => Product.fromJson(data),
      );

  /// CART SERVICE
  // save cart
  Future<HttpResult<void>> saveOrder({required Map<String, dynamic> data}) =>
      HttpClient.post2<void>(
        APIRoutes.cart,
        data: data,
        der: (data) => data,
      );

  /// USER SERVICE
  // login
  Future<HttpResult<User>> login({required Map<String, String> data}) =>
      HttpClient.post2<User>(
        APIRoutes.login,
        data: data,
        der: (data) => User.fromJson(data),
      );

  // register
  Future<HttpResult<User>> register({required Map<String, String> data}) =>
      HttpClient.post2<User>(
        APIRoutes.register,
        data: data,
        der: (data) => User.fromJson(data),
      );

  // Update profile
  Future<HttpResult<User>> updateProfile({required Map<String, String> data}) =>
      HttpClient.post2<User>(
        APIRoutes.profileUpdate,
        data: data,
        der: (data) => User.fromJson(data),
      );
}
