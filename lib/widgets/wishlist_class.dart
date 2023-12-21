import 'package:flutter/foundation.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/services/firebase_service.dart';

class Wishlist extends ChangeNotifier {
  List<ProductModel> wishlistItems = [];
  DatabaseService service = DatabaseService();



  Future<List<ProductModel>> getWishlistItems(String uid) async {
    try {
      var wishlistSnapshot = await service.firestore
          .collection("users")
          .doc(uid)
          .collection("wishlist")
          .get();
      wishlistItems = wishlistSnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      return wishlistItems;
    } catch (e) {
      print('Error fetching wishlist items: $e');
      throw e;
    }
  }
  Future<void> addProductToWishlist(ProductModel data, String uid) async {
    try {
      if (!wishlistItems.contains(data)) {
        await service.firestore
            .collection("users")
            .doc(uid)
            .collection("wishlist")
            .add(data.toJson());
        wishlistItems.add(data);
        notifyListeners();
      }
    } catch (error) {
      print("Error adding product to wishlist: $error");
    }
  }

  Future<void> removeProductFromWishlist(ProductModel product, String uid) async {
    try {
      wishlistItems.remove(product);
      notifyListeners();
      await service.firestore
          .collection("users")
          .doc(uid)
          .collection("wishlist")
          .doc(product.id.toString())
          .delete();
      notifyListeners();
    } catch (error) {
      print("Error removing product from wishlist: $error");
      // wishlistItems.add(product);
      notifyListeners();
    }
  }
    bool isWishlistItem(ProductModel product) {
    return wishlistItems.contains(product);
  }
}
