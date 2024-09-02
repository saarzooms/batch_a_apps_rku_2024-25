import 'package:get/get.dart';
import 'package:quote_app/quotes/quote_model.dart';
import 'package:quote_app/quotes/quote_service.dart';

class QuoteController extends GetxController {
  RxList<Quote> quotes = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }

  fetchDetails() async {
    quotes.clear();
    quotes.addAll(await QuoteService.fetchQuote());
  }
}
