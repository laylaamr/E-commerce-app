import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/cart_helper.dart';
import 'package:untitled1/services/product_provider.dart';

import '../widgets/detail/app_bar.dart';
import '../widgets/home/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppBarWidget(
              title: 'Your cart',
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartsProvider, child) {
              final cartIds = cartsProvider.cartProductIds;
              return Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  if (productProvider.isLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (productProvider.errorMessage != null) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Error: ${productProvider.errorMessage}',
                        ),
                      ),
                    );
                  } else {
                    final cartProducts =
                    productProvider.getCartProducts(cartIds);

                    if (cartProducts.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text('No products in cart'),
                        ),
                      );
                    }

                    return CustomScrollView(
                      slivers: [
                        ProductItem(products: cartProducts)
                      ],
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

