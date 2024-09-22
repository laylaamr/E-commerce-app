import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/product_model.dart';

import '../services/favourite_helper.dart';
import '../widgets/detail/app_bar.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const DetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // Adjust for the button height
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               AppBarWidget(title: 'Details product',),
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Image.network(productModel.image),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width, // Full screen width
                    child: Text(
                      productModel.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price: ${productModel.price.toString()}\$",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                      Consumer<FavoritesProvider>(
                        builder: (context, favoritesProvider, child) {
                          bool isFavorite = favoritesProvider.isFavorite(productModel.id);

                          return IconButton(
                            onPressed: () {
                              favoritesProvider.toggleFavorite(productModel.id);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Description of product:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(productModel.description),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0, // Button stays at the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 90,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff67c3a6),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
