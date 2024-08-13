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
        title: Text('Booking Screen'),
      ),
      body: Center(
        child: Obx(() => c.maxLimit > 0
            ? Column(
                children: [
                  Text(
                    'Remaining seats: ${c.maxLimit.value - c.count.value}',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    'Earning: ${c.price.value * c.count.value}',
                    style: TextStyle(fontSize: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          c.increment();
                        },
                        child: Text('Inc'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          c.reset();
                        },
                        child: Text('Reset'),
                      ),
                      ElevatedButton(
                        onPressed: c.count.value > 0
                            ? () {
                                c.decrement();
                              }
                            : null,
                        child: Text('Dec'),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: c.limit,
                      decoration: InputDecoration(
                        hintText: 'Enter total Capacity',
                        labelText: 'Capacity',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: c.priceTxt,
                      decoration: InputDecoration(
                        hintText: 'Enter Price/seat',
                        labelText: 'Price',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      c.setLimit();
                    },
                    child: Text('Set'),
                  ),
                ],
              )),
      ),
    );
  }
}
