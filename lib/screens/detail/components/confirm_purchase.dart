import 'package:dexter/models/products_model.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Expanded(
          child: AppButtonWidget(
        title: "Confirm purchase",
        onPressedCallBack: () {
          if (kDebugMode) {
            print("Button clicked");
          }
          ScaffoldMessenger.of(context).showSnackBar(
              snackMessage(true, "${product.name} quantity updated"));
        },
      )),
    );
  }
}
