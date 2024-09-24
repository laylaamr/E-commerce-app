import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../services/cart_helper.dart';
class CartAppBarWidget extends StatelessWidget {
  CartAppBarWidget({super.key, required this.title});

String title;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
       Text(
         title,
          style: const TextStyle(
            fontSize: 20,

            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
       const Spacer(),
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
        }),
       const SizedBox(width: 10,),
      ],
    );
  }
}
