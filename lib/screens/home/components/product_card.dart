import 'package:dexter/models/products_model.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/utils/constants.dart';
import 'package:dexter/widgets/image_shimmer.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTapCallback;
  const ProductCard(
      {Key? key, required this.product, required this.onTapCallback})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          product.image.toString().isNotEmpty
              ? Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: AppTheme.light,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Hero(
                        tag: "${product.id}",
                        child: Image.network(
                          "$baseUrl${product.image}",
                        )),
                  ),
                )
              : Expanded(
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: AppTheme.light,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const ImagePlaceholder(),
                  ),
                ),
          const SizedBox(
            height: 8.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16.0 / 4),
                child: Text(
                  product.name,
                  style: const TextStyle(color: AppTheme.secondary),
                ),
              ),
              Text(
                "Sh. ${product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppTheme.secondary),
              )
            ],
          ),
        ],
      ),
    );
  }
}
