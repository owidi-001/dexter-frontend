import 'dart:convert';

import 'package:dexter/models/cart_model.dart';
import 'package:dexter/models/products_model.dart';
import 'package:dexter/providers/cart_provider.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/utils/constants.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
import 'package:dexter/widgets/image_shimmer.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.secondary,
      appBar: AppBar(
          elevation: 0, backgroundColor: AppTheme.secondary, actions: []),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: AppTheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: widget.product.image.toString().isNotEmpty
                  ? Hero(
                      tag: "",
                      child: Image.network(
                        "$baseUrl${widget.product.image}",
                        height: 280,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: AppTheme.secondary,
                          borderRadius: BorderRadius.circular(12)),
                      child: const ImagePlaceholder()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: 16,
                right: 16,
              ),
              decoration: const BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            color: AppTheme.dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "KES ",
                            style: TextStyle(
                                color: AppTheme.secondary,
                                fontWeight: FontWeight.w100,
                                fontSize: 24),
                          ),
                          Text(
                            "${widget.product.price}",
                            style: const TextStyle(
                                color: AppTheme.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 1,
                        width: 40,
                        decoration: BoxDecoration(
                            color: AppTheme.secondary,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),

                  // User action description
                  Row(
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
                                  style: const TextStyle(
                                      color: AppTheme.secondary),
                                  children: [
                                    const TextSpan(
                                        text: "Quantity Available\n"),
                                    TextSpan(
                                      text: "${widget.product.quantity} items",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: AppTheme.secondary),
                                  children: [
                                    const TextSpan(text: "Min Quantity\n"),
                                    TextSpan(
                                      text:
                                          "${widget.product.minQuantity} items",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Increment or decrement # of items in cart
                      Row(
                        children: <Widget>[
                          buildOutlineButton(
                            icon: Icons.remove,
                            press: () {
                              if (numOfItems > 1) {
                                setState(() {
                                  numOfItems--;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              // if our item is less  then 10 then  it shows 01 02 like that
                              numOfItems.toString().padLeft(2, "0"),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          buildOutlineButton(
                              icon: Icons.add,
                              press: () {
                                setState(() {
                                  numOfItems++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Inform user on the action to take
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "You can adjust the quantity by the \t '+' \t or \t '-' \t buttons then proceed to add to cart.",
                      style: TextStyle(height: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Add to cart button
                  AppButtonWidget(
                    title: "Add to cart",
                    onPressedCallBack: () {
                      // check if item in cart
                      cartProvider.add(
                        CartItemModel(
                            product: widget.product, quantity: numOfItems),
                      );

                      // add item confirmation
                      ScaffoldMessenger.of(context).showSnackBar(snackMessage(
                          true, "${widget.product.name} added to cart"));

                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required Function() press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: AppTheme.secondary,
        ),
      ),
    );
  }
}
