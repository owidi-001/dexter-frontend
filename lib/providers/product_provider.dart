import 'dart:collection';

import 'package:dexter/models/products_model.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  LoadingStatus status = LoadingStatus.unknown;

  List<Product> get products => _products;

  // Constructor
  ProductProvider() {
    status = LoadingStatus.unknown;
    _initFetch();
  }

  setProducts(List<Product> notifications) {
    _products = notifications;
    notifyListeners();
  }

  // fetch products
  Future<void> _initFetch() async {
    final res = await AppService().fetchProducts();

    if (kDebugMode) {
      print(res);
    }

    res.when(error: (error) {
      status = LoadingStatus.loadingFailure;
    }, success: (data) {
      if (kDebugMode) {
        print(data);
      }
      setProducts(data);
      status = LoadingStatus.loadingSuccess;
    });

    notifyListeners();
  }

  // Build categories
  List<String> buildCategories() {
    List<String> categories = _products.map((e) => e.type).toList();

    if (kDebugMode) {
      print(categories);
    }
    return categories;
  }

  // Get new notifications
  void refresh() async {
    await _initFetch();
    notifyListeners();
  }

  Product? findByName(String name) {
    for (var product in products) {
      if (product.name == name) {
        return product;
      }
    }
    return null;
  }
}
