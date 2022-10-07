import 'package:dexter/models/products_model.dart';

List<Product> productFilter(String query) {
  return Product.products.where((item) => item.name.contains(query)).toList();
}

List<Product> categoryFilter(String query) {
  if (query == "All") {
    return Product.products;
  } else {
    return Product.products
        .where((item) => item.getCategory().contains(query))
        .toList();
  }
}
