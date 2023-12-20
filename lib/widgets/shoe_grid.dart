import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/services/firebase_service.dart';
import 'package:myapp/widgets/shimmer.dart';

class ShoeItems extends StatelessWidget {
  const ShoeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
            stream: DatabaseService().getProducts(),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverFillRemaining(
                  child: ShimmerLoader(),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return SliverFillRemaining(
                  child: Text(
                    snapshot.error.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else if (snapshot.data == null) {
                return SliverFillRemaining(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      ProductModel product = data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(3, 4),
                                      blurRadius: 2.5,
                                      color: Colors.black.withOpacity(0.2)),
                                ],
                                color: Color.fromARGB(255, 29, 35, 46),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(product.image!,
                                        scale: 7))),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Text(
                                      product.category!,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white, fontSize: 10),
                                    )),
                                Positioned(
                                    right: 10,
                                    top: 10,
                                    child: InkWell(
                                      onTap: () {
                                      },
                                      child: Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.white.withOpacity(0.4),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title ?? 'No title',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '${product.price}',
                                        style: GoogleFonts.montserrat(
                                            color: Color.fromARGB(
                                                255, 38, 184, 43),
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 10,
                                    bottom: 10,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 13,
                                            color: Colors.white,
                                          )),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: data!.length,
                  ),
                );
              }
            },
          );
  }
}