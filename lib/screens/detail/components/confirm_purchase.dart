import 'package:dexter/models/products_model.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
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
      child: Row(
        children: <Widget>[
          // Container(
          //   margin: const EdgeInsets.only(right: 16.0),
          //   height: 50,
          //   width: 58,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(18),
          //     border: Border.all(
          //       color: AppTheme.primary,
          //     ),
          //   ),
          //   child: InkWell(
          //     onTap: (() {
          //       // Deduct totals from database
          //     }),
          //     child: const Icon(Icons.shopping_bag),
          //   ),
          // ),
          Expanded(
              child: AppButtonWidget(
            title: "Confirm purchase",
            onPressedCallBack: () {},
          )),
        ],
      ),
    );
  }
}
