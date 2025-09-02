import 'package:flutter/material.dart';
import '../Models/QuoteModel.dart';
import '../Services/QuotesServices.dart';

class QuotesProvider extends ChangeNotifier {
  final QuotesService _service = QuotesService();
  List<QuoteModel> quotes = [];
  bool isLoading = false;

  Future<void> fetchAllQuotes() async {
    isLoading = true;
    notifyListeners();

    try {
      quotes = await _service.getAllQuotes();
    } catch (e) {
      quotes = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
