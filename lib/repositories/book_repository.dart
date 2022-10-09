import 'dart:convert';
import 'package:http/http.dart' as http;

class BookRepository {
  List<dynamic> _books = [];

  String api = 'https://www.googleapis.com/books/v1/volumes?q=';

  Future<dynamic> searchBookR(word) async {
    _books = [];
    http.Response res = await http.get(Uri.parse(api + word));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      if (data['items'] != null) {
        _books = data['items'] as List;
        return _books;
      } else {
        return [];
      }
    } else {
      return _books = [];
    }
  }
}
