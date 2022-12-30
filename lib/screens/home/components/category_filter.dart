import 'package:dexter/models/products_model.dart';

List<Product> categoryFilter(List<Product> allProducts, String query) {
  if (query.toUpperCase() == "ALL" || query.isEmpty) {
    return allProducts;
  }
  return allProducts
      .where(
          (element) => element.type.toUpperCase().contains(query.toUpperCase()))
      .toList();
}
