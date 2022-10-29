import 'package:dexter/providers/product_provider.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search items"),
        actions: [
          IconButton(
            onPressed: (() {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            }),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

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

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var results = matchQuery[index];
          return ListTile(
            title: Text(results),
          );
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var results = matchQuery[index];
          return ListTile(
            title: Text(results),
          );
        }));
  }
}
