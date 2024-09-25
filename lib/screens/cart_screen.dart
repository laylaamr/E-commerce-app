import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/product_provider.dart';
import 'package:untitled1/screens/payment_screen.dart';
import 'package:untitled1/services/cart_helper.dart';
import 'package:untitled1/widgets/product_card.dart';

import '../widgets/auth/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // CartAppBarWidget(
              //   title: "Your cart",
              // ),
              // const SizedBox(height: 10),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: Colors.grey.shade300,
              //         width: 1.0,
              //       ),
              //       top: BorderSide(
              //         color: Colors.grey.shade300,
              //         width: 1.0,
              //       ),
              //     ),
              //   ),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Delivery to',
              //         style: TextStyle(fontSize: 16.0),
              //       ),
              //       Text(
              //         'Salatiga City, Central Java',
              //         style: TextStyle(fontSize: 16.0),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<CartProvider>(
                  builder: (context, cartsProvider, child) {
                    final cartIds = cartsProvider.cartProductIds;
                    return Consumer<ProductProvider>(
                      builder: (context, productProvider, child) {
                        if (productProvider.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
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
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //   SizedBox(width: 20,),
                        const Text(
                          'Total: ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                          return Text(
                            "\$ ${cartProvider.totalPrice(context).toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 20),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ));
                      },
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      label: 'Proceed to Checkout',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
