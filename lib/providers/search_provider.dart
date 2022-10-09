import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tarea3/repositories/book_repository.dart';

class SearchBook with ChangeNotifier {
  BookRepository bookRepository = new BookRepository();

  List<dynamic> _books = [];
  List<dynamic> get books => _books;

  bool loading = false;

  void searchBook(word) async {
    loading = true;
    _books = [];
    notifyListeners();
    _books = await bookRepository.searchBookR(word) as List;
    loading = false;
    notifyListeners();
  }
}
