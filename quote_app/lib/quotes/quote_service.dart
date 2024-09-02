import 'package:http/http.dart' as http;
import 'package:quote_app/quotes/quote_model.dart';

class QuoteService {
  static Future<List<Quote>> fetchQuote() async {
    List<Quote> quotes = [];
    var request =
        http.Request('GET', Uri.parse('https://zenquotes.io/api/random'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      print(resp);
      quotes = quoteFromJson(resp);
    } else {
      print(response.reasonPhrase);
    }
    return quotes;
  }
}
