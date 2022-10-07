import 'package:dexter/models/products_model.dart';
import 'package:dexter/screens/detail/detail.dart';
import 'package:dexter/screens/home/components/categories.dart';
import 'package:dexter/screens/home/components/home_top_widget.dart';
import 'package:dexter/screens/home/components/product_card.dart';
import 'package:dexter/screens/home/components/product_filter.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<Product> products = categoryFilter("All");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 32,
        ),
        // Top widgets
        HomeTopWidget(),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            decoration: const BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: const TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Filter Products",
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppTheme.secondary,
                    fontWeight: FontWeight.w500),
                contentPadding: EdgeInsets.all(16),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ),
        ),

        // Category tabs
        const Categories(),

        Expanded(
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
        ),
      ],
    );
  }
}
