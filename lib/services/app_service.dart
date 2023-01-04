import 'package:dexter/models/exception.dart';
import 'package:dexter/models/notification_model.dart';
import 'package:dexter/models/products_model.dart';
import 'package:dexter/models/user_model.dart';
import 'package:dexter/services/api_client_service.dart';
import 'package:dexter/utils/constants.dart';

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

  // fetch product images
  Future<HttpResult<List<ProductImage>>> fetchProductImages() =>
      HttpClient.get2<List<ProductImage>>(APIRoutes.productImages,
          der: (data) => data
              .map<ProductImage>((json) => ProductImage.fromJson(json))
              .toList());

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
          {required Map<String, dynamic> data}) =>
      HttpClient.patch2<Product>(
        APIRoutes.products,
        data: data,
        der: (data) => Product.fromJson(data),
      );

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
