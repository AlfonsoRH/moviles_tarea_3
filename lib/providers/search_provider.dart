import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchBook with ChangeNotifier {
  List<dynamic> _books = [];

  String api = 'https://www.googleapis.com/books/v1/volumes?q=';

  List<dynamic> get books => _books;

  void searchBook(word) async {
    _books = [];
    notifyListeners();
    http.Response res = await http.get(
        Uri.parse('https://www.googleapis.com/books/v1/volumes?q=' + word));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      if (data['items'] != null) {
        _books = data['items'];
        notifyListeners();
      }
    }
  }
}
