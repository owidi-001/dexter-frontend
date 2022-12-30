import 'package:dexter/models/products_model.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/screens/detail/detail.dart';
import 'package:dexter/screens/home/components/body.dart';
import 'package:dexter/screens/home/components/category_filter.dart';
import 'package:dexter/screens/home/components/product_card.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Product> allProducts = [];

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> categories = ["All"];
  static int selectedIndex = 0;

  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductProvider>(context);
    allProducts = productsProvider.products;

    products = categoryFilter(allProducts, categories[selectedIndex]);

    for (var element in productsProvider.buildCategories()) {
      if (!categories.contains(element)) {
        categories.add(element);
      }
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.primary,
          title: const Text(
            "Dexter",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Playfair',
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            InkWell(
                onTap: (() {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                }),
                child: const CircleAvatar(
                    backgroundColor: AppTheme.gradient,
                    child: Icon(
                      CupertinoIcons.search_circle_fill,
                      color: AppTheme.primary,
                    ))),
            const SizedBox(
              width: 18,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),

          // Category tabs
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() {
                      setState(() {
                        selectedIndex = index; // Update selected index
                        products = categoryFilter(
                            allProducts, categories[selectedIndex]);
                      });
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Body of product cards
          Body(
            products: products,
          ),
          const SizedBox(
            height: 48,
          ),
        ]),
      ),
    );
  }
}

// Custom search delegate

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = allProducts.map((e) => e.name).toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (() {
            query = "";
          }),
          icon: const Icon(Icons.clear)),
      const SizedBox(
        width: 16.0,
      ),
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
            product: allProducts
                .firstWhere((element) => element.name == matchQuery[index]),
            onTapCallback: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  product: allProducts.firstWhere(
                      (element) => element.name == matchQuery[index]),
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
            product: allProducts
                .firstWhere((element) => element.name == matchQuery[index]),
            onTapCallback: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  product: allProducts.firstWhere(
                      (element) => element.name == matchQuery[index]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
