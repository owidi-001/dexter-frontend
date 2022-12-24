class Product {
  int id;
  String name;
  double price;
  String? size;
  int quantity;
  int minQuantity;
  String image;
  String type;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.size,
      required this.quantity,
      required this.minQuantity,
      required this.image,
      required this.type});

  // factory from json
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        minQuantity: json["minQuantity"],
        image: json["image"],
        type: json["type"]);
  }

  // static toMap
  static Map<String, dynamic> toMap(Product product) {
    Map<String, dynamic> data = {
      "id": product.id,
      "name": product.name,
      "price": product.price,
      "quantity": product.quantity,
      "minQuantity": product.minQuantity,
      "image": product.image,
      "type": product.type
    };
    return data;
  }

  static List<Product> products = [
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/trauser.png",
      type: "Trousers",
    ),
    Product(
      id: 1,
      name: "Men Boots",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/boot.png",
      type: "Shoes",
    ),
    Product(
      id: 1,
      name: "Women Handbag",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/handbag.png",
      type: "Bags",
    ),
    Product(
      id: 1,
      name: "Long Sleeve",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/long_sleeve_tee.png",
      type: "Shirts",
    ),
    Product(
      id: 1,
      name: "Short Sleeve",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/short_sleeve_tee.png",
      type: "Shirts",
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      type: "Trousers",
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      type: "Trousers",
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      type: "Trousers",
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      type: "Trousers",
    ),
    Product(
      id: 1,
      name: "Men Khaki",
      price: 120,
      quantity: 30,
      minQuantity: 5,
      image: "assets/images/user.png",
      type: "Trousers",
    ),
  ];

// // Find product category by id
//   getCategory() {
//     return ProductCategory.productCategories
//         .where((element) => element.id == type)
//         .toList()[0]
//         .name;
//   }
}
