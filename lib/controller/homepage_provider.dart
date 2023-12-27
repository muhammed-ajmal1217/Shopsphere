import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/model/category_model.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/services/firebase_service.dart';


class HomeProvider extends ChangeNotifier{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<CategoryModel> productsRef;
  DatabaseService service =DatabaseService();
  DatabaseService1 service1 =DatabaseService1();
  DatabaseService2 service2 =DatabaseService2();

    Stream<List<ProductModel>> getProducts() {
    return service.productsRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
    Stream<List<ProductModel>> getFurniture() {
    return service1.furniteref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
    Stream<List<CategoryModel>> getCategory() {
    return service2.catref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
}