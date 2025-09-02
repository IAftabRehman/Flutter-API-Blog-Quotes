import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/Models/QuoteModel.dart';

class QuotesService {
  final String baseUrl = "https://dummyjson.com/quotes";

  Future<List<QuoteModel>> getAllQuotes() async {
    final response = await http.get(Uri.parse("$baseUrl?limit=100"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List quotesJson = data['quotes'];
      return quotesJson.map((q) => QuoteModel.fromJson(q)).toList();
    } else {
      throw Exception("Failed to fetch quotes");
    }
  }
}
