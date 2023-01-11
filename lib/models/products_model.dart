import 'package:flutter/foundation.dart';

class Product {
  int id;
  String name;
  double price;
  String? size;
  int quantity;
  int minQuantity;
  String image = "";
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

  // 'created_by': 1, 'created_on': '2022-12-26T11:27:08.450566Z'

  // factory from json
  factory Product.fromJson(Map<String, dynamic> json) {
    // print(json);

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
}

// class ProductImage {
//   int id;
//   int product;
//   String image;

//   ProductImage({required this.id, required this.product, required this.image});

//   // factory from json
//   factory ProductImage.fromJson(Map<String, dynamic> json) {
//     return ProductImage(
//         id: json["id"], product: json["product"], image: json["image"]);
//   }
// }
