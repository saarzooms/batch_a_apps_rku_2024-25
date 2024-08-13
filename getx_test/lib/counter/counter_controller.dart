import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  var maxLimit = 0.obs;
  var price = 0.obs;
  TextEditingController limit = TextEditingController();
  TextEditingController priceTxt = TextEditingController();
  increment() {
    count++;
  }

  decrement() {
    if (count.value > 0) count--;
  }

  reset() {
    count.value = 0;
  }

  setLimit() {
    maxLimit.value = int.parse(limit.text);
    price.value = int.parse(priceTxt.text);
  }
}
