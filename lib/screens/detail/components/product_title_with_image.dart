import 'package:dexter/models/products_model.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.getCategory(),
                  style: const TextStyle(color: AppTheme.white),
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppTheme.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(text: "Price Sh.\n"),
                    TextSpan(
                        text: "${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: AppTheme.white,
                                fontWeight: FontWeight.bold)),
                  ]),
                ),
                const SizedBox(width: 50.0),
                Expanded(
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
