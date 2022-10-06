import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/providers/search_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  String msg = 'Ingrese una palabra para buscar';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Libreria free to play"),
        backgroundColor: Color(0xFF454443),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Provider.of<SearchBook>(context, listen: false)
                          .searchBook(controller.text);
                      msg = 'No se encontraron resultados';
                    },
                  ),
                  hintText: 'Ingrese titulo',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Consumer<SearchBook>(
                builder: (context, book, child) {
                  return book.books.isEmpty
                      ? Column(
                          children: [
                            SizedBox(height: 200),
                            Text(
                              msg,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: book.books.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, 'detail',
                                              arguments: book.books[index]);
                                        },
                                        child: book.books[index]["volumeInfo"]
                                                    ["imageLinks"] ==
                                                null
                                            ? Image.asset(
                                                "lib/assets/images/no-image.png")
                                            : Image.network(book.books[index]
                                                    ["volumeInfo"]["imageLinks"]
                                                ["thumbnail"]),
                                      ),
                                    ),
                                    Text(
                                      book.books[index]["volumeInfo"]
                                                  ["title"] ==
                                              null
                                          ? "No hay titulo"
                                          : book.books[index]["volumeInfo"]
                                              ["title"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      book.books[index]["volumeInfo"]
                                                  ["authors"] ==
                                              null
                                          ? "No hay autor"
                                          : book.books[index]["volumeInfo"]
                                              ["authors"][0],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
            ],
          )),
    );
  }
}
