import 'package:dexter/models/products_model.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/screens/detail/detail.dart';
import 'package:dexter/screens/home/components/body.dart';
import 'package:dexter/screens/home/components/categories.dart';
import 'package:dexter/screens/home/components/product_card.dart';
import 'package:dexter/screens/home/components/product_filter.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = categoryFilter("All");

  static List<String> categories = [
    "All",
    "Boots",
    "Bags",
    "Socks",
    "Dresses",
    "Cardigans"
  ];
  static int selectedIndex = 0;

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          products = categoryFilter(categories[selectedIndex]);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index
                    ? AppTheme.primary
                    : AppTheme.secondary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0 / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => buildCategory(index),
            ),
          ),
        ),

        // Body of product cards
        Body(
          products: products,
        )
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
            product: ProductProvider.instance.findByName(matchQuery[index])!,
            onTapCallback: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  product:
                      ProductProvider.instance.findByName(matchQuery[index])!,
                ),
              ),
            ),
          ),
        ),
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
            product: ProductProvider.instance.findByName(matchQuery[index])!,
            onTapCallback: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  product:
                      ProductProvider.instance.findByName(matchQuery[index])!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
