import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/cart_screen.dart';
import '../../services/cart_helper.dart';
class AppBarWidget extends StatelessWidget {
   AppBarWidget({super.key, required this.title});
String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 28, color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
         Text(
           title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

          Consumer<CartProvider>( builder: (context, cartProvider, child){

            return Stack(
              children: <Widget>[
                IconButton(
                  icon: const Icon( CupertinoIcons.cart,
                      size: 28, color: Colors.black87), onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),)
                  );
                },
                ),
                Positioned(
                  right: 1,
                  top:1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width:20,
                    height:20,
                    decoration: BoxDecoration(

                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Center(
                      child: Text(
                        '${cartProvider.totalItemCount}',
                        style:const  TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    ),

    );
  }
}
