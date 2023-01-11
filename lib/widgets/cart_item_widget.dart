import 'dart:convert';

import 'package:dexter/models/cart_model.dart';
import 'package:dexter/providers/cart_provider.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/utils/constants.dart';
import 'package:dexter/widgets/build_counter_widget.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                alignment: Alignment.center,
                child: item.product.image.toString().isNotEmpty
                    ?
                    // Image.memory(
                    //     const Base64Decoder().convert(item.product.image),
                    //     fit: BoxFit.fill,
                    //   )
                    Image.network(
                        "$baseUrl${item.product.image}",
                        fit: BoxFit.fill,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: AppTheme.secondary,
                            borderRadius: BorderRadius.circular(12)),
                      ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(
                      color: AppTheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    buildOutlineButton(
                      icon: Icons.remove,
                      press: () {
                        cartProvider.updateCart(item, item.quantity - 1);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        // if our item is less  then 10 then  it shows 01 02 like that
                        item.quantity.toString().padLeft(2, "0"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    buildOutlineButton(
                        icon: Icons.add,
                        press: () {
                          if (item.quantity < item.product.quantity) {
                            cartProvider.updateCart(item, item.quantity + 1);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackMessage(true,
                                    "Maximum available quantity reached!"));
                          }
                        }),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text("Sh. ${item.product.price}",
                    style: const TextStyle(
                        color: AppTheme.dark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
