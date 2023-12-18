import 'package:flutter/material.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/widgets/wishlist_class.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  final ProductModel? product;

  WishListPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final pro =  Provider.of<Wishlist>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: pro.wishlistItems.length, // Ensure product is not null
        itemBuilder: (context, index) {
          final data = pro.wishlistItems[index];
          return ListTile(
            title: Text(data.title ?? 'No Title',style: TextStyle(color: Colors.amber),), // Use null-aware operators
          );
        },
      ),
    );
  }
}
