import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            Text('Home Screen'),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => ProductScreen());
                },
                child: Text('Open Product'))
          ],
        ),
      ),
    );
  }
}
