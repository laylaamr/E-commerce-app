import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/home/app_bar_widget.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const HomeScreen(),
    const FavoritesScreen(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyCupertinoAppBar(
        deliveryAddress: "Jl. Raya Bogor, No. 12",
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
