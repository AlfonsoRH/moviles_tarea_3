import 'package:flutter/cupertino.dart';
import 'package:tarea3/repositories/book_repository.dart';

class SearchBook with ChangeNotifier {
  BookRepository bookRepository = new BookRepository();

  List<dynamic> _books = [];
  List<dynamic> get books => _books;

  void searchBook(word) async {
    _books = await bookRepository.searchBookR(word) as List;
    notifyListeners();
  }
}
