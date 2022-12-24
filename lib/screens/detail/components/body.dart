import 'package:dexter/models/products_model.dart';
import 'package:dexter/screens/detail/components/confirm_purchase.dart';
import 'package:dexter/screens/detail/components/description.dart';
import 'package:dexter/screens/detail/components/product_title_with_image.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 16,
                    right: 16,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: AppTheme.gradient,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Description(product: product),
                      const SizedBox(
                        height: 16,
                      ),
                      // Inform user on the action to take
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Enter number of this item bought and press buy now button to confirm the purchase and update the quantity.",
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
