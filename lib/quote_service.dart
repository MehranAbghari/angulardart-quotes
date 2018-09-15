import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'quote.dart';

class QuoteService {
  static const _quotesUrl = 'https://talaikis.com/api/quotes/random/';

  Future<Quote> fetchNew() async {
    try {
      final jsonString = await HttpRequest.getString(_quotesUrl);
      final text = json.decode(jsonString)['quote'];
      final author = json.decode(jsonString)['author'];
      return Quote(text, author);
    } catch (e) {
      print('Error: $e');
    }
  }
}
