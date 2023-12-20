import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/product_model.dart';

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

// Future<void> addProductToWishlist(ProductModel data, String uid) async {
//   try {
//     await firestore
//         .collection("users")
//         .doc(uid)
//         .collection("wishlist")
//         .add(data.toJson()); 
//   } catch (error) {
//     print("Error adding product to wishlist: $error");
//   }
// }
}
