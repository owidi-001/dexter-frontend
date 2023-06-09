import 'package:dexter/models/products_model.dart';
import 'package:dexter/screens/detail/detail.dart';
import 'package:dexter/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Product> products;

  const Body({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onTapCallback: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                product: products[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
