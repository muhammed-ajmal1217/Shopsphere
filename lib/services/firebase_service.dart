import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/product_model.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductModel> itemrefRef;

  DatabaseService() {
    itemrefRef = firestore.collection("userproducts").withConverter<ProductModel>(
      fromFirestore: (snapshot, snapshotOptions) => ProductModel.fromJson(snapshot.data()!),
      toFirestore: (data, setOptions) => data.toJson(),
    );
  }

  Future<void> addDonator(ProductModel data, String? uid) async {
    if (uid != null) {
      try {
        DocumentReference userDocRef = firestore.collection("users").doc(uid);
        CollectionReference<ProductModel> userProductsRef = userDocRef.collection("userproducts").withConverter<ProductModel>(
          fromFirestore: (snapshot, snapshotOptions) => ProductModel.fromJson(snapshot.data()!),
          toFirestore: (data, setOptions) => data.toJson(),
        );

        // Add data to the subcollection
        await userProductsRef.add(data);
      } catch (error) {
        print("Error adding donator: $error");
      }
    }
  }
}
