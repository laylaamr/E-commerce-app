import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/product_provider.dart';
import 'package:untitled1/services/cart_helper.dart';
import 'package:untitled1/services/favourite_helper.dart';

import 'screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final favoritesProvider = FavoritesProvider();
  await favoritesProvider.initFavorites();
  final cartsProvider = CartProvider();
  await cartsProvider.initCart();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider()..fetchProduct(),
        ),
        ChangeNotifierProvider.value(
          value: favoritesProvider,
        ),
        ChangeNotifierProvider.value(
          value: cartsProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    );

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shopify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
