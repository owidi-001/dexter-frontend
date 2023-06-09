import 'package:dexter/models/exception.dart';
import 'package:dexter/utils/constants.dart';
import 'package:dexter/utils/prefs.dart';
import 'package:dio/dio.dart';

class HttpClient {
  static Dio dio = Dio(BaseOptions(baseUrl: baseUrl))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: ((options, handler) async {
          String token = await UserPreferences().getToken();
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Token $token";
          }
          return handler.next(options);
        }),
      ),
    );

  // get
  static Future<Response> get(String url) {
    return dio.get(url);
  }

  // post
  static Future<Response> post(String url, dynamic data) {
    return dio.post(url, data: data);
  }

  // post
  static Future<Response> patch(String url, dynamic data) {
    return dio.patch(url, data: data);
  }

  // post
  static Future<Response> delete(String url, dynamic data) {
    return dio.delete(url, data: data);
  }

// get
  static Future<HttpResult<T>> get2<T>(
    String url, {
    T Function(dynamic data)? der,
  }) async {
    try {
      final results = await HttpClient.get(url);

      return HttpResult.success(
        der != null ? der(results.data) : results.data,
      );
    } catch (e) {
      // if (kDebugMode) {
      //   print(e);
      // }
      return HttpResult.error(Failure.getException(e));
    }
  }

  // post
  static Future<HttpResult<T>> post2<T>(
    String url, {
    dynamic data,
    T Function(dynamic data)? der,
  }) async {
    try {
      final results = await HttpClient.post(
        url,
        data,
      );

      return HttpResult.success(
        der != null ? der(results.data) : results.data,
      );
    } catch (e) {
      return HttpResult.error(Failure.getException(e));
    }
  }

  // patch request
  static Future<HttpResult<T>> patch2<T>(
    String url, {
    dynamic data,
    T Function(dynamic data)? der,
  }) async {
    try {
      final results = await HttpClient.patch(
        url,
        data,
      );

      return HttpResult.success(
        der != null ? der(results.data) : results.data,
      );
    } catch (e) {
      return HttpResult.error(Failure.getException(e));
    }
  }

  // TODO! review what delete returns
  // delete
  static Future<HttpResult<T>> delete2<T>(
    String url, {
    dynamic data,
    T Function(dynamic data)? der,
  }) async {
    try {
      final results = await HttpClient.delete(
        url,
        data,
      );

      return HttpResult.success(
        der != null ? der(results.data) : results.data,
      );
    } catch (e) {
      return HttpResult.error(Failure.getException(e));
    }
  }
}
