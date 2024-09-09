import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/home/product_item.dart';
import '../services/database_helper.dart';
import '../services/product_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favoriteIds = favoritesProvider.favoriteIds;

        return Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (productProvider.errorMessage != null) {

              return SliverToBoxAdapter(child: Center(child: Text('Error: ${productProvider.errorMessage}')));
            } else {

              final favoriteProducts = productProvider.getFavoriteProducts(favoriteIds);

              if (favoriteProducts.isEmpty) {
                return const Center(child: Text('No favorite products'));
              }

              return CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 350,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final product = favoriteProducts[index];
                        return ProductItem(products: [product]);
                      },
                      childCount: favoriteProducts.length,
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
