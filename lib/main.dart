import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chez mémé',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Chez mémé'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Center(
          child: Container(
            height: 100.0, // Hauteur de l'image
            child: Image.asset('assets/images/logo.png'),
          ),
        )
      );
  }
}



