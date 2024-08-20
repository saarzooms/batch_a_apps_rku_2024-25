import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Screen')),
      body: Column(
        children: [
          Text('Prodcut Screen'),
          ElevatedButton(
              onPressed: () {
                // Get.to(() => HomeScreen());
                Get.back();
              },
              child: Text('Open Home'))
        ],
      ),
    );
  }
}
