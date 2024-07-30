import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'dashboard_screen.dart';
import 'product_screen.dart';
import 'splash_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int currIndex = 0;
  List pages = [
    DashboardScreen(),
    ProductScreen(),
    CartScreen(),
    CartScreen(),
    SplashScreen(),
  ];
  bool isCenter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCenter ? pages[4] : pages[currIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isCenter = true;
          setState(() {});
        },
        child: Icon(Icons.add),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.inventory_2,
          Icons.shopping_cart,
          Icons.settings,
        ],
        activeIndex: currIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => currIndex = index),
        //other params
      ),
      // BottomNavigationBar(
      //     // backgroundColor: Colors.green,
      //     currentIndex: currIndex,
      //     onTap: (index) {
      //       log('clicked on $index');
      //       currIndex = index;
      //       setState(() {});
      //     },
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.inventory_2), label: 'Product'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //       // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     ]),
    );
  }
}
