import 'package:dexter/models/products_model.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/screens/detail/detail.dart';
import 'package:dexter/screens/home/components/body.dart';
import 'package:dexter/screens/home/components/categories.dart';
import 'package:dexter/screens/home/components/product_card.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 32,
        ),

        // Top widgets
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Text(
              "Dexter",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Playfair',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              height: 48,
              width: 48,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(8.0)),
              child: // Search Button
                  IconButton(
                onPressed: (() {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                }),
                icon: const Icon(
                  Icons.search,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ],
        ),

        // Category tabs
        const Categories(),

        // Body of product cards
        Body()
      ]),
    );
  }
}

// Custom search delegate

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms =
      ProductProvider.instance.products.map((e) => e.name).toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (() {
            query = "";
          }),
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (() {
          close(context, null);
        }),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: GridView.builder(
            itemCount: matchQuery.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ProductCard(
                  product:
                      ProductProvider.instance.findByName(matchQuery[index])!,
                  onTapCallback: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: ProductProvider.instance
                              .findByName(matchQuery[index])!,
                        ),
                      )),
                )),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: GridView.builder(
            itemCount: matchQuery.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ProductCard(
                  product:
                      ProductProvider.instance.findByName(matchQuery[index])!,
                  onTapCallback: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: ProductProvider.instance
                              .findByName(matchQuery[index])!,
                        ),
                      )),
                )),
      ),
    );
  }
}
