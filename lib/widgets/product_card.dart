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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 400,
      ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '\$${productModel.price}',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                              int counter = cartProvider.getProductCounter(productModel.id);
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (counter > 1) {
                                        cartProvider.dec(productModel.id);
                                      } else {
                                        cartProvider.removeFromCart(productModel.id);
                                      }
                                    },
                                    icon: const Icon(Icons.remove, size: 20),
                                  ),
                                  Text(
                                    "$counter",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartProvider.inc(productModel.id);
                                    },
                                    icon: const Icon(Icons.add, size: 20),
                                  ),
                                ],
                              );
                            },
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

