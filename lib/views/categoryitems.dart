import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/controller/category_provider.dart';
import 'package:myapp/controller/wishlist_provider.dart.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/widgets/shimmer_grid.dart';
import 'package:provider/provider.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key,});

  @override
  Widget build(BuildContext context) {
    final catPro= Provider.of<CategoryProvider>(context);
    final wishlistpro= Provider.of<Wishlist>(context);
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 24, 30, 41),
        title: Text('Your Store',style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: catPro.getCategoryItems(type: 'creams',typeofcategory: 'creamcategory'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerLoader();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.white),
            );
          } else if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                  itemCount: catPro.items.length,
                  itemBuilder: (context, index) {
                    final data = catPro.items[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 27, 35, 50),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 37, 46, 61),
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(data.image!)),
                                    ),
                                  ),
                                  spacingWidth(10),
                                  SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title!,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          data.category!,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${data.price!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${data.rating!}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
          }
        },
      ),
    );
  }
}
