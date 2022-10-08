//construct detail page of book
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int lines = 5;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del libro"),
        actions: [
          IconButton(
            icon: const Icon(Icons.public),
            tooltip: 'Share',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Share',
            onPressed: () async {
              await Share.share(
                  'Titulo: ' +
                      data['volumeInfo']['title'] +
                      '\nPaginas: ' +
                      data['volumeInfo']['pageCount'].toString(),
                  subject: 'Libro');
            },
          ),
        ],
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
              data["volumeInfo"]["publisher"] == null
                  ? 'NA'
                  : data["volumeInfo"]["publishedDate"],
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            Text(
              data['volumeInfo']["pageCount"] == null
                  ? 'NA'
                  : 'Paginas: ' + data['volumeInfo']["pageCount"].toString(),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  lines = lines == 5 ? 100 : 5;
                  setState(() {});
                },
                child: Text(
                  //
                  data["volumeInfo"]["description"] == null
                      ? 'NA'
                      : data["volumeInfo"]["description"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: lines,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'italic',
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
