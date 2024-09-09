import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/product_provider.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider()..fetchProduct(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shopify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
