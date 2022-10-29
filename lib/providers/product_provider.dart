import 'package:dexter/models/products_model.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider._();
  static final instance = ProductProvider._();

  List<Product> products = Product.products;
  LoadingStatus status = LoadingStatus.unknown;

  void loadingStatusChanged(LoadingStatus status) {
    this.status = status;
    notifyListeners();
  }

  void setProducts({required List<Product> products}) {
    this.products = products;
    status = LoadingStatus.loadingSuccess;
    notifyListeners();
  }

  Product? findByName(String name) {
    for (var product in products) {
      if (product.name == name) {
        return product;
      }
    }
  }
}
