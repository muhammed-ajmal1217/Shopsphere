import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/services/apiservices.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/services/firebase_service.dart';
import 'package:myapp/views/wishlist.dart';
import 'package:myapp/widgets/wishlist_class.dart';

void toggleWishlistItem(ProductModel product) {
  Wishlist wishlist = Wishlist();
  if (wishlist.isWishlistItem(product)) {
    wishlist.removeFromWishlist(product);
  } else {
    wishlist.addToWishlist(product);
  }
}


class HomePage extends StatelessWidget {
  AuthService auth=AuthService();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
                  onTap: () {
                    AuthService().signOutFromGoogle();
                  },
                  child: Icon(Icons.logout),
                ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacingHeight(20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Hello..${auth.auth.currentUser!.email}', // Adjust the greeting as needed
                style:
                    GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
              ),
            ),
            spacingHeight(20),
            Container(
              height: height * 0.3,
              width: width,
              child: CarouselSlider(
                items: [
                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 54, 54, 54),
                    ),
                    child: Center(
                      child: Text('Slide 1'),
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 54, 54, 54),
                    ),
                    child: Center(
                      child: Text('Slide 2'),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: height * 0.5,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            spacingHeight(30),
            
          ],
        ),
      ),
    );
  }
}


