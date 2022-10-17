import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/combo_box_widget.dart';
import 'package:dexter/widgets/form_field_decorator.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  String authAction = "Create New";

  // formkey
  final _formkey = GlobalKey<FormState>();

  // editing controllers

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _minQuantityController = TextEditingController();

  /// Minimum acceptable quantity
  final TextEditingController _quantityController = TextEditingController();

  /// Quantity added

  @override
  Widget build(BuildContext context) {
    // name field
    final nameField = TextFormField(
      autofocus: false,
      controller: _nameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        _nameController.value;
      },
      validator: ((value) {
        if (value!.isEmpty) {
          return "Name field cannot be empty";
        }
      }),
      textInputAction: TextInputAction.next,
      decoration: buildInputDecoration("Name", Icons.edit_note),
    );

    // price field
    final priceField = TextFormField(
      autofocus: false,
      controller: _priceController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onSaved: (value) {
        _priceController.value;
      },
      validator: ((value) {
        if (value!.isEmpty) {
          return "Just put approximate price!";
        }
      }),
      textInputAction: TextInputAction.next,
      decoration: buildInputDecoration("Price", Icons.price_change_rounded),
    );

    // min quantity field
    final minQuantityField = TextFormField(
      autofocus: false,
      controller: _minQuantityController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        _minQuantityController.value;
      },
      validator: ((value) {
        if (value!.isEmpty) {
          return "This helps us update you!";
        }
      }),
      textInputAction: TextInputAction.next,
      decoration: buildInputDecoration("Min Quantity", Icons.numbers_rounded),
    );

    // quantity field
    final quantityField = TextFormField(
      autofocus: false,
      controller: _quantityController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        _quantityController.value;
      },
      validator: ((value) {
        if (value!.isEmpty) {
          return "Quantity you're adding, 0 if none!";
        }
      }),
      textInputAction: TextInputAction.next,
      decoration: buildInputDecoration("Quantity", Icons.add),
    );

    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Create new",
                      style: TextStyle(
                          color: AppTheme.dark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              uploadButton(
                  "Upload Image", uploadImage, Icons.add_a_photo_rounded),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              nameField,
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              priceField,
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Min Quantity",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              minQuantityField,
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Quantity",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              quantityField,
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const ComboBox(),
              const SizedBox(
                height: 32,
              ),
              submitButton("Save", saveProduct),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void saveProduct() {
    final form = _formkey.currentState;

    if (form!.validate()) {
      form.save();

      ScaffoldMessenger.of(context)
          .showSnackBar(snackMessage(true, "Saving ..."));

      /// TODO! Form Processing

    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackMessage(false, 'Invalid form input!'));
    }
  }

  // Upload image handle
  void uploadImage() {
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Pick Image from",
                  style: TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: (() {}),
                      child: const CircleAvatar(
                          radius: 36,
                          backgroundColor: AppTheme.gradient,
                          child: Icon(Icons.photo,color: AppTheme.primary,)),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: const CircleAvatar(
                          radius: 36,
                          backgroundColor: AppTheme.gradient,
                          child: Icon(Icons.camera_alt_rounded,color: AppTheme.primary,)),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
