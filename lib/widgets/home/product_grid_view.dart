import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import 'product_item.dart'; // Import the new grid widget

class ProductGridView extends StatelessWidget {
  final Future<List<ProductModel>> productFuture;

  const ProductGridView({super.key, required this.productFuture});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: FutureBuilder<List<ProductModel>>(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ProductItem(products: snapshot.data!);
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Recipes is empty',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          } else {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}
