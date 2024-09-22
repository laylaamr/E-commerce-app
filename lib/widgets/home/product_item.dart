import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/cart_helper.dart';

import '../../models/product_model.dart';
import '../../screens/detail_screen.dart';
import '../../services/favourite_helper.dart';

class ProductItem extends StatelessWidget {
  final List<ProductModel> products;


  const ProductItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 400,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final productModel = products[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(productModel: productModel),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child:
                          Text(
                            productModel.title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                          ),),
                        const SizedBox(height: 4),
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
                            SizedBox(
                              width:100,
                             height: 40,
                             // clipBehavior: ,
                              child:Consumer<CartProvider>(
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
                                      child:  Text(
                                        'Add to cart',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ),

                            Consumer<FavoritesProvider>(
                              builder: (context, favoritesProvider, child) {
                                bool isFavorite = favoritesProvider
                                    .isFavorite(productModel.id);

                                return IconButton(
                                  onPressed: () {
                                    favoritesProvider
                                        .toggleFavorite(productModel.id);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: isFavorite
                                        ? Colors.red
                                        : Colors.grey,
                                   // size: 25,
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
        childCount: products.length,
      ),
    );
  }
}
