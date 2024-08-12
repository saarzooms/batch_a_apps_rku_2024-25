import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/counter/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Center(
        child: Obx(() {
          return Column(
            children: [
              Text(
                'Counter: 0',
                style: TextStyle(fontSize: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Inc'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Dec'),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
