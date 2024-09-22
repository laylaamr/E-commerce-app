import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/cart_helper.dart';
import 'package:untitled1/services/product_provider.dart';
import 'package:untitled1/widgets/product_card.dart';
import '../widgets/detail/cart_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CartAppBarWidget(),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                    top: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery to',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Salatiga City, Central Java',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              color: Colors.white,
              child: Column(

                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     //   SizedBox(width: 20,),
                        const Text(
                          'Total: ',
                          style: TextStyle(fontSize: 20, ),
                        ),
                        Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                        return Text("\$ ${cartProvider.totalPrice(context).toStringAsFixed(2)}",style: TextStyle(fontSize: 20),);}),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the button
                      },
                      style: ElevatedButton.styleFrom(

                        backgroundColor: const Color(0xffb1bebc),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Proceed to Checkout',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



