import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/widgets/detail/cart_appbar.dart';
import 'package:untitled1/widgets/detail/profile_container.dart';

import '../services/cart_helper.dart';
import '../widgets/auth/custom_textField.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartAppBarWidget(title: "Payment method"),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select existing card",
                    style: TextStyle(fontSize: 16),
                  ),
                  ProfileContainer(
                      name: "***************345", frontIcon: Icons.credit_card),
                  const Text(
                    "Or input another card",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Card number",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter card number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Exp date",style: TextStyle(color: Colors.grey, fontSize: 16)),
                           const SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'mm/yy',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                   const SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Security code",style: TextStyle(color: Colors.grey, fontSize: 16)),
                           const SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'ccv/csv',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const  Text('Card holder',  style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter card holder name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
             const SizedBox(height:85,),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  Row(
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
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) => PaymentScreen(),)
                        // );
                      },
                      style: ElevatedButton.styleFrom(

                        backgroundColor: const Color(0xff67C4A7),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Confirm your order ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
