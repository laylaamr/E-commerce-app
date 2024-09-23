import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/cart_helper.dart';
import 'package:untitled1/services/favourite_helper.dart';

import '../../models/product_model.dart';
import '../../screens/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final List<ProductModel> products;

  const ProductCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final productModel = products[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(productModel: productModel),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        productModel.image,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Flexible(
                            child: Text(
                              productModel.title,
                              style: const TextStyle(
                                fontSize: 20,

                                color: Colors.black,
                              ),
                              softWrap: true,
                            ),
                          ),
      const SizedBox(height: 10,),
                          Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                              int counter = cartProvider.getProductCounter(productModel.id);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${productModel.price}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,

                                    ),
                                  ),
                                 const SizedBox(width: 30,),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          if (counter > 1) {
                                            cartProvider.dec(productModel.id);
                                          }
                                        },
                                        icon: const Icon(Icons.remove, size:20,color: Colors.grey,),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "$counter",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child:   IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          cartProvider.inc(productModel.id);
                                        },
                                        icon: const Icon(Icons.add, size: 20, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child:   IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          cartProvider.removeFromCart(productModel.id);
                                        },
                                        icon: const Icon(Icons.delete_outline_outlined, size: 20,color: Colors.grey ),
                                      ),
                                    ),
                                  ),


                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


// Consumer<FavoritesProvider>(
// builder: (context, favoritesProvider, child) {
// bool isFavorite = favoritesProvider.isFavorite(productModel.id);
// return IconButton(
// onPressed: () {
// favoritesProvider.toggleFavorite(productModel.id);
// },
// icon: Icon(
// Icons.favorite,
// color: isFavorite ? Colors.red : Colors.grey,
// ),
// );
// },
// ),