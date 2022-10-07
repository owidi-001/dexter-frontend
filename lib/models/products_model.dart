class ProductCategory {
  int id;
  String name; // Category name (Men,Women,Kids, Unisex)
  String type; // A set from which it belongs (Handbag, Trauser, dress etc)
  ProductCategory({required this.id, required this.name, required this.type});

  static List<ProductCategory> productCategories = [
    ProductCategory(id: 1, name: "Women", type: "Hand bag"),
    ProductCategory(id: 2, name: "Men", type: "Boots"),
    ProductCategory(id: 3, name: "Men", type: "Shirts"),
    ProductCategory(id: 4, name: "Unisex", type: "Shirts"),
    ProductCategory(id: 5, name: "Men", type: "Trauser"),
    ProductCategory(id: 6, name: "Kids", type: "Shoes"),
  ];
}

class Product {
  int id;
  String name;
  double price;
  String? size;
  int quantity;
  int minQuantity;
  String image;
  int categoryId;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.size,
      required this.quantity,
      required this.minQuantity,
      required this.image,
      required this.categoryId});

  static List<Product> products = [
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/trauser.png",
      categoryId: 5,
    ),
    Product(
      id: 1,
      name: "Men Boots",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/boot.png",
      categoryId: 2,
    ),
    Product(
      id: 1,
      name: "Women Handbag",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/handbag.png",
      categoryId: 1,
    ),
    Product(
      id: 1,
      name: "Long Sleeve",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/long_sleeve_tee.png",
      categoryId: 4,
    ),
    Product(
      id: 1,
      name: "Short Sleeve",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/short_sleeve_tee.png",
      categoryId: 4,
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      categoryId: 3,
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      categoryId: 3,
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      categoryId: 3,
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      categoryId: 3,
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      categoryId: 3,
    ),
  ];

// Find product category by id
  getCategory() {
    return ProductCategory.productCategories
        .where((element) => element.id == categoryId)
        .toList()[0]
        .name;
  }
}
