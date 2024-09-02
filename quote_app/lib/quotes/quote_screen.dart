import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/quotes/quote_controller.dart';

class QuoteScreen extends StatelessWidget {
  QuoteScreen({super.key});
  QuoteController controller = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote App'),
      ),
      body: Obx(() {
        return controller.quotes.length > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.quotes[0].q,
                  ),
                  Text(
                    controller.quotes[0].a,
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
