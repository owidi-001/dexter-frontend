import 'dart:convert';

import 'package:dexter/models/cart_model.dart';
import 'package:dexter/models/products_model.dart';
import 'package:dexter/providers/cart_provider.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
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
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
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
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
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
                                            text:
                                                "${widget.product.quantity} items",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                          const TextSpan(
                                              text: "Min Quantity\n"),
                                          TextSpan(
                                            text:
                                                "${widget.product.minQuantity} items",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    // if our item is less  then 10 then  it shows 01 02 like that
                                    numOfItems.toString().padLeft(2, "0"),
                                    style:
                                        Theme.of(context).textTheme.headline6,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Expanded(
                              child: AppButtonWidget(
                            title: "Add to cart",
                            onPressedCallBack: () {
                              // check if item in cart
                              cartProvider.add(
                                CartItemModel(
                                    product: widget.product,
                                    quantity: numOfItems),
                              );

                              // add item confirmation
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackMessage(true,
                                      "${widget.product.name} added to cart"));

                              Navigator.pop(context);
                            },
                          )),
                        )
                      ],
                    ),
                  ),
                  Padding(
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
                                widget.product.type,
                                style: const TextStyle(color: AppTheme.white),
                              ),
                              Text(
                                widget.product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: AppTheme.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(text: "Price sh.\n"),
                                  TextSpan(
                                      text: "${widget.product.price}",
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
                                child: widget.product.image
                                        .toString()
                                        .isNotEmpty
                                    ? Hero(
                                        tag: "",
                                        child: Image.memory(
                                          const Base64Decoder()
                                              .convert(widget.product.image),
                                          height: 280,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: AppTheme.secondary,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child:
                                            const CircularProgressIndicator()),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.secondary,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_rounded),
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
