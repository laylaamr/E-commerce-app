import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/database_helper.dart';
import 'package:untitled1/services/product_provider.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized

  final favoritesProvider = FavoritesProvider();
  await favoritesProvider.initFavorites(); // Initialize favorites

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider()..fetchProduct(),
        ),
        ChangeNotifierProvider.value(
          value: favoritesProvider,
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shopify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}