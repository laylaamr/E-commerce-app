import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  deliveryAddress,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.cart,
                      size: 28, color: Colors.black87),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.bell,
                      size: 28, color: Colors.black87),
                  onPressed: () {},
                ),
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
