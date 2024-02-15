import 'package:chez_meme/pages/ConnectionPage.dart';
import 'package:chez_meme/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ConnectionPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}