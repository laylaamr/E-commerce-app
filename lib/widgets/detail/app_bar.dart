import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

          IconButton(
            icon: const Icon(CupertinoIcons.cart,
                size: 28, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
    ),

    );
  }
}
