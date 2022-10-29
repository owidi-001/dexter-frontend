import 'package:dexter/models/products_model.dart';
import 'package:dexter/screens/detail/detail.dart';
import 'package:dexter/screens/home/components/product_card.dart';
import 'package:dexter/screens/home/components/product_filter.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> products = categoryFilter("All");

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
                    )),
              )),
    );
  }
}
