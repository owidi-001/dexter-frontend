import 'package:dexter/models/exception.dart';
import 'package:dexter/models/notification_model.dart';
import 'package:dexter/models/products_model.dart';
import 'package:dexter/services/api_client_service.dart';
import 'package:dexter/utils/constants.dart';

class AppService {
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

  // Product services
  Future<HttpResult<List<Product>>> fetchProducts() =>
      HttpClient.get2<List<Product>>(APIRoutes.products,
          der: (data) =>
              data.map<Product>((json) => Product.fromJson(json)).toList());

  // Create new product
  Future<HttpResult<Product>> productCreate(
          {required Map<String, dynamic> data}) =>
      HttpClient.post2<Product>(
        APIRoutes.products,
        data: data,
        der: (data) => Product.fromJson(data),
      );

  // Update existing product
  Future<HttpResult<Product>> productUpdate(
          {required int id, required Map<String, dynamic> data}) =>
      HttpClient.patch2<Product>(
        APIRoutes.products,
        data: data,
        der: (data) => Product.fromJson(data),
      );

  // Delete product
  Future<HttpResult<Product>> productDelete({required int data}) =>
      HttpClient.delete2<Product>(
        APIRoutes.products,
        data: data,
        der: (data) => Product.fromJson(data),
      );
}
