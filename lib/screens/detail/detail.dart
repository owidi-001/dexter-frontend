import 'package:dexter/models/products_model.dart';
import 'package:dexter/screens/detail/components/body.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.primary,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_rounded),
      ),
      actions: <Widget>[
        InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.shopping_bag),
      ),
        const SizedBox(width: 8.0)
      ],
    );
  }
}
