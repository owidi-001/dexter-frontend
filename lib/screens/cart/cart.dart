import 'package:dexter/models/cart_model.dart';
import 'package:dexter/providers/cart_provider.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
import 'package:dexter/widgets/cart_item_widget.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.primary,
          title: const Text(
            "Cart",
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
                  cartProvider.removeAll();
                }),
                child: const CircleAvatar(
                    backgroundColor: AppTheme.gradient,
                    child: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: AppTheme.primary,
                    ))),
            const SizedBox(
              width: 18,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Stagged",
                      style: TextStyle(
                          color: AppTheme.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "You have ${cartProvider.items.length} items in basket",
                      style: const TextStyle(
                          color: AppTheme.dark,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                color: AppTheme.secondary,
              ),
            ),
            // spacer
            const SliverPadding(padding: EdgeInsets.all(8.0)),
            // List view
            cartProvider.items.isEmpty
                ? //check if customer has any items in cart
                SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                              color: AppTheme.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                Text(
                                  "No items in cart!",
                                  style: TextStyle(
                                      color: AppTheme.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                : //Show order list

                SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(((
                        context,
                        index,
                      ) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: Column(
                            children: [
                              CartItemWidget(
                                item: cartProvider.items[index],
                              ),
                              const Divider(
                                color: AppTheme.secondary,
                              )
                            ],
                          ),
                        );
                      }), childCount: cartProvider.items.length),
                    ),
                  ),

            // spacer
            const SliverPadding(padding: EdgeInsets.all(8.0)),

            // Cart summary
            cartProvider.items.isNotEmpty
                ? SliverToBoxAdapter(
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                            color: AppTheme.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "Total:",
                                    style: TextStyle(
                                        color: AppTheme.primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Sh. ${(cartProvider.totalPrice).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: AppTheme.secondary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SliverToBoxAdapter(),

            // spacer
            const SliverPadding(padding: EdgeInsets.all(8.0)),

            // spacer
            const SliverPadding(padding: EdgeInsets.all(8.0)),

            cartProvider.items.isNotEmpty
                ?
                // Checkout button
                SliverToBoxAdapter(
                    child: AppButtonWidget(
                        title: "Confirm sales",
                        onPressedCallBack: () => {
                              if (cartProvider.items.isEmpty)
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackMessage(false, "Your cart is empty"))
                                }
                              else
                                {
                                  handleSales(cartProvider),
                                }
                            }),
                  )
                : const SliverToBoxAdapter(),

            const SliverToBoxAdapter(
              child: SizedBox(height: 48),
            ),
          ],
        ),
      ),
    );
  }

  // Save cart updates
  // payment handle
  Future<void> handleSales(cartProvider) async {
    Map<String, dynamic> data = {
      "items": cartProvider.items
          .map<Map<String, dynamic>>((json) => CartItemModel.toMap(json))
          .toList(),
    };

    var response = await AppService().saveOrder(data: data);

    response.when(error: (error) {
      if (kDebugMode) {
        print("AN error occured");
        print(error.message);
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(snackMessage(false, "Failed to save cart!"));
    }, success: (date) {
      if (kDebugMode) {
        print(data);
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(snackMessage(true, "Sales confirmed successfully"));

      // Clear cart
      cartProvider.resetCart();
    });
  }
}
