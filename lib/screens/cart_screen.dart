import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/cart_helper.dart';
import 'package:untitled1/services/product_provider.dart';
import 'package:untitled1/widgets/product_card.dart';

import '../widgets/detail/app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            title: 'Your cart',
          ),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartsProvider, child) {
                final cartIds = cartsProvider.cartProductIds;
                return Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    if (productProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (productProvider.errorMessage != null) {
                      return Center(
                        child: Text(
                          'Error: ${productProvider.errorMessage}',
                        ),
                      );
                    } else {
                      final cartProducts =
                      productProvider.getCartProducts(cartIds);

                      if (cartProducts.isEmpty) {
                        return const Center(
                          child: Text('No products in cart'),
                        );
                      }
                      return ProductCard(products: cartProducts);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


