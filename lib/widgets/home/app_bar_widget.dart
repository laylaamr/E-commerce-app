import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/cart_screen.dart';
import 'package:untitled1/services/cart_helper.dart';

import '../../utils/constants.dart';

class MyCupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String deliveryAddress;
  final Widget? leading;
  final List<Widget>? actions;

  const MyCupertinoAppBar({
    super.key,
    required this.deliveryAddress,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              child: Image.asset("assets/onboarding_images/quickmart.png"),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "Delivery Address",
            //       style: TextStyle(
            //         fontSize: 10,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.grey,
            //       ),
            //     ),
            //     Text(
            //       deliveryAddress,
            //       style: const TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.black,
            //       ),
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //   ],
            // ),
            Row(
              children: [
                // IconButton(
                //   icon: const Icon(CupertinoIcons.cart,
                //       size: 28, color: Colors.black87),
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             CartScreen(),
                //       ),
                //     );
                //   },
                // ),
                IconButton(
                  icon: const Icon(CupertinoIcons.search,
                      size: 28, color: Colors.black87),
                  onPressed: () {},
                ),
                Consumer<CartProvider>(builder: (context, cartProvider, child) {
                  return Stack(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(CupertinoIcons.cart,
                            size: 28, color: Colors.black87),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ));
                        },
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '${cartProvider.totalItemCount}',
                              style: const TextStyle(
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
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
