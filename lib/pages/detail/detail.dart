//construct detail page of book

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del libro"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: data["volumeInfo"]["imageLinks"] == null
                  ? Image.asset("lib/assets/images/no-image.png",
                      width: 200, height: 200)
                  : Image.network(
                      data["volumeInfo"]["imageLinks"]["thumbnail"],
                      height: 200,
                      width: 200,
                    ),
            ),
            SizedBox(height: 10),
            Text(
              data["volumeInfo"]["title"] == null
                  ? "No hay titulo"
                  : data["volumeInfo"]["title"],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              data["volumeInfo"]["authors"] == null
                  ? "No hay autor"
                  : data["volumeInfo"]["authors"][0],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            /* Text(
              data['description'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
