import 'package:flutter/cupertino.dart';
import 'package:quote_generator/model/quote_model.dart';
import 'package:http/http.dart' as http;
import 'package:quote_generator/utils/constants/constants.dart';

class QuoteServices {
  Future<List<Quote>?> getQuote() async {
    try {
      var url = Uri.parse(AppConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Quote> quote = quoteFromJson(response.body);
        return quote;
      } else {
        // empty list
        return List.empty();
      }
    } catch (e) {
      return List.empty(growable: true);
    }
  }
}
