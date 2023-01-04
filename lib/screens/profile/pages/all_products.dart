import 'dart:convert';
import 'dart:io';

import 'package:dexter/models/products_model.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/appButtonWidget.dart';
import 'package:dexter/widgets/form_field_decorator.dart';
import 'package:dexter/widgets/image_shimmer.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<Product> _products = [];

  // Form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _minQuantityController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  // It will also be triggered when you want to update an item or create on
  void _showForm(int? id) async {
    // id == null -> create new item
    // id != null -> update an existing item
    if (id != null) {
      final existingProducts =
          _products.firstWhere((element) => element.id == id);

      _nameController.text = existingProducts.name;
      _priceController.text = "${existingProducts.price}";
      _quantityController.text = "${existingProducts.quantity}";
      _minQuantityController.text = "${existingProducts.minQuantity}";
      _typeController.text = existingProducts.type;
    } else {
      // Clear the text fields
      _nameController.text = '';
      _priceController.text = '';
      _quantityController.text = '';
      _minQuantityController.text = '';
      _typeController.text = '';
    }

    // show modalsheet
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          // this will prevent the soft keyboard from covering the text fields
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _nameController,
                decoration: buildInputDecoration("Name", Icons.edit),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                controller: _priceController,
                decoration: buildInputDecoration("Price", Icons.money),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _quantityController,
                textInputAction: TextInputAction.next,
                decoration: buildInputDecoration("Quantity", Icons.numbers),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: _minQuantityController,
                decoration: buildInputDecoration("minQuantity", Icons.numbers),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _typeController,
                textInputAction: TextInputAction.done,
                decoration: buildInputDecoration("Type", Icons.type_specimen),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Image from",
                            style: TextStyle(
                                color: AppTheme.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton.icon(
                          onPressed: () async {
                            // Pick an image
                            image = await _picker.pickImage(
                                source: ImageSource.camera,
                                // Compress image upload
                                maxHeight: 1024,
                                maxWidth: 1024,
                                imageQuality: 50);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.photo,
                            color: AppTheme.secondary,
                          ),
                          label: const Text(
                            "Camera",
                            style: TextStyle(color: AppTheme.secondary),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.photo,
                            color: AppTheme.secondary,
                          ),
                          label: const Text(
                            "Gallery",
                            style: TextStyle(color: AppTheme.secondary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppTheme.secondary,
                child: MaterialButton(
                  onPressed: () async {
                    // Save new journal
                    if (id == null) {
                      await _addProduct();
                    } else {
                      await _updateMenu(id);
                    }

                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  },
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: double.infinity,
                  child: Text(
                    id == null ? 'Create New' : 'Update',
                    style: const TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              id == null
                  ? Container()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        AppButtonWidget(
                          title: "Delete",
                          onPressedCallBack: () async {
                            _deleteItem(id);
                          },
                          background: AppTheme.danger,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Insert a new product to the database
  Future<void> _addProduct() async {
    if (image != null) {
      // convert image to base64
      String imageData = "";

      File imagefile = File(image!.path); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      imageData = base64.encode(imagebytes); //convert bytes to base64 string

      // if (kDebugMode) {
      //   print("The picked image is");
      //   print(imageData);
      // }

      // Create function
      Map<String, dynamic> data = {
        'name': _nameController.text,
        'price': _priceController.text,
        'quantity': _quantityController.text,
        'minQuantity': _minQuantityController.text,
        'type': _typeController.text,
        'image': imageData
      };

      // if (kDebugMode) {
      //   print("pre post");
      //   print(data);
      // }

      var response = await AppService().productCreate(data: data);

      response.when(error: (error) {
        // if (kDebugMode) {
        //   print("An error occured");
        //   print(error.message);
        // }

        ScaffoldMessenger.of(context).showSnackBar(snackMessage(
            false, 'An error occurred when creating the product!'));
      }, success: (data) {
        // if (kDebugMode) {
        //   print("It was successful");
        //   print(data);
        // }
        ScaffoldMessenger.of(context)
            .showSnackBar(snackMessage(true, 'Product created successfully!'));

        Provider.of<ProductProvider>(context, listen: false).refresh();
        Navigator.pop(context);
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackMessage(false, 'No image selected!'));
    }
  }

  // Update an existing journal
  Future<void> _updateMenu(int id) async {
    // convert image to base64
    String imageData = "empty";

    if (image != null) {
      File imagefile = File(image!.path); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      imageData = base64.encode(imagebytes); //convert bytes to base64 string

      // if (kDebugMode) {
      //   print("The picked image is");
      //   print(imageData);
      // }
    }

    // Update function
    Map<String, dynamic> data = {
      'product': id,
      'name': _nameController.text,
      'price': _priceController.text,
      'quantity': _quantityController.text,
      'minQuantity': _minQuantityController.text,
      'type': _typeController.text,
      'image': imageData
    };

    var response = await AppService().productUpdate(data: data);

    response.when(error: (error) {
      // if (kDebugMode) {
      //   print("An error occured");
      //   print(error.message);
      // }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred when updating product!'),
      ));
    }, success: (data) {
      // if (kDebugMode) {
      //   print("It was successful");
      //   print(data);
      // }
      ScaffoldMessenger.of(context).showSnackBar(
          snackMessage(false, '${data.name} updated successfully!'));

      Provider.of<ProductProvider>(context, listen: false).refresh();
      Navigator.pop(context);
    });
  }

  // Delete an item
  void _deleteItem(int id) async {
    // Call service to delete item with the specified id
    var response = await AppService().productDelete(data: {"product": id});

    response.when(error: (error) {
      // if (kDebugMode) {
      //   print("An error occured");
      //   print(error.message);
      // }
      ScaffoldMessenger.of(context).showSnackBar(
          snackMessage(false, 'An error occurred when deleting product!'));
    }, success: (data) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${data.name} deleted successfully!'),
      ));
      Provider.of<ProductProvider>(context, listen: false).refresh();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // All products
    _products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.secondary,
          title: const Text(
            "All Products",
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
                  _showForm(null);
                }),
                child: const CircleAvatar(
                    backgroundColor: AppTheme.light,
                    child: Icon(
                      CupertinoIcons.add_circled_solid,
                      color: AppTheme.secondary,
                    ))),
            const SizedBox(
              width: 18,
            )
          ]),
      body: SingleChildScrollView(
        child: _products.isNotEmpty
            ? MasonryView(
                listOfItem: _products,
                numberOfColumn: 2,
                itemBuilder: (item) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: AppTheme.light,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        _showForm(item.id);
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: item.image.toString().isNotEmpty
                                ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.memory(
                                      const Base64Decoder().convert(item.image),
                                    ),
                                )
                                : const ImagePlaceholder(),
                          ),
                          Padding(  
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            child: Text(
                              item.name,
                              style: const TextStyle(color: AppTheme.secondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text("You don't have any item saved"),
                    TextButton(
                        onPressed: (() => _showForm(null)),
                        child: const Text(
                          "Add product",
                          style: TextStyle(color: AppTheme.secondary),
                        ))
                  ],
                ),
              ),
      ),
    );
  }
}
