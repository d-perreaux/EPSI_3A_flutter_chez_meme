import 'package:flutter/material.dart';
import 'Navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chez mémé',
      initialRoute: '/',
      onGenerateRoute: Navigation.generateRoute,
    );
  }
}