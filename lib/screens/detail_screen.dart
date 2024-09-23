import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/product_model.dart';

import '../services/cart_helper.dart';
import '../services/favourite_helper.dart';
import '../widgets/detail/app_bar.dart';
import 'package:rate/rate.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const DetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      productModel.title,
                      style: const TextStyle(
                        fontSize: 20,

                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Rate(
                        iconSize: 30,
                        color: Color(0xFFFFAD33),
                        allowHalf: true,
                        allowClear: true,
                        initialValue: productModel.rating,
                        readOnly: false,
                        // onChange: (value) => print(value),
                      ),
                      SizedBox(width: 20,),
                      Text("(${productModel.ratingCount} Reviewer)",style: TextStyle(fontSize: 16,color: Colors.grey),)
                    ],
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
                              Icons.favorite,size: 30,
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
                    "Description of product",
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.w600,
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
                child: Consumer<CartProvider>(
                    builder: (context,cartProvider,child){
                      return ElevatedButton(
                        onPressed: () {
                          cartProvider.addToCart(productModel.id);
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
                      );
                    }
                ),
              ),
            ),
          )],
      ),
    );
  }
}
