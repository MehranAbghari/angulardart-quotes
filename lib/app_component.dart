import 'package:angular/angular.dart';
import 'quote.dart';
import 'dart:async';
import 'quote_service.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    providers: [
      ClassProvider(QuoteService)
    ]
)
class AppComponent implements OnInit {
  final title = "Great Words from Great Men";
  Quote q = Quote("Think BIG!", "Unknown");
  final QuoteService _quoteService;

  AppComponent(this._quoteService);

  Future<void> _getQuote() async {
    try {
      q = await _quoteService.fetchNew();
    } catch (e) {
      print('Error: $e');
    }
  }

  getNew() => _getQuote();

  @override
  void ngOnInit() => _getQuote();
}
