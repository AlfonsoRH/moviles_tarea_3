import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/pages/detail/detail.dart';
import 'package:tarea3/providers/search_provider.dart';
import 'pages/home/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SearchBook(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'detail': (context) => DetailPage(),
      },
    );
  }
}
