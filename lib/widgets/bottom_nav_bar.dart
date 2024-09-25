import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../services/cart_helper.dart';
import '../utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SalomonBottomBar(
          curve: Curves.bounceOut,
          currentIndex: selectedIndex,
          onTap: onTabTapped,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text("Home"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.heart),
              title: const Text("Likes"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      const Icon(
                        CupertinoIcons.cart,
                        size: 28,
                        color: Colors.black87,
                      ),
                      if (cartProvider.totalItemCount > 0)
                        Positioned(
                          right: -5,
                          top: -5,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${cartProvider.totalItemCount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              title: const Text("Cart"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.person),
              title: const Text("Profile"),
              selectedColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
