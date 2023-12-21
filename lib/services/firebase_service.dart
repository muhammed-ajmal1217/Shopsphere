import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/widgets/wishlist_class.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductModel> productsRef;
  

  DatabaseService() {
    productsRef = firestore.collection("products").withConverter<ProductModel>(
      fromFirestore: (snapshot, snapshotOptions) =>
          ProductModel.fromJson(snapshot.data()!),
      toFirestore: (data, setOptions) => data.toJson(),
    );
  }

  Stream<List<ProductModel>> getProducts() {
    return productsRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }



}
