import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../services/cart_helper.dart';
class CartAppBarWidget extends StatelessWidget {
  CartAppBarWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(

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
         const SizedBox(width: 10,),
         const Text(
           "Your Cart",
            style:  TextStyle(
              fontSize: 20,

              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 180,),
          Consumer<CartProvider>( builder: (context, cartProvider, child){

            return Stack(
              children: <Widget>[
                IconButton(
                  icon: const Icon( CupertinoIcons.cart,
                      size: 28, color: Colors.black87), onPressed: () {

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

                      color: Colors.red,
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
