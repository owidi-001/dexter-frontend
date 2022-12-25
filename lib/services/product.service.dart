import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductService {
  // initialize firestore instance
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Save this data to provider
  static read() async {
    try {
      var data =
          firestore.collection("products").get().then((value) => value.docs);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Create new product
  static void create(Map<String, dynamic> data) async {
    try {
      await firestore.collection('products').doc('testUser').set(data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Update existing product
  static void update(String id, Map<String, dynamic> data) async {
    try {
      firestore.collection('products').doc(id).update(data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Delete product
  static void delete(String id) async {
    try {
      firestore.collection('products').doc(id).delete();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
