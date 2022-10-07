import 'package:dexter/models/products_model.dart';
import 'package:dexter/screens/detail/components/cart_counter.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: AppTheme.secondary),
                    children: [
                      const TextSpan(text: "Quantity\n"),
                      TextSpan(
                        text: "${product.quantity} items",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: AppTheme.secondary),
                    children: [
                      const TextSpan(text: "Size\n"),
                      TextSpan(
                        text: product.size ?? "Normal",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        CartCounter(),
      ],
    );
  }
}
