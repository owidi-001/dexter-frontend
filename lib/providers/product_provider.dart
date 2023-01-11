import 'package:dexter/models/products_model.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  // List<ProductImage> _images = [];

  LoadingStatus status = LoadingStatus.unknown;
  LoadingStatus imageStatus = LoadingStatus.unknown;

  List<Product> get products => _products;

  // Constructor
  ProductProvider() {
    status = LoadingStatus.unknown;
    _initFetch();
    // _initFetchImages();
  }

  setProducts(List<Product> notifications) {
    _products = notifications;
    notifyListeners();
  }

  // fetch products
  Future<void> _initFetch() async {
    final res = await AppService().fetchProducts();

    res.when(error: (error) {
      status = LoadingStatus.loadingFailure;
    }, success: (data) {
      setProducts(data);
      status = LoadingStatus.loadingSuccess;
    });

    notifyListeners();
  }

  // Build categories
  List<String> buildCategories() {
    List<String> categories = _products.map((e) => e.type).toList();
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
